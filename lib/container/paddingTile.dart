import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:intl/intl.dart';

class PendingTile extends StatelessWidget {
  final BookDetails bookDetails;

  PendingTile({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Color(0xffefefef),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          bookDetails.userName != null ? bookDetails.userName : 'Mr xyz',
                          style: GoogleFonts.roboto(fontSize: 14, height: 2, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bookDetails.userPhoneNumber != null ? bookDetails.userPhoneNumber : '124587569854',
                          style: GoogleFonts.roboto(fontSize: 10, height: 2, color: Color(0xff6b6b6b)),
                        ),
                      ],
                    ),
                    Text(
                      bookDetails.totalDiscountedPrice != null ? bookDetails.totalDiscountedPrice.toString() : '0',
                      style: GoogleFonts.roboto(fontSize: 16, height: 2, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ST021,STO13',
                          style: GoogleFonts.roboto(fontSize: 10, height: 2, color: Color(0xff6b6b6b)),
                        ),
                        Text(
                          // '${DateFormat('dd-MM-yy').format(DateTime.fromMicrosecondsSinceEpoch(bookDetails.dateRange["startDate"]))}  -  ${DateFormat('dd-MM-yy').format(DateTime.fromMicrosecondsSinceEpoch(bookDetails.dateRange["endDate"]))}',
                          '${bookDetails.dateRange["startDate"]}',
                          style: GoogleFonts.roboto(fontSize: 10, height: 2, color: Color(0xff6b6b6b)),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'ACCEPT',
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
