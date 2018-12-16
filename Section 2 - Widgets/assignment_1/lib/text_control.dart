import 'package:flutter/material.dart';

import './text_item.dart';

class TextControl extends StatefulWidget {
  final String startingText;

  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }

  TextControl({this.startingText = 'hello'});
}

class _TextControlState extends State<TextControl> {
  List<String> _text = [];

  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'Please enter add a word'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text('Add to list'),
            onPressed: () {
              setState(() {
                _text.add('value');
              });
            },
          ),
        ),
        TextItem(_text)
      ],
    );
  }
}
