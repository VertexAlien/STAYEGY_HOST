import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotRegistered extends StatefulWidget {
  @override
  _NotRegisteredState createState() => _NotRegisteredState();
}

class _NotRegisteredState extends State<NotRegistered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.only(left: 30),
            onPressed: () {},
            child: Image.asset(
              'images/log out (host).png',
              color: Colors.black,
              scale: 2.8,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                'images/not_registered_hotel.png',
                scale: 3,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'You do not have any registered hotel.',
                style: GoogleFonts.roboto(
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  color: Color(0xff191919),
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'To register your hotel you are requested',
                style: GoogleFonts.roboto(
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  color: Color(0xff191919),
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: ("to Contact with "),
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff191919),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  TextSpan(
                    text: "STAYEGY ",
                    style: GoogleFonts.roboto(fontSize: 14, color: Color(0xff191919), fontWeight: FontWeight.w400),
                  ),
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/phone icon.png',
                      scale: 5.8,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      '0130142875',
                      style: TextStyle(fontSize: 12, color: Color(0xff191919), fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Divider(
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/mail icon.png',
                      scale: 6,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'host.contact@stayegy.com',
                      style: TextStyle(fontSize: 12, color: Color(0xff191919), fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Divider(
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/mess.png',
                      scale: 20,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'messenger/Stayegy',
                      style: TextStyle(fontSize: 12, color: Color(0xff191919), fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Divider(
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/wh.png',
                      scale: 180,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      '0130142875',
                      style: TextStyle(fontSize: 12, color: Color(0xff191919), fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
