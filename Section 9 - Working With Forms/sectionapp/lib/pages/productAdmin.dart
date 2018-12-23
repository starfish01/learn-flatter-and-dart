import 'package:flutter/material.dart';

//import './products.dart';
import './product_edit.dart';
//import './product_list.dart';

class ProductAdmin extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductAdmin(this.addProduct,this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: Text('Choose'),
                  ),
                  ListTile(
                    leading: Icon(Icons.eject),
                    title: Text('Products Page'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/products');
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text('Admin For product'),
              bottom: TabBar(tabs: <Widget>[
                Tab(text: 'Create Product', icon: Icon(Icons.create)),
                Tab(text: 'My Product', icon: Icon(Icons.list))

              ],),
            ),
            body: TabBarView(
              children: <Widget>[
                ProductEditPage(addProduct:addProduct),
                //ProductListePage()
              ],
            )
            )
            );
  }
}
