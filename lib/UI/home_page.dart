import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayegy_host/UI/appdrawer.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_State.dart';
import 'package:stayegy_host/bloc/Repository/hotel.dart';
import 'package:stayegy_host/container/loading_Overlay.dart';

class HomePage extends StatelessWidget {
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
                        BlocProvider.of<LogInBloc>(context)
                            .add(HomePageReloadEvent());
                        return null;
                      },
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: true,
                            child: Container(
                              height: MediaQuery.of(context).size.height -
                                  AppBar().preferredSize.height,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text('${state.hotel.hid}',
                                            style: GoogleFonts.staatliches(
                                                fontSize: 35)),
                                        Text('${state.hotel.name} ',
                                            style: GoogleFonts.staatliches(
                                                fontSize: 20)),
                                        Text('${state.hotel.address}',
                                            style: GoogleFonts.staatliches(
                                                fontSize: 12,
                                                color: Colors.black45)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            color: Color(0xffefefef),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            child: Text(
                                                'New booking request from Mr.xyz ',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 20,
                                            ),
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            color: Color(0xffefefef),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            child: Text(
                                                'Sami-dual bed || AC (2 days)    ',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          state.hotel.rooms,
                                          (index) {
                                            return Card(
                                              margin: EdgeInsets.fromLTRB(
                                                  3, 5, 3, 5),
                                              color: state.hotel.closedRooms
                                                      .contains(index + 1)
                                                  ? Color(0xffec524b)
                                                  : state.hotel.bookedRooms
                                                          .contains(index + 1)
                                                      ? Color(0xfffff3b2)
                                                      : Color(0xff5aa469),
                                              child: Center(
                                                child: Text(
                                                  'Room ${index + 1}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
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
