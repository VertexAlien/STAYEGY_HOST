import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy_host/UI/Splash_Page.dart';
import 'package:stayegy_host/UI/home_page.dart';
import 'package:stayegy_host/UI/login_page.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_States.dart';
import 'package:stayegy_host/bloc/Repository/User_Details.dart';

import 'bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'bloc/Authentication_Bloc/Authentication_Events.dart';
import 'bloc/FormBloc/Form_Bloc.dart';
import 'bloc/Login_Bloc/LogIn_Bloc.dart';
import 'bloc/Repository/UserRepository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository userRepository = UserRepository();
  final UserDetails userDetails = UserDetails();
  runApp(
    RepositoryProvider.value(
      value: userRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (context) =>
                  AuthenticationBloc(userRepository: userRepository)
                    ..add(AppStarted())),
          BlocProvider<FormBloc>(create: (context) => FormBloc()),
          BlocProvider<LogInBloc>(
              create: (context) => LogInBloc(
                  userRepository: userRepository, userDetails: userDetails)),
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
            return login_page();
          } else if (state is Authenticated) {
            return HomePage();
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}
