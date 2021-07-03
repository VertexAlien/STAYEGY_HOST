import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/container/loading_Overlay.dart';
import 'package:stayegy_host/container/roomStatusTile.dart';

class RoomStatus extends StatefulWidget {
  final String roomNo;

  RoomStatus({@required this.roomNo});

  @override
  _RoomStatusState createState() => _RoomStatusState();
}

class _RoomStatusState extends State<RoomStatus> {
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
          'ROOM ${widget.roomNo}',
          style: GoogleFonts.staatliches(
            fontSize: 26,
          ),
        ),
      ),
      body: BlocBuilder<LoadingBloc, LoadingBlocState>(
        builder: (context, state) {
          return state is LoadedRoomsBookingsState
              ? Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.bookings.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: state.bookings[index].isCheckedIn ? Color(0xFFec524b) : Colors.amber,
                                child: RoomStatusTile(
                                  bookDetails: state.bookings[index],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              : state is ProccesingState
                  ? LoadingOverlay().buildWidget(context)
                  : Container();
        },
      ),
    );
  }
}
