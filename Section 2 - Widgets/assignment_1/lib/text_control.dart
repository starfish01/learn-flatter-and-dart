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

  final textInputField = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

   @override
  void dispose() {
    textInputField.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'Please enter add a word'),
            controller: textInputField,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text('Add to list'),
            onPressed: () {
              if(textInputField.text.trim() != ''){
                setState(() {
                _text.add(textInputField.text);
              });
              }
              
            },
          ),
        ),
        TextItem(_text)
      ],
    );
  }
}
