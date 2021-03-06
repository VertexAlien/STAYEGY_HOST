import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy_host/Screen/contact_page.dart';
import 'package:stayegy_host/Screen/not_registered.dart';
import 'package:stayegy_host/Screen/price_page.dart';
import 'package:stayegy_host/Screen/privacy_policy.dart';

import 'package:stayegy_host/Screen/room_settings_page.dart';

import 'package:stayegy_host/Screen/statistics.dart';

import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy_host/bloc/LoadingBloc/loading_bloc.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Bloc.dart';
import 'package:stayegy_host/bloc/Login_Bloc/LogIn_Events.dart';
import 'package:stayegy_host/constants/constant.dart';
import 'package:stayegy_host/container/drawer_Data.dart';

import 'booking_page.dart';
import 'guests_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
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
                  scale: 10,
                  onTap: () {
                    BlocProvider.of<LoadingBloc>(context).add(LoadBookings());
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => BookingPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/guest_icon.png',
                  textData: 'Guests',
                  scale: 10,
                  onTap: () {
                    BlocProvider.of<LoadingBloc>(context).add(LoadGuestsEvent());
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => GuestsPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/prising.png',
                  textData: 'Price',
                  width: 20,
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => PricePage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/room settings.png',
                  textData: 'Room Settings',
                  scale: 10,
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => RoomSettingPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/statistics.png',
                  textData: 'Statistics',
                  scale: 2.5,
                  onTap: () {
                    BlocProvider.of<LogInBloc>(context).add(HomePageReloadEvent());
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => StatisticsPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/contact host.png',
                  textData: 'Contact',
                  scale: 2.7,
                  onTap: () {
                    BlocProvider.of<LogInBloc>(context).add(HomePageReloadEvent());
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => ContactPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/privacy policy.png',
                  textData: 'Privacy & Policy',
                  scale: 2.5,
                  onTap: () {
                    BlocProvider.of<LogInBloc>(context).add(HomePageReloadEvent());
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => PrivacyAndPolicy()));
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 40.0,
              child: drawer_data(
                imagePath: 'images/logout_icon.png',
                textData: 'LOG OUT',
                scale: 10,
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
