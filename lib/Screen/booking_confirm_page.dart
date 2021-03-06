import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';

import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/constants/constant.dart';
import 'package:stayegy_host/container/SnackBar.dart';
import 'package:stayegy_host/container/loading_Overlay.dart';

class BookingConfirmPage extends StatefulWidget {
  final BookDetails bookDetails;

  BookingConfirmPage({@required this.bookDetails});
  @override
  _BookingConfirmPageState createState() => _BookingConfirmPageState();
}

class _BookingConfirmPageState extends State<BookingConfirmPage> {
  List freeRooms = [];

  List bookedRooms;
  String roomType1, roomType2, roomType3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          elevation: 0.5,
          centerTitle: true,
          title: Text(
            'REQUESTS',
            style: GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: BlocListener<LoadingBloc, LoadingBlocState>(
          listener: (context, state) {
            if (state is ProccesingState) {
              LoadingOverlay().build(context);
            } else if (state is FreeRoomsLoadedState) {
              Navigator.pop(context);
            } else if (state is RoomConfirmedState) {
              Navigator.popUntil(context, (route) => route.isFirst);
            } else if (state is RoomConfirmedFailedState) {
              Navigator.pop(context);

              SnackBarBuilder().buildSnackBar(
                context,
                message: "Room Book Failed!",
                color: Colors.red,
              );
            } else if (state is BookCancelledState) {
              Navigator.popUntil(context, (route) => route.isFirst);
            } else if (state is BookCancelledFailedState) {
              Navigator.pop(context);

              SnackBarBuilder().buildSnackBar(
                context,
                message: "Book Reject Failed. Try again later.",
                color: Colors.red,
              );
            }
          },
          child: BlocBuilder<LoadingBloc, LoadingBlocState>(
            buildWhen: (previousstate, state) {
              if (state is FreeRoomsLoadedState) {
                freeRooms = state.rooms;
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
                        child: Column(
                          children: [
                            //Information part start
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order ID: #${widget.bookDetails.bid}',
                                      style: TextStyle(color: Color(0xff191919), fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.person_fill,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: '${widget.bookDetails.userName}',
                                            style: TextStyle(
                                              color: Color(0xff191919),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.phone_fill,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: '${widget.bookDetails.userPhoneNumber}',
                                            style: TextStyle(
                                              color: Color(0xff191919),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/dot.png',
                                      scale: 11,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Check In Date ${DateFormat.yMMMMd().format(DateTime.parse(widget.bookDetails.startDate.toDate().toString()))}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Check Out Date ${DateFormat.yMMMMd().format(DateTime.parse(widget.bookDetails.endDate.toDate().toString()))}',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                LimitedBox(
                                  // height: 150,
                                  // width: double.maxFinite,
                                  // alignment: Alignment.centerLeft,
                                  maxHeight: 150,
                                  maxWidth: double.maxFinite,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.bookDetails.selectedRooms.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'images/one_box.png',
                                                  scale: 12,
                                                  fit: BoxFit.fill,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '${widget.bookDetails.selectedRooms[index]}',
                                                  style: TextStyle(fontSize: 12, height: 1),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 20,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xff6b6b6b),
                                                ),
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  iconSize: 0,
                                                  hint: Center(
                                                    child: Text(
                                                      "Room No",
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  isExpanded: true,
                                                  value: index == 0
                                                      ? roomType1
                                                      : index == 1
                                                          ? roomType2
                                                          : roomType3,
                                                  items: freeRooms.map((value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Center(
                                                          child: new Text(
                                                        value,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      )),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(
                                                      () {
                                                        if (index == 0) {
                                                          roomType1 = value;
                                                        } else if (index == 1) {
                                                          roomType2 = value;
                                                        } else if (index == 2) {
                                                          roomType3 = value;
                                                        }
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Color(0xffefefef),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Customer pays',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        height: 2,
                                                        color: Color(0xff6b6b6b),
                                                      ),
                                                    ),
                                                    Text(
                                                      '??? ${widget.bookDetails.totalDiscountedPrice}',
                                                      style: TextStyle(fontSize: 20, height: 1),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Payment Method',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Color(0xff6b6b6b),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Pay at Hotel',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Payment Breakdown',
                                              style: TextStyle(
                                                fontSize: 10,
                                                height: 4,
                                                color: Color(0xFFA1A1A1),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Subtotal',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 10,
                                                    height: 2,
                                                    color: Color(0xff191919),
                                                  ),
                                                ),
                                                Text(
                                                  '${widget.bookDetails.totalPrice}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    height: 2,
                                                    color: Color(0xff6b6b6b),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Customer Pays',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 10,
                                                    height: 2,
                                                    color: Color(0xff191919),
                                                  ),
                                                ),
                                                Text(
                                                  '${widget.bookDetails.totalDiscountedPrice}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    height: 2,
                                                    color: Color(0xff6b6b6b),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'STAYEGY Fee',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 10,
                                                    height: 2,
                                                    color: Color(0xff191919),
                                                  ),
                                                ),
                                                Text(
                                                  '${((widget.bookDetails.totalPrice * 0.2) - (widget.bookDetails.totalPrice - widget.bookDetails.totalDiscountedPrice)).toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    height: 2,
                                                    color: Color(0xff6b6b6b),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
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
                  Positioned(
                    bottom: 10,
                    right: 1,
                    left: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 50,
                              width: 170,
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: Text(
                                'REJECT',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              BlocProvider.of<LoadingBloc>(context).add(CancelBookEvent(bookDetails: widget.bookDetails));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              height: 50,
                              width: 170,
                              alignment: Alignment.center,
                              color: Colors.black,
                              child: Text(
                                'CONFIRM',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              bool isConfirmed = false;
                              switch (widget.bookDetails.selectedRooms.length) {
                                case 1:
                                  if (roomType1 != null) {
                                    bookedRooms = [];

                                    bookedRooms.add(roomType1);
                                    isConfirmed = true;
                                  } else {
                                    SnackBarBuilder().buildSnackBar(
                                      context,
                                      message: "Room Type Not Selected!",
                                      color: Colors.red,
                                    );
                                  }
                                  break;
                                case 2:
                                  if (roomType1 != null && roomType2 != null) {
                                    bookedRooms = [];

                                    if (roomType1 != roomType2) {
                                      bookedRooms.addAll([roomType1, roomType2]);
                                      isConfirmed = true;
                                    } else {
                                      SnackBarBuilder().buildSnackBar(
                                        context,
                                        message: "Room No. can not be same!",
                                        color: Colors.red,
                                      );
                                    }
                                  } else {
                                    SnackBarBuilder().buildSnackBar(
                                      context,
                                      message: "Room No. not Selected!",
                                      color: Colors.red,
                                    );
                                  }
                                  break;
                                case 3:
                                  if (roomType1 != null && roomType2 != null && roomType3 != null) {
                                    bookedRooms = [];

                                    if (roomType1 != roomType2 && roomType1 != roomType3 && roomType2 != roomType3) {
                                      bookedRooms.addAll([roomType1, roomType2, roomType3]);
                                      isConfirmed = true;
                                    } else {
                                      SnackBarBuilder().buildSnackBar(
                                        context,
                                        message: "Room No. can not be same!",
                                        color: Colors.red,
                                      );
                                    }
                                  } else {
                                    SnackBarBuilder().buildSnackBar(
                                      context,
                                      message: "Room No. not Selected!",
                                      color: Colors.red,
                                    );
                                  }
                                  break;
                                default:
                                  SnackBarBuilder().buildSnackBar(
                                    context,
                                    message: "Room Selection Error!",
                                    color: Colors.red,
                                  );
                              }

                              if (isConfirmed) {
                                widget.bookDetails.status = 'booked';
                                widget.bookDetails.bookedRooms = bookedRooms;

                                BlocProvider.of<LoadingBloc>(context).add(ConfirmBookEvent(bookDetails: widget.bookDetails));

                                SnackBarBuilder().buildSnackBar(
                                  context,
                                  message: "Room Booked!",
                                  color: Colors.green,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
