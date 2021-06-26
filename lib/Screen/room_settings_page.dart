import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomSettingPage extends StatefulWidget {
  @override
  _RoomSettingPageState createState() => _RoomSettingPageState();
}

class _RoomSettingPageState extends State<RoomSettingPage> {
  String _radioValue;
  String _radioReasonValue;
  String choice;

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                width: 500,
                color: Color(0xfff4f4f4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Room Number',
                      style: TextStyle(fontSize: 15, height: 1, color: Color(0xff191919)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120),
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Center(
                    child: Text(
                      '105',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 500,
                color: Color(0xfff4f4f4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Date',
                      style: TextStyle(fontSize: 15, height: 1, color: Color(0xff191919)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120),
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Center(
                    child: Text(
                      '20/05-22/05',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 500,
                color: Color(0xfff4f4f4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Status',
                      style: TextStyle(fontSize: 15, height: 1, color: Color(0xff191919)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff191919),
                          value: 'Book',
                          groupValue: _radioValue,
                          onChanged: (value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                        Text(
                          "Book",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff191919),
                          value: 'Close',
                          groupValue: _radioValue,
                          onChanged: (value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                        Text(
                          "Close",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 500,
                color: Color(0xfff4f4f4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Reason',
                      style: TextStyle(fontSize: 15, height: 1, color: Color(0xff191919)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff191919),
                          value: 'Waliking Customer',
                          groupValue: _radioReasonValue,
                          onChanged: (value) {
                            setState(() {
                              _radioReasonValue = value;
                            });
                          },
                        ),
                        Text(
                          "Waliking Customer",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Color(0xff191919),
                          value: 'Maintenance',
                          groupValue: _radioReasonValue,
                          onChanged: (value) {
                            setState(() {
                              _radioReasonValue = value;
                            });
                          },
                        ),
                        Text(
                          "Maintenance",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: GestureDetector(
                    onTap: null,
                    child: Container(
                      height: 40,
                      width: 350,
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text(
                        'CONFIRM',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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
