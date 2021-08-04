import 'package:flutter/material.dart';

class SnackBarBuilder {
  void buildSnackBar(BuildContext context, {@required String message, @required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(message), Icon(Icons.error)],
        ),
        backgroundColor: color,
      ),
    );
  }
}
