import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/core/error/exceptions.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final jsonString = sharedPreferences.getString('CACHED_PRODUCTS');
      if (jsonString != null) {
        final List<dynamic> jsonResponse = json.decode(jsonString);
        return jsonResponse.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        return throw CacheException();
      }
    } catch (e) {
      throw CacheException();
    }
  
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final jsonString = json.encode(products.map((product) => product.toJson()).toList());
    await sharedPreferences.setString('CACHED_PRODUCTS', jsonString);
  }
}
