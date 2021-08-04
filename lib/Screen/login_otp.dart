import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_State.dart';
import 'package:stayegy_host/container/SnackBar.dart';
import 'package:stayegy_host/container/bottom_button.dart';
import 'package:stayegy_host/container/loading_Overlay.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class LoginOtp extends StatefulWidget {
  final String phoneNumber;

  LoginOtp({@required this.phoneNumber});

  @override
  _LoginOtpState createState() => _LoginOtpState();
}

// ignore: camel_case_types
class _LoginOtpState extends State<LoginOtp> {
  String _otpCode;

  final CountdownController _controller = new CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    final LogInBloc _loginBloc = BlocProvider.of<LogInBloc>(context);
    final AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    TextEditingController otp_getter = new TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is ExceptionState || state is OtpExceptionState) {
            String _message;
            if (state is ExceptionState) {
              _message = state.message;
            } else if (state is OtpExceptionState) {
              _message = state.message;
            }
            Navigator.pop(context);
            SnackBarBuilder().buildSnackBar(context, message: _message, color: Colors.red);
          } else if (state is LogInCompleteState) {
            _authenticationBloc.add(LoggedIn(token: state.getUser().uid, uid: state.getUser().uid));
            // _loginBloc.add(LoadHotelDetailsEvent());
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (state is LoadingState) {
            LoadingOverlay().build(context);
          }
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(90, 150, 70, 0),
              child: Image.asset('images/stayegy host logo.png'),
            ),
            SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) => _otpCode = value,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'ENTER OTP',
                ),
              ),
              // OTPTextField is a dart package: "otp_text_field: ^1.0.1"
              // Link: https://pub.dev/packages/otp_text_field
              // child: OTPTextField(
              //   length: 6,
              //   width: MediaQuery.of(context).size.width,
              //   fieldWidth: 35,
              //   style: TextStyle(fontSize: 35),
              //   textFieldAlignment: MainAxisAlignment.spaceAround,
              //   fieldStyle: FieldStyle.underline,
              //   onCompleted: (code) {
              //     _otpCode = code;
              //     print("Entered otp: " + code);
              //   },
              // ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: BottomButton(
                text: 'SUBMIT',
                disabled: false,
                onTap: () {
                  _loginBloc.add(VerifyOtpEvent(otp: _otpCode));
                  FocusScope.of(context).unfocus();
                  print("hi");
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Countdown(
                  seconds: 59,
                  controller: _controller,
                  build: (_, double time) => !_controller.isCompleted
                      ? RichText(
                          text: TextSpan(children: [
                          TextSpan(
                            text: " Wait ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "00:" + time.toInt().toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]))
                      : TextButton(
                          onPressed: () {
                            BlocProvider.of<LogInBloc>(context).add(SendOtpEvent(phoNo: widget.phoneNumber));
                            SnackBarBuilder().buildSnackBar(context, message: 'Otp Sent!', color: Colors.amber);
                            _controller.restart();
                          },
                          child: Text(
                            "Resend",
                            style: TextStyle(color: Colors.amber),
                          )),
                  onFinished: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
