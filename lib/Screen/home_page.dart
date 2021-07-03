import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/Screen/roomstatus.dart';

import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_State.dart';

import 'package:stayegy_host/container/loading_Overlay.dart';

import 'appdrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueChoose;
  List listItem = [
    "Today",
    "Tomorrow",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => FlatButton(
            padding: EdgeInsets.all(18),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Center(
          child: Image.asset(
            'images/host logo.png',
            scale: 6,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: appdrawer(),
      body: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is LoadingState) {
            // LoadingOverlay().build(context);
          }
        },
        child: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) {
            return state is LoadHotelDetailsCompleteState
                ? SafeArea(
                    child: RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      onRefresh: () {
                        BlocProvider.of<LogInBloc>(context).add(HomePageReloadEvent());
                        return null;
                      },
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: true,
                            child: Container(
                              height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text('${state.hotel.hid}', style: GoogleFonts.staatliches(fontSize: 35)),
                                        Text('${state.hotel.name} ', style: GoogleFonts.staatliches(fontSize: 20)),
                                        Text('${state.hotel.address}', style: GoogleFonts.staatliches(fontSize: 12, color: Colors.black45)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                                      Text('Date'),
                                      Container(
                                        padding: EdgeInsets.only(left: 16, right: 24),
                                        decoration: BoxDecoration(color: Color(0xffefefef)),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            dropdownColor: Colors.grey,
                                            icon: Icon(Icons.arrow_right),
                                            iconSize: 35,
                                            isExpanded: true,
                                            style: TextStyle(
                                              fontSize: 22,
                                            ),
                                            value: valueChoose,
                                            onChanged: (newValue) {
                                              setState(() {
                                                valueChoose = newValue;
                                              });
                                            },
                                            items: listItem.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem,
                                                child: Center(
                                                  child: Text(
                                                    valueItem,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.normal,
                                                      color: Color(0xFF110B0B),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15.00,
                                            height: 15.00,
                                            child: const DecoratedBox(
                                              decoration: const BoxDecoration(
                                                color: Color(0xff5aa469),
                                              ),
                                            ),
                                          ),
                                          Text('  Open'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15.00,
                                            height: 15.00,
                                            child: const DecoratedBox(
                                              decoration: const BoxDecoration(
                                                color: Color(0xffec524b),
                                              ),
                                            ),
                                          ),
                                          Text('  Close'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15.00,
                                            height: 15.00,
                                            child: const DecoratedBox(
                                              decoration: const BoxDecoration(
                                                color: Color(0xfffff3b2),
                                              ),
                                            ),
                                          ),
                                          Text('  Booked'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Expanded(
                                      child: GridView.count(
                                        childAspectRatio: 5 / 3,
                                        crossAxisCount: 4,
                                        // crossAxisSpacing: 15,
                                        // mainAxisSpacing: 0,
                                        children: List.generate(
                                          state.hotel.rooms.length,
                                          (index) {
                                            return GestureDetector(
                                              onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => RoomStatus())),
                                              child: Card(
                                                margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                                                color: Color(0xff5aa469),
                                                // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                                child: Center(
                                                  child: Text(
                                                    'Room ${state.hotel.rooms[index]}',
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : LoadingOverlay().buildWidget(context);
          },
        ),
      ),
    );
  }
}
