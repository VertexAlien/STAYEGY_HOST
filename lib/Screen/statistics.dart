import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
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
            'STATISTICS',
            style: GoogleFonts.staatliches(
              fontSize: 26,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 180,
                width: 500,
                color: Color(0xfff4f4f4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '৳1,01500',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 1, color: Color(0xff5bc48b)),
                    ),
                    Text(
                      'Total Earnings',
                      style: TextStyle(fontSize: 12, height: 1, color: Color(0xff191919)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 500,
                color: Color(0xfff4f4f4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '185',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 0, color: Color(0xff5bc48b)),
                    ),
                    Text(
                      'Total Reaches',
                      style: TextStyle(fontSize: 12, height: 1.5, color: Color(0xff191919)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Checkins',
                      style: TextStyle(fontSize: 13, color: Color(0xff191919)),
                    ),
                    Text(
                      '123',
                      style: TextStyle(fontSize: 13, color: Color(0xff191919)),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weekly Earnings',
                      style: TextStyle(fontSize: 13, color: Color(0xff191919)),
                    ),
                    Text(
                      '৳ 14520',
                      style: TextStyle(fontSize: 13, color: Color(0xff191919)),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stayegy Due',
                      style: TextStyle(fontSize: 13, color: Color(0xff191919)),
                    ),
                    Text(
                      '৳ 2,904',
                      style: TextStyle(fontSize: 13, color: Color(0xff191919)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Last Due Cleared',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, height: 0, color: Color(0xff191919)),
                    ),
                    Text(
                      '25/01022',
                      style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xff5bc48b)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
