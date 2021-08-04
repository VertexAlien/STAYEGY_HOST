import 'package:flutter/material.dart';
import 'package:stayegy_host/container/gradient_creation.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xFF191919),
      child: Text(
        'STAYEGY',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none),
      ),
    );
  }
}
