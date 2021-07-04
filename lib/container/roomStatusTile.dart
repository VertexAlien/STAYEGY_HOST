import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';

class RoomStatusTile extends StatelessWidget {
  final BookDetails bookDetails;

  RoomStatusTile({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            '${DateFormat.yMMMMd().format(DateTime.parse(bookDetails.startDate.toDate().toString()))}  -  ${DateFormat.yMMMMd().format(DateTime.parse(bookDetails.endDate.toDate().toString()))}',
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
                            bookDetails.userName,
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
                        color: bookDetails.isCheckedIn ? Color(0xFFec524b) : Colors.amber,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          bookDetails.isCheckedIn ? "CLOSED" : "BOOKED",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff191919),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
