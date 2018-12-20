import 'package:flutter/material.dart';

import 'dart:async';

import '../widget/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl,this.price,this.description);

  _showWarningDialog(BuildContext context) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure'),
            content: Text('This action cannot be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back Pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(padding: EdgeInsets.all(10.0), child: TitleDefault(title),),
              Container(padding: EdgeInsets.all(10.0), child: Text('\$'+price.toString())),
              Container(padding: EdgeInsets.all(10.0), child: Text(description)),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    color: Theme.of(context).accentColor,
                    icon: Icon(Icons.delete_forever),
                    iconSize: 40.0,
                    onPressed: () => _showWarningDialog(context),
                  ))
            ],
          )),
    );
  }
}
