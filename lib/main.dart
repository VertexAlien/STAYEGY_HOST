import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy_host/Screen/not_registered.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_States.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookRepository.dart';
import 'Screen/Splash_Page.dart';
import 'Screen/home_page.dart';
import 'Screen/login_page.dart';
import 'bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'bloc/Authentication_Bloc/Authentication_Events.dart';
import 'bloc/FormBloc/Form_Bloc.dart';
import 'bloc/Login_Bloc/LogIn_Bloc.dart';
import 'bloc/Repository/UserRepository/UserRepository.dart';
import 'bloc/Repository/UserRepository/User_Details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository userRepository = UserRepository();
  final UserDetails userDetails = UserDetails();
  final BookRepository bookRepository = BookRepository();
  runApp(
    RepositoryProvider.value(
      value: userRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc(userRepository: userRepository)..add(AppStarted())),
          BlocProvider<FormBloc>(create: (context) => FormBloc()),
          BlocProvider<LoadingBloc>(create: (context) => LoadingBloc(bookRepository: bookRepository)),
          BlocProvider<LogInBloc>(create: (context) => LogInBloc(userRepository: userRepository, userDetails: userDetails)),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff191919),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashPage();
          } else if (state is Unauthenticated) {
            return LoginPage();
          } else if (state is Authenticated) {
            BlocProvider.of<LogInBloc>(context).add(LoadHotelDetailsEvent());
            return HomePage();
          } else if (state is NotRegistered) {
            return NotRegisteredPage();
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}
