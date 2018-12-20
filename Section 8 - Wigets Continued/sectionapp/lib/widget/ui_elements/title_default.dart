import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {

  final String text;

  TitleDefault(this.text);



  @override
  Widget build(BuildContext context) {
    return  Text(
        text,
        style: TextStyle(
            fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'));
  }
}
