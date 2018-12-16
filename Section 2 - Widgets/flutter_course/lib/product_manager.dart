import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct = 'sweets tester'}) {
    print('[ProductManager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] CreateState');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager Widget] didUpdate');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    print('[ProductManager Widget] initState');
    _products.add(widget.startingProduct);
  }

  void _addProducts(String product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager Widget] Build');
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0), child: ProductControl(_addProducts)),
      Products(_products)
    ]);
  }
}
