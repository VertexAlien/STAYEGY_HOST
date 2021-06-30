import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookRepository.dart';
import 'package:stayegy_host/container/bookedTile.dart';
import 'package:stayegy_host/container/loading_Overlay.dart';
import 'package:stayegy_host/container/paddingTile.dart';

import 'booking_confirm_page.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<BookDetails> bookedList = [];
  List<BookDetails> pendingList = [];

  Future<List<BookDetails>> getAllBookings(String text) async {
    List filteredBookedList = bookedList;

    filteredBookedList = bookedList.where((book) => book.userPhoneNumber.contains(text)).toList();

    print(filteredBookedList.length);

    return filteredBookedList;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            //toolbarHeight: 30,
            backgroundColor: Colors.black,
            elevation: 0,
            centerTitle: true,
            // title: Text(
            //   'BOOKINGS',
            //   style: GoogleFonts.staatliches(
            //     fontSize: 25,
            //   ),
            // ),
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
              unselectedLabelColor: Color(0xffa2a2a2),
              labelColor: Color(0xff191919),
              onTap: (index) {},
              tabs: [
                Tab(
                  child: Text(
                    'BOOKED',
                    style: GoogleFonts.staatliches(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'PENDINGS',
                    style: GoogleFonts.staatliches(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: BlocListener<LoadingBloc, LoadingBlocState>(
            listener: (context, state) {
              if (state is ProccesingState) {
                LoadingOverlay().build(context);
              } else if (state is BoookingListLoadedState) {
                bookedList = state.bookedList;
                pendingList = state.pendingList;
              }
            },
            child: BlocBuilder<LoadingBloc, LoadingBlocState>(
              builder: (context, state) {
                return TabBarView(children: [
                  state is ProccesingState
                      ? LoadingOverlay().buildWidget(context)
                      : Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: SearchBar<BookDetails>(
                                  onSearch: getAllBookings,
                                  suggestions: bookedList,
                                  buildSuggestion: (var book, int index) {
                                    return BookedTile(bookDetails: book);
                                  },
                                  minimumChars: 3,
                                  hintText: 'Search with PhoneNo...',
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 1,
                                  crossAxisCount: 1,
                                  listPadding: EdgeInsets.all(0),
                                  searchBarStyle: SearchBarStyle(
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.all(0),
                                  ),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      CupertinoIcons.search,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  onItemFound: (BookDetails bookDetails, int index) {
                                    return BookedTile(bookDetails: bookDetails);
                                  },
                                  emptyWidget: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Booking Found!',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                  // Container(
                  //     child: Column(
                  //       children: [
                  //         Center(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(16),
                  //             child: Align(
                  //               alignment: Alignment.topCenter,
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(3),
                  //                   color: Colors.black,
                  //                 ),
                  //                 height: 40,
                  //                 width: MediaQuery.of(context).size.width,
                  //                 padding: EdgeInsets.only(left: 15),
                  //                 alignment: Alignment.centerLeft,
                  //                 //color: Colors.white,
                  //                 child: Text(
                  //                   'Search by mobile number',
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 14,
                  //                     fontWeight: FontWeight.w400,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         // ListView.builder(
                  //         //     itemCount: 2,
                  //         //     itemBuilder: (context, index) {
                  //         //       return BookedTile();
                  //         //     })

                  //         Expanded(
                  //           child: ListView.builder(
                  //             itemCount: bookedList.length,
                  //             itemBuilder: (context, index) {
                  //               return BookedTile(
                  //                 bookDetails: bookedList[index],
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  state is ProccesingState
                      ? LoadingOverlay().buildWidget(context)
                      : ListView.builder(
                          itemCount: pendingList.length,
                          itemBuilder: (context, index) {
                            return PendingTile(
                              bookDetails: pendingList[index],
                            );
                          },
                        ),
                ]);
              },
            ),
          ),
        ),
      )),
    );
  }
}
