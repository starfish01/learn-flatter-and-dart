import 'package:flutter/material.dart';

class Address extends StatelessWidget{
  final String address;

  Address(this.address);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
            child: Padding(
              child: Text(address),
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          );
  }

}