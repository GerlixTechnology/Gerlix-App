import 'package:flutter/material.dart';

class AppGerlixText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppGerlixText({Key key,
    this.size=35,
    this.text,
    this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'GerlixFont',
          fontWeight: FontWeight.bold
      ),
    );
  }
}