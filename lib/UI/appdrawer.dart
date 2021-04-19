import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stayegy_host/UI/booking_page.dart';
import 'package:stayegy_host/UI/guests_page.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Bloc.dart';
import 'package:stayegy_host/bloc/Authentication_Bloc/Authentication_Events.dart';
import 'package:stayegy_host/container/drawer_Data.dart';

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
                  margin: EdgeInsets.fromLTRB(0, 0, 190, 10),
                  child: Text(
                    'Mr. XYZ',
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
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => BookingPage()));
                  },
                ),
                drawer_data(
                  imagePath: 'images/guest_icon.png',
                  textData: 'Guests',
                  scale: 8,
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => GuestsPage()));
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
