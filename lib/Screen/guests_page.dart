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
              : Container(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Color(0xff0c0c0c),
                        floating: true,
                        pinned: false,
                        automaticallyImplyLeading: false,
                        title: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            //color: Colors.white,
                            child: Text(
                              'Search by mobile number',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => ListTile(
                            contentPadding: EdgeInsets.all(0),
                            selected: true,
                            title: CheckOutTile(bookDetails: guestsList[index]),
                          ),
                          childCount: guestsList.length,
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
