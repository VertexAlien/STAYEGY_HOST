import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        body: BlocListener<LoadingBloc, LoadingState>(
          listener: (context, state) {
            if (state is ProccesingState) {
              LoadingOverlay().build(context);
            } else if (state is BoookingListLoadedState) {
              bookedList = state.bookedList;
              pendingList = state.pendingList;
            }
          },
          child: BlocBuilder<LoadingBloc, LoadingState>(
            builder: (context, state) {
              return TabBarView(children: [
                state is BoookingListLoadedState
                    ? Container(
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
                            // ListView.builder(
                            //     itemCount: 2,
                            //     itemBuilder: (context, index) {
                            //       return BookedTile();
                            //     })

                            Expanded(
                              child: ListView.builder(
                                itemCount: bookedList.length,
                                itemBuilder: (context, index) {
                                  return BookedTile(
                                    bookDetails: bookedList[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : LoadingOverlay().buildWidget(context),
                state is BoookingListLoadedState
                    ? ListView.builder(
                        itemCount: pendingList.length,
                        itemBuilder: (context, index) {
                          return PendingTile(
                            bookDetails: pendingList[index],
                          );
                        },
                      )
                    : LoadingOverlay().buildWidget(context),
              ]);
            },
          ),
        ),
      ),
    ));
  }
}
