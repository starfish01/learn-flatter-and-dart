import 'dart:convert';

//import the package
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
//import our classes
import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  //variables being shared between mixins
  List<Product> _products = [];
  User _authenticatedUser;
  int _selProductIndex;
  //function being shared by mixins 
  void addProduct(String title, String description, String image, double price) {

    final Map<String,dynamic> productData = {
      'title': title,
      'description': description,
      'image':'https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjFrf6owNPfAhUKi7wKHaoiDzQQjRx6BAgBEAU&url=%2Furl%3Fsa%3Di%26source%3Dimages%26cd%3D%26ved%3D%26url%3Dhttps%253A%252F%252Fwww.usatoday.com%252Fstory%252Fmoney%252F2018%252F10%252F28%252Fnational-chocolate-day-2018%252F1798801002%252F%26psig%3DAOvVaw3MBpfPXvLbqdQMqVhhKP_W%26ust%3D1546669846037278&psig=AOvVaw3MBpfPXvLbqdQMqVhhKP_W&ust=1546669846037278',
      'price':price
    };
    
    http.post('FIRE BASE URL GOES HERE', body: json.encode(productData))
    .then((http.Response response){
      final Map<String,dynamic> responseData = json.decode(response.body);
final Product newProduct = Product(
      id: responseData['name'],
      title: title, 
      description: description, 
      image:image, 
      price: price, 
      userEmail: _authenticatedUser.email, 
      userID: _authenticatedUser.id
      );
    _products.add(newProduct);
    notifyListeners();
    });

    
  }
}

mixin ProductsModel on ConnectedProductsModel {

  bool _showFavourites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayProducts {
    if (_showFavourites) {
      return List.from(_products.where((Product product) => product.isFavourite).toList());

    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  bool get isFavListSelected {
    return _showFavourites;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }


  void updateProduct(String title, String description, String image, double price) {

    final Product updatedProduct = Product(title: title, description: description, image:image, price: price, userEmail: selectedProduct.userEmail, userID: selectedProduct.userID);
    //products.add(updatedProduct);
    _products[selectedProductIndex] = updatedProduct;

    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    notifyListeners();
  }

 void selectProduct(int productId) {
    _selProductIndex = productId;
    if (productId != null) {
      notifyListeners();
    }
}

  void toggleProdcutIsFavourite() {
    final Product product = _products[selectedProductIndex];
    final bool isCurrentlyFavourite = product.isFavourite;
    final bool newFavStatus = !isCurrentlyFavourite;

    final Product updateProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        image: product.image,
        isFavourite: newFavStatus,
        userEmail: product.userEmail,
        userID: product.userID);

    _products[selectedProductIndex] = updateProduct;

    //updates the view of the button
    notifyListeners();
  }

  void toggleFavouritesList() {
    _showFavourites = !_showFavourites;
    notifyListeners();

  }
}


mixin UserModel on ConnectedProductsModel {

  void login(String email, String password){
    _authenticatedUser = User(id: 'something', email: email, password: password);
  }

}