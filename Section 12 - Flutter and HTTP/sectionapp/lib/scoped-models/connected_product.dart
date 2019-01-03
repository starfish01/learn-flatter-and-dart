//import the package
import 'package:scoped_model/scoped_model.dart';
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
    final Product newProduct = Product(title: title, description: description, image:image, price: price, userEmail: _authenticatedUser.email, userID: _authenticatedUser.id);
    _products.add(newProduct);
    notifyListeners();
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