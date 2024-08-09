import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';


abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(String id);
  Future<ProductModel> addProduct(Product product);
  Future<ProductModel> updateProduct(Product product);
  Future<ProductModel> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  late final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<ProductModel> addProduct(Product product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
  
  @override
  Future<ProductModel> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }


  
  @override
  Future<ProductModel> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
  
  @override
  Future<ProductModel> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
}