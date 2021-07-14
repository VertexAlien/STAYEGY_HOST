import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
          'CONTACT',
          style: GoogleFonts.roboto(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
      ),
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xfff4f4f4),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Contact With STAYEGY',
                        style: TextStyle(fontSize: 16, color: Color(0xff191919)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/phone icon.png',
                          scale: 6,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          '0130142875',
                          style: TextStyle(fontSize: 14, color: Color(0xff191919)),
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
                    padding: const EdgeInsets.only(left: 40),
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
                          style: TextStyle(fontSize: 14, color: Color(0xff191919)),
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
                          style: TextStyle(fontSize: 14, color: Color(0xff191919)),
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
                          style: TextStyle(fontSize: 14, color: Color(0xff191919)),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xfff4f4f4),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Payment Method',
                        style: TextStyle(fontSize: 16, color: Color(0xff191919)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/bank icon.png',
                            scale: 12,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'Bank Pay',
                            style: TextStyle(fontSize: 14, color: Color(0xff191919)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder: (context, setState) {
                              return AlertDialog(
                                content: Container(
                                  padding: EdgeInsets.all(8.0),
                                  height: 220,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: 'Please submit your payment through those banks and accounts. Also, use ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Stayegy INC. ',
                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            TextSpan(
                                              text: 'as an account name',
                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: '1. Bank Name : ',
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Eastern Bank Limited',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Account Number : ',
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '138-41-874-004',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: '1. Bank Name : ',
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Dutch Bangla Bank Limited',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Account Number : ',
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '138-427-45-0075',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Note : ',
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'You are requested to contact with ',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                              ),
                                              TextSpan(
                                                text: 'STAYEGY ',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                              ),
                                              TextSpan(
                                                text: 'before and afer the payment ',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Divider(
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          right: 20,
          left: 20,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Office',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffa2a2a2),
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'House no 27/11/48/2',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffa2a2a2),
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Road 4B Aftabnagar',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    height: 1.5,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffa2a2a2),
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Dhaka 1212',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    height: 1.5,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffa2a2a2),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
