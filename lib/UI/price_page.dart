import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricePage extends StatelessWidget {
  const PricePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Color(0xff191919),
            size: 30,
          ),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Room Type & Price',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                color: Color(0xEFF8F4F2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('AC'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Room price:',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                          Text('1200tk',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xEFF8F4F2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Single',
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Room price:',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                          Text('1200tk',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xEFF8F4F2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Semi-Double'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Room price:',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                          Text('1200tk',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xEFF8F4F2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Double'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Room price:',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                          Text('1200tk',
                              style:
                                  GoogleFonts.roboto(fontSize: 15, height: 2)),
                        ],
                      ),
                    ],
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
