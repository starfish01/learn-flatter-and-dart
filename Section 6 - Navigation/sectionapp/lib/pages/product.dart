import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product detail name'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/food.jpg'),
            Container(padding: EdgeInsets.all(10.0),child:
            Text('details')),
            Container(padding: EdgeInsets.all(10.0),child:
            RaisedButton(
              child: Text('back'),
              onPressed: () => Navigator.pop(context),
            ))
          ],
        ));
  }
}
