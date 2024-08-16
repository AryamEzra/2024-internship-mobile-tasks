import 'package:flutter/material.dart';

import 'product.dart';

class ProductProvider extends ChangeNotifier{
  static final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  
  }

  void updateProduct(int index, Product product) {
    _products[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }
  
}

