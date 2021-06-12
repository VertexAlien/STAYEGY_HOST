import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stayegy_host/bloc/Repository/UserRepository.dart';
import 'package:stayegy_host/bloc/Repository/User_Details.dart';
import 'package:stayegy_host/bloc/Repository/hotel.dart';

import 'LogIn_Events.dart';
import 'LogIn_State.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final UserRepository _userRepository;
  final UserDetails _userDetails;
  StreamSubscription subscription;
  UserCredential _userCredential;

  String verID = "";

  LogInBloc({UserRepository userRepository, UserDetails userDetails})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _userDetails = userDetails,
        super(InitialLogInState());

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    if (event is SendOtpEvent) {
      yield LoadingState();

      subscription = sendOtp(event.phoNo).listen((event) {
        add(event);
      });
    } else if (event is OtpSentEvent) {
      yield OtpSentState();
    } else if (event is LogInCompleteEvent) {
      yield LogInCompleteState(event.firebaseUser);
    } else if (event is LogInExceptionEvent) {
      yield ExceptionState(message: event.message);
    } else if (event is VerifyOtpEvent) {
      yield LoadingState();
      try {
        _userCredential = await _userRepository.verifyAndLogin(verID, event.otp);
        if (_userCredential.user != null) {
          yield LogInCompleteState(_userCredential.user);
        } else {
          yield OtpExceptionState(message: "Invalid otp!");
        }
      } catch (e) {
        yield OtpExceptionState(message: 'Invalid otp!');
        print(e);
      }
    } else if (event is UploadDetailsEvent) {
      yield LoadingState();
      await _userRepository.uploadUserDetails(user: _userDetails, name: event.name, email: event.email, phoneNumber: _userCredential.user.phoneNumber, gender: event.gender, image: event.image);
      yield RegistrationCompleteState(_userCredential.user);
    } else if (event is LoadHotelDetailsEvent) {
      yield* _mapLoadHomePageEventToState(event);
    } else if (event is HomePageReloadEvent) {
      yield LoadingState();

      yield* _mapLoadHomePageEventToState(event);
    }
  }

  @override
  void onEvent(LogInEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(stackTrace);
  }

  @override
  Future<void> close() {
    print('Bloc Closed');
    return super.close();
  }

  Stream<LogInEvent> sendOtp(String phoNo) async* {
    StreamController<LogInEvent> eventStream = StreamController();
    final PhoneVerificationCompleted = (AuthCredential authCredential) {
      _userRepository.getUser();
      _userRepository.getUser().catchError((onError) {
        print(onError);
      }).then((user) {
        eventStream.add(LogInCompleteEvent(user));
        eventStream.close();
      });
    };
    final PhoneVerificationFailed = (FirebaseAuthException firebaseAuthException) {
      print(firebaseAuthException.message);
      eventStream.add(LogInExceptionEvent(onError.toString()));
      eventStream.close();
    };

    final PhoneCodeSent = (String verId, [int forceResent]) {
      this.verID = verId;
      eventStream.add(OtpSentEvent());
    };

    final PhoneCodeAutoRetrievalTimeout = (String verId) {
      this.verID = verId;
      eventStream.close();
    };

    await _userRepository.sendOTP(phoNo, Duration(seconds: 1), PhoneVerificationCompleted, PhoneVerificationFailed, PhoneCodeSent, PhoneCodeAutoRetrievalTimeout);
    yield* eventStream.stream;
  }

  Stream<LogInState> _mapLoadHomePageEventToState(LogInEvent event) async* {
    Hotel hotel = await _userRepository.getHotelDetails();

    yield LoadHotelDetailsCompleteState(hotel: hotel);
  }
}
