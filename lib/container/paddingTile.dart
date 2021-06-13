import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingTile extends StatelessWidget {
  const PendingTile({
    Key key,
  }) : super(key: key);

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
                          'Mr. Abu Saif',
                          style: GoogleFonts.roboto(fontSize: 14, height: 2, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(01760147561)',
                          style: GoogleFonts.roboto(fontSize: 10, height: 2, color: Color(0xff6b6b6b)),
                        ),
                      ],
                    ),
                    Text(
                      '৳520',
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
                          'JUNE 20 - JUNE 22',
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
