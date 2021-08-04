import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stayegy_host/bloc/Repository/UserRepository/UserRepository.dart';
import 'package:stayegy_host/bloc/Repository/UserRepository/User_Details.dart';

import 'Authentication_Events.dart';
import 'Authentication_States.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({UserRepository userRepository, UserDetails userDetails})
      : _userRepository = userRepository,
        super(InitialAuthenticationState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await _userRepository.getUser() != null;
      final user = await _userRepository.getUser();
      if (hasToken) {
        final bool isRegistered = await _userRepository.checkForRegistration(user.uid);
        if (isRegistered) {
          yield Authenticated();
        } else {
          yield NotRegistered();
        }
      } else {
        yield Unauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield Loading();
      final bool isRegistered = await _userRepository.checkForRegistration(event.uid);

      if (isRegistered) {
        yield Authenticated();
      } else {
        yield NotRegistered();
      }
    }
    if (event is LoggedOut) {
      yield Loading();
      _userRepository.logOut();
      yield Unauthenticated();
    }
  }

  @override
  void onEvent(AuthenticationEvent event) {
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
}
