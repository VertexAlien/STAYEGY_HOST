import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomSettingPage extends StatefulWidget {
  @override
  _RoomSettingPageState createState() => _RoomSettingPageState();
}

class _RoomSettingPageState extends State<RoomSettingPage> {
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
          'Rooms Settings',
          style: GoogleFonts.staatliches(
            fontSize: 26,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
