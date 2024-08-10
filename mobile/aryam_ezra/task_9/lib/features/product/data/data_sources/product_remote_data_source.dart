import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(String id);
  Future<ProductModel> addProduct(ProductModel product, File tImageFile);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  late final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> addProduct(ProductModel product, File imageFile) async {
    final uri = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/');
    final request = http.MultipartRequest('POST', uri);

    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();
    request.fields['id'] = product.id;

    request.files.add(
      await http.MultipartFile.fromPath(
        'image', 
        imageFile.path,
        contentType: MediaType('image', 'jpg'),
      ),
    );
    // Send the request
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body)['data'];
      return ProductModel.fromJson(jsonData);
    } else {
      throw ServerException();
    }
  }




  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await client.get(
      Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
      
    } catch (e) {
      throw ServerException();
      
    }
    
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      final response = await client.get(
        Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/products' +
              '/$id',
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final productJson = jsonResponse['data'];

        if (productJson != null) {
          return ProductModel.fromJson(productJson);
        } else {
          throw ProductNotFoundException();
        }
      } else if (response.statusCode == 404) {
        throw ProductNotFoundException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      
      throw ServerException();
    }
  }
   @override
  Future<void> deleteProduct(String id) async {
    try {
      final response = await client.delete(
        Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/products' +
              '/' +
              id,
        )
      );
      if (response.statusCode == 200) {
        return;
      } else if (response.statusCode == 404) {
        throw ProductNotFoundException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      if(e is ProductNotFoundException){
        throw ProductNotFoundException();
      }
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async{
    try {
      final response = await client.put(
      Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return ProductModel.fromJson(jsonResponse as Map<String, dynamic>);
    } else {
      throw ServerException();
    }
      
    } catch (e) {
      throw ServerException();
      
    }
    // throw UnimplementedError();
  }
}
//post and put for add and update method then add the body using json 
