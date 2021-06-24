import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomStatus extends StatefulWidget {
  @override
  _RoomStatusState createState() => _RoomStatusState();
}

class _RoomStatusState extends State<RoomStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          padding: EdgeInsets.only(right: 20),
          iconSize: 5,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'ROOM 104',
          style: GoogleFonts.staatliches(
            fontSize: 26,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'images/calendar.png',
                                  scale: 10,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '20 July, 2021  -  22 July, 2021',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1, color: Color(0xff191919)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'images/user icon.png',
                                  scale: 12,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Mr. Abdullah',
                                  style: GoogleFonts.roboto(fontSize: 12, height: 2, color: Color(0xff191919)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                          child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFec524b),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Text(
                                "CLOSED",
                                style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff191919)),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
