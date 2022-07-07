import 'package:flutter/material.dart';

class AppTextElegantTwo extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppTextElegantTwo({Key key,
    this.size=18,
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
      ),
    );
  }
}