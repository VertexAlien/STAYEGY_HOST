import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricePage extends StatelessWidget {
  const PricePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191919),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(right: 20),
          iconSize: 5,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            // color: Color(0xff191919),
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Price',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.maxFinite,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AC',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text('1200tk',
                          style: GoogleFonts.roboto(
                            fontSize: 40,
                            height: 1.5,
                            color: Colors.white,
                          )),
                      Text(
                        'Stayegy Fee : ${(1200 * 0.2).toInt()}tk',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: double.maxFinite,
                  color: Colors.redAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Single | AC',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text('1200tk',
                          style: GoogleFonts.roboto(
                            fontSize: 40,
                            height: 1.5,
                            color: Colors.white,
                          )),
                      Text(
                        'Stayegy Fee : ${(1200 * 0.2).toInt()}tk',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: double.maxFinite,
                  color: Colors.blueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Single | Non AC',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text('800tk',
                          style: GoogleFonts.roboto(
                            fontSize: 40,
                            height: 1.5,
                            color: Colors.white,
                          )),
                      Text(
                        'Stayegy Fee : ${(800 * 0.2).toInt()}tk',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
