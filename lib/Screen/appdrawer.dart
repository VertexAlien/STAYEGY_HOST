import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy_host/Screen/price_page.dart';

import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/constants/constant.dart';
import 'package:stayegy_host/container/drawer_Data.dart';

import 'booking_page.dart';
import 'guests_page.dart';

class appdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 110, 20, 0),
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    hotelDetailsGlobal.name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: Colors.white,
                ),
                drawer_data(
                  imagePath: 'images/booking_icon.png',
                  textData: 'Bookings',
                  scale: 8,
                  onTap: () {
                    BlocProvider.of<LoadingBloc>(context).add(LoadBookings());
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => BookingPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/guest_icon.png',
                  textData: 'Guests',
                  scale: 8,
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => GuestsPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/prising.png',
                  textData: 'Price',
                  scale: 8,
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => PricePage()));
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 60.0,
              child: drawer_data(
                imagePath: 'images/logout_icon.png',
                textData: 'LOG OUT',
                scale: 10,
                width: 10,
                onTap: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  print("Pressed! Logout!");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
