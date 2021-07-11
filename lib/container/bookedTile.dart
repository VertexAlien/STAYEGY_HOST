import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/Screen/check_in_page.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:intl/intl.dart';

class BookedTile extends StatelessWidget {
  final BookDetails bookDetails;

  BookedTile({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (_) => CheckInPage(
                    bookDetails: bookDetails,
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Color(0xffefefef),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          bookDetails.userName != null ? bookDetails.userName : 'Mr xyz',
                          style: GoogleFonts.roboto(fontSize: 16, height: 2, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          bookDetails.userPhoneNumber != null ? "(${bookDetails.userPhoneNumber})" : '124587569854',
                          style: GoogleFonts.roboto(fontSize: 10, height: 2, color: Color(0xff6b6b6b)),
                        ),
                      ],
                    ),
                    Text(
                      bookDetails.totalDiscountedPrice != null ? "৳ ${bookDetails.totalDiscountedPrice.toString()}" : '0',
                      style: GoogleFonts.roboto(fontSize: 16, height: 2, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/key.png',
                              scale: 13,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'ST021,STO13',
                              style: GoogleFonts.roboto(fontSize: 10, height: 1, color: Color(0xff6b6b6b)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/calendar.png',
                              scale: 12,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${DateFormat('dd-MM-yy').format(DateTime.parse(bookDetails.startDate.toDate().toString()))}  -  ${DateFormat('dd-MM-yy').format(DateTime.parse(bookDetails.endDate.toDate().toString()))}',
                              // '${DateTime.parse(bookDetails.dateRange["startDate"].toDate().toString())}',
                              style: GoogleFonts.roboto(fontSize: 8, height: 1.5, color: Color(0xff6b6b6b)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Container(
                        color: bookDetails.endDate.toDate().isBefore(DateTime.now()) ? Colors.red : Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                          child: Text(
                            'CHECK IN',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
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
    );
  }
}
