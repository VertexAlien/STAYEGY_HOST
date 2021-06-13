import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/container/bookedTile.dart';
import 'package:stayegy_host/container/paddingTile.dart';

import 'booking_confirm_page.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'BOOKINGS',
            style: GoogleFonts.staatliches(
              fontSize: 25,
            ),
          ),
          leading: IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 8,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 30,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Color(0xffa2a2a2),
            labelColor: Color(0xff191919),
            onTap: (index) {},
            tabs: [
              Tab(
                child: Text(
                  'BOOKED',
                  style: GoogleFonts.staatliches(fontSize: 18, color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'PENDINGS',
                  style: GoogleFonts.staatliches(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black,
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        //color: Colors.white,
                        child: Text(
                          'Search by mobile number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                BookedTile(),
              ],
            ),
          ),
          PendingTile(),
        ]),
      ),
    );
  }
}

// Scaffold(
//   appBar: AppBar(
//     backgroundColor: Colors.black,
//     leading: IconButton(
//       padding: EdgeInsets.only(right: 20),
//       iconSize: 5,
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       icon: Padding(
//         padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
//         child: Icon(
//           Icons.arrow_back_ios,
//           size: 25,
//         ),
//       ),
//     ),
//     centerTitle: true,
//     title: Text(
//       'Bookings',
//       style: GoogleFonts.staatliches(
//         fontSize: 25,
//       ),
//     ),
//   ),
//   body: Container(
//     child: CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           backgroundColor: Color(0xff0c0c0c),
//           floating: true,
//           pinned: false,
//           automaticallyImplyLeading: false,
//           title: Center(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(3),
//                 color: Colors.white,
//               ),
//               height: 40,
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.only(left: 15),
//               alignment: Alignment.centerLeft,
//               //color: Colors.white,
//               child: Text(
//                 'Search by mobile number',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (context, index) => ListTile(
//               selected: true,
//               title: GestureDetector(
//                 onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => BookingConfirmPage())),
//                 child: Container(
//                   margin: EdgeInsets.only(top: 16),
//                   padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
//                   color: Color(0xffefefef),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Mr. xyz is staying at Room \$ T007 ', style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black)),
//                       Text('Sami-dual bed || AC (2 days)', style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             childCount: 20,
//           ),
//         ),
//       ],
//     ),
//   ),
// );
