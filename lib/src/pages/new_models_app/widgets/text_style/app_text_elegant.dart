import 'package:flutter/material.dart';

class AppTextElegant extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppTextElegant({Key key,
    this.size=25,
    this.text,
    this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
      ),
    );
  }
}