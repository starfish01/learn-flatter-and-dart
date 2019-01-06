import 'dart:convert';
import 'package:async/async.dart';

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
  String _selProductId;
  bool _isLoading = false;

  //function being shared by mixins
  
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavourites = false;


  Future<bool> addProduct(
      String title, String description, String image, double price) async {
    _isLoading = true;
    notifyListeners();

    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image':
          'https://www.gettyimages.com.au/gi-resources/images/Embed/new/embed2.jpg',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userID': _authenticatedUser.id,
    };
    try{
    final http.Response response = await http.post(
        'https://flutter-product-1940c.firebaseio.com/products.json',
        body: json.encode(productData));

    if (response.statusCode != 200 || response.statusCode != 201) {
      _isLoading = false;
      notifyListeners();
      return false;
    }

    final Map<String, dynamic> responseData = json.decode(response.body);
    final Product newProduct = Product(
        id: responseData['name'],
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: _authenticatedUser.email,
        userID: _authenticatedUser.id);
    _products.add(newProduct);
    _isLoading = false;
    notifyListeners();
    return true;
    } catch(error){
      _isLoading = false;
      notifyListeners();
      return false;
    }


  }

  Future<Null> fetchProducts() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://flutter-product-1940c.firebaseio.com/products.json')
        .then<Null>((http.Response response) {
      final List<Product> fetchedProductList = [];
      final Map<String, dynamic> productListData = json.decode(response.body);

      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      productListData.forEach((String productId, dynamic productData) {
        final Product product = Product(
          id: productId,
          title: productData['title'],
          description: productData['description'],
          image: productData['image'],
          price: productData['price'],
          userEmail: productData['userEmail'],
          userID: productData['userID'],
        );
        fetchedProductList.add(product);
      });

      _products = fetchedProductList;

      _isLoading = false;
      notifyListeners();
      _selProductId = null;
      return;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }

  int get selectedProductIndex {
    return _products.indexWhere((Product product) {
      return product.id == _selProductId;
    });
  }

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayProducts {
    if (_showFavourites) {
      return List.from(
          _products.where((Product product) => product.isFavourite).toList());
    }
    return List.from(_products);
  }

  String get selectedProductId {
    return _selProductId;
  }

  bool get isFavListSelected {
    return _showFavourites;
  }

  Product get selectedProduct {
    if (selectedProductId == null) {
      return null;
    }
    return _products.firstWhere((Product product) {
      return product.id == _selProductId;
    });
  }

  Future<bool> updateProduct(
      String title, String description, String image, double price) {
    final Map<String, dynamic> updateData = {
      'title': title,
      'description': description,
      'image':
          'https://www.gettyimages.com.au/gi-resources/images/Embed/new/embed2.jpg',
      'price': price,
      'userEmail': selectedProduct.userEmail,
      'userID': selectedProduct.userID
    };
    return http
        .put(
            'https://flutter-product-1940c.firebaseio.com/products/${selectedProductIndex}.json',
            body: json.encode(updateData))
        .then((http.Response response) {
      final Product updatedProduct = Product(
          id: selectedProduct.id,
          title: title,
          description: description,
          image: image,
          price: price,
          userEmail: selectedProduct.userEmail,
          userID: selectedProduct.userID);
      //products.add(updatedProduct);

      _products[selectedProductIndex] = updatedProduct;

      notifyListeners();
      return true;
    }).catchError((onError) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  void deleteProduct() {
    _isLoading = true;
    final deletedProductId = selectedProduct.id;

    _products.removeAt(selectedProductIndex);
    _selProductId = null;
    notifyListeners();
    http
        .delete(
            'https://flutter-product-1940c.firebaseio.com/products/${deletedProductId}.json')
        .then((http.Response response) {
      _isLoading = false;
    }).catchError((onError) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
    notifyListeners();
  }

  void selectProduct(String productId) {
    _selProductId = productId;
    if (productId != null) {
      notifyListeners();
    }
  }

  void toggleProdcutIsFavourite() {
    final Product product = _products[selectedProductIndex];
    final bool isCurrentlyFavourite = product.isFavourite;
    final bool newFavStatus = !isCurrentlyFavourite;

    final Product updateProduct = Product(
        id: product.id,
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
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'something', email: email, password: password);
  }
}

mixin UtilityModel on ConnectedProductsModel {
  bool get isLoading {
    return _isLoading;
  }
}
