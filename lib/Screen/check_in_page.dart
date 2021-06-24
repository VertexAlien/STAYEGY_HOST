import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';

class CheckInPage extends StatefulWidget {
  final BookDetails bookDetails;

  CheckInPage({@required this.bookDetails});
  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  String _dropDownValue;

  final List<String> listItem = <String>[
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
    "ST01",
  ];

  ///Can be done with stateless , it might help better performance
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          elevation: 0.5,
          centerTitle: true,
          title: Text(
            'CHECK IN',
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      //Information part start
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Customer:',
                                  style: TextStyle(color: Color(0xff191919), fontSize: 20, fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          color: Color(0xff191919),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.person_fill,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Rasel Morshed',
                                      style: TextStyle(
                                        color: Color(0xff191919),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.phone_fill,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '0191234567',
                                      style: TextStyle(
                                        color: Color(0xff191919),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/dot.png',
                                scale: 11,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Check In Date 14th February,2021',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Check Out Date 16th February,2021',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'images/one_box.png',
                                    scale: 12,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Single | Non AC',
                                    style: TextStyle(fontSize: 12, height: 1),
                                  ),
                                ],
                              ),
                              Container(
                                height: 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff6b6b6b),
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconSize: 0,
                                    hint: Center(
                                      child: Text(
                                        "Room No",
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    isExpanded: true,
                                    value: _dropDownValue,
                                    items: <String>['ST01', 'ST02', 'ST03', 'ST04'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                            child: new Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _dropDownValue = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'images/one_box.png',
                                    scale: 12,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Single | Non AC',
                                    style: TextStyle(fontSize: 12, height: 1),
                                  ),
                                ],
                              ),
                              Container(
                                height: 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff6b6b6b),
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconSize: 0,
                                    hint: Center(
                                      child: Text(
                                        "Room No",
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    isExpanded: true,
                                    value: _dropDownValue,
                                    items: <String>['ST01', 'ST02', 'ST03', 'ST04'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                            child: new Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _dropDownValue = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'images/one_box.png',
                                    scale: 12,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Single | Non AC',
                                    style: TextStyle(fontSize: 12, height: 1),
                                  ),
                                ],
                              ),
                              Container(
                                height: 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff6b6b6b),
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconSize: 0,
                                    hint: Center(
                                      child: Text(
                                        "Room No",
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    isExpanded: true,
                                    value: _dropDownValue,
                                    items: <String>['ST01', 'ST02', 'ST03', 'ST04'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                            child: new Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _dropDownValue = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            color: Color(0xffefefef),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Customer pays',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  height: 2,
                                                  color: Color(0xff6b6b6b),
                                                ),
                                              ),
                                              Text(
                                                '৳ 2000',
                                                style: TextStyle(fontSize: 20, height: 1),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Payment Method',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xff6b6b6b),
                                                ),
                                              ),
                                              Text(
                                                'Pay at Hotel',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  height: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Payment Breakdown',
                                        style: TextStyle(
                                          fontSize: 10,
                                          height: 4,
                                          color: Color(0xFFA1A1A1),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Subtotal',
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              height: 2,
                                              color: Color(0xff191919),
                                            ),
                                          ),
                                          Text(
                                            '2300',
                                            style: TextStyle(
                                              fontSize: 10,
                                              height: 2,
                                              color: Color(0xff6b6b6b),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Customer Pays',
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              height: 2,
                                              color: Color(0xff191919),
                                            ),
                                          ),
                                          Text(
                                            '200',
                                            style: TextStyle(
                                              fontSize: 10,
                                              height: 2,
                                              color: Color(0xff6b6b6b),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'STAYEGY Fee',
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              height: 2,
                                              color: Color(0xff191919),
                                            ),
                                          ),
                                          Text(
                                            '100',
                                            style: TextStyle(
                                              fontSize: 10,
                                              height: 2,
                                              color: Color(0xff6b6b6b),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              left: 20,
              child: Container(
                child: GestureDetector(
                  onTap: null,
                  child: Container(
                    height: 50,
                    width: 190,
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
        ));
  }
}
