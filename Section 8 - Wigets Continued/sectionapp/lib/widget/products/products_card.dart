import 'package:flutter/material.dart';

import '../ui_elements/title_default.dart';

import './address.dart';

import './price.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;
  final Function deleteProduct;

  ProductCard(this.product, this.index, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['imageUrl']),
          //SizedBox(height: 10.0,),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: TitleDefault(product['title']),
                ),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(product['price'])
              ],
            ),
          ),

          Address('sydney'),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                iconSize: 40.0,
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((bool value) {
                      if (value) {
                        deleteProduct(index);
                      }
                    }),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                iconSize: 40.0,
                color: Colors.red,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
