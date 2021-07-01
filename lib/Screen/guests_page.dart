import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/container/checkOutTile.dart';
import 'package:stayegy_host/container/loading_Overlay.dart';

import 'check_out_page.dart';

class GuestsPage extends StatefulWidget {
  @override
  _GuestsPageState createState() => _GuestsPageState();
}

class _GuestsPageState extends State<GuestsPage> {
  List<BookDetails> guestsList = [];

  Future<List<BookDetails>> getAllBookings(String text) async {
    List filteredBookedList = guestsList;

    filteredBookedList = guestsList.where((book) => book.userPhoneNumber.contains(text)).toList();

    print(filteredBookedList.length);

    return filteredBookedList;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            'Guests',
            style: GoogleFonts.staatliches(
              fontSize: 25,
            ),
          ),
        ),
        body: BlocBuilder<LoadingBloc, LoadingBlocState>(
          buildWhen: (previous, state) {
            if (state is GuestsLoadedState) {
              guestsList = state.loadedGuests;
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            return state is ProccesingState
                ? LoadingOverlay().buildWidget(context)
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: SearchBar<BookDetails>(
                            onSearch: getAllBookings,
                            suggestions: guestsList,
                            buildSuggestion: (var book, int index) {
                              return CheckOutTile(bookDetails: book);
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
                              return CheckOutTile(bookDetails: bookDetails);
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
                  );
          },
        ),
      ),
    );
  }
}
