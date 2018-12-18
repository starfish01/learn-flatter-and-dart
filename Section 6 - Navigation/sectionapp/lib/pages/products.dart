import 'package:flutter/material.dart';

import '../product_manager.dart';



class ProductsPage extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function addProduct;
  final Function deleteProdcut;

  ProductsPage(this.products,this.addProduct,this.deleteProdcut);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(products,addProduct,deleteProdcut),
    );
  }
}