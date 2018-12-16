import 'package:flutter/material.dart';

class TextItem extends StatelessWidget{
  final List<String> textItems;

  TextItem([this.textItems = const []]);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: textItems.map((element)  => Card(
        child: Column (
          children:<Widget>[
            Text(element)
          ]
        )
      )).toList(),
    );
  }
}