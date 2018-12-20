import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {

  final double price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Text('\$' + price.toString(),
              style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0)),
    );
  }
}
