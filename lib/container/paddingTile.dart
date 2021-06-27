import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/Screen/booking_confirm_page.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:intl/intl.dart';

class PendingTile extends StatelessWidget {
  final BookDetails bookDetails;

  PendingTile({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LoadingBloc>(context).add(LoadFreeRoomsEvent(bookDetails: bookDetails));
        Navigator.push(context, CupertinoPageRoute(builder: (_) => BookingConfirmPage(bookDetails: bookDetails)));
      },
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
                    Text(
                      bookDetails.userName != null ? bookDetails.userName : 'Mr xyz',
                      style: GoogleFonts.roboto(fontSize: 16, height: 2, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookDetails.totalDiscountedPrice != null ? "৳ ${bookDetails.totalDiscountedPrice.toString()}" : '৳ 0',
                      style: GoogleFonts.roboto(fontSize: 16, height: 1, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
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
                              scale: 11,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${DateFormat('dd-MM-yy').format(DateTime.parse(bookDetails.startDate.toDate().toString()))}  -  ${DateFormat('dd-MM-yy').format(DateTime.parse(bookDetails.endDate.toDate().toString()))}',
                              style: GoogleFonts.roboto(fontSize: 12, height: 1, color: Color(0xff6b6b6b)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/key.png',
                              scale: 10,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '${bookDetails.selectedRooms.length} ROOMS',
                              style: GoogleFonts.roboto(fontSize: 10, height: 1, color: Color(0xff6b6b6b)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
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
