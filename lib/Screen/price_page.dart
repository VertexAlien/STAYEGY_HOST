import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/constants/constant.dart';

class PricePage extends StatelessWidget {
  const PricePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff191919),
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
          child: LimitedBox(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: double.maxFinite,
            child: ListView.builder(
              itemCount: hotelDetailsGlobal.roomPrices.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: index == hotelDetailsGlobal.roomPrices.length - 1 ? 350 : 300,
                      width: double.maxFinite,
                      // color: Colors.green,
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            hotelDetailsGlobal.roomPrices.keys.elementAt(index),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Text('${hotelDetailsGlobal.roomPrices.values.elementAt(index)}tk',
                              style: GoogleFonts.roboto(
                                fontSize: 40,
                                height: 1.5,
                                color: Colors.white,
                              )),
                          Text(
                            'Stayegy Fee : ${(hotelDetailsGlobal.roomPrices.values.elementAt(index) * 0.2).toInt()}tk',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
