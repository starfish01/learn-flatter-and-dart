import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

  _buildTitleTextfield() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Product Title',
      ),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  _buildProductPriceTextfield() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  _buildSaveProductButton() {
    return RaisedButton(
      //color: Theme.of(context).accentColor,
      //textColor: Colors.white,
      child: Text('Save'),
      onPressed: _submitForm,
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'imageUrl': 'assets/food.jpg'
    };

    widget.addProduct(product);

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWitdth = deviceWidth > 555.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWitdth;

    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextfield(),
            _buildDescriptionTextField(),
            _buildProductPriceTextfield(),
            SizedBox(
              height: 10.0,
            ),
            _buildSaveProductButton(),
            GestureDetector(
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(5.0),
                child: Text('My Button'),
              ),
              onTap: _submitForm,
            )
          ],
        ));
  }
}
