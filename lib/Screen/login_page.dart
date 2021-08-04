import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stayegy_host/bloc/FormBloc/Form_Bloc.dart';
import 'package:stayegy_host/bloc/FormBloc/Form_Events.dart';
import 'package:stayegy_host/bloc/FormBloc/Form_States.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_State.dart';
import 'package:stayegy_host/container/SnackBar.dart';
import 'package:stayegy_host/container/loading_Overlay.dart';

import 'login_otp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = BlocProvider.of<FormBloc>(context);
    final LogInBloc logInBloc = BlocProvider.of<LogInBloc>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: BlocListener<LogInBloc, LogInState>(
          listener: (context, state) {
            if (state is LoadingState) {
              LoadingOverlay().build(context);
            } else if (state is OtpSentState) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => login_otp()));
            } else if (state is ExceptionState) {
              Navigator.pop(context);

              SnackBarBuilder().buildSnackBar(
                context,
                message: "Error.. Confirm reCaptcha",
                color: Colors.red,
              );
            }
          },
          child: Stack(
            children: <Widget>[
              //Container for logo
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(90, 200, 70, 0),
                child: Image.asset('images/stayegy host logo.png'),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
                  height: 358,
                  padding: EdgeInsets.fromLTRB(30, 150, 30, 150),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffd7d7d7),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Image.asset(
                              'images/BD Flag.png',
                              scale: 140,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Color(0xffd7d7d7),
                          thickness: 1,
                          width: 2,
                          indent: 8,
                          endIndent: 8,
                        ),
                        Expanded(
                          flex: 10,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 10),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              onChanged: (value) {
                                formBloc.add(PhoneNumberCheckEvent(phoneNumber: value));
                                _phoneNumber = value;
                              },

                              /// TODO: Decorate the textfield perfectly
                              decoration: InputDecoration(
                                hintText: 'Enter Number',
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: BlocBuilder<FormBloc, FormStates>(
                            builder: (context, state) {
                              return Container(
                                //color: Colors.black87,
                                color: state is PhoneNumberNotCheckedState
                                    ? Colors.black12
                                    : state is PhoneNumberCheckedState
                                        ? Colors.black87
                                        : Colors.black12,
                                margin: EdgeInsets.only(left: 25),
                                child: FlatButton(
                                  onPressed: () {
                                    print('Pressed!456');
                                    if (state is PhoneNumberCheckedState) {
                                      logInBloc.add(
                                        SendOtpEvent(phoNo: '+880' + _phoneNumber),
                                      );
                                    }
                                  },
                                  child: Image(
                                    image: AssetImage(state is PhoneNumberNotCheckedState
                                        ? 'images/arrow button default.png'
                                        : state is PhoneNumberCheckedState
                                            ? 'images/arrow button submit.png'
                                            : 'images/arrow button default.png'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
