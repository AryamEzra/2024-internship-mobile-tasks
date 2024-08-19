import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(String id);
  Future<ProductModel> addProduct(ProductModel product, String imagePath);
  Future<ProductModel> updateProduct(String id, ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  late final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> addProduct(ProductModel product, String imagePath) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
    );
    request.fields.addAll({
      'name': product.name,
      'description': product.description,
      'price': product.price.toString(),
    });

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imagePath,
      contentType: MediaType('image', 'jpg'),
    ));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      final result = await response.stream.bytesToString();
      return ProductModel.fromJson(jsonDecode(result)['data']);
    } else {
      throw ServerException();
    }
  } catch (e) {
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
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/products' '/$id',
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
      final response = await client.delete(Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id',
      ));
      if (response.statusCode == 200) {
        return;
      } else if (response.statusCode == 404) {
        throw ProductNotFoundException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      if (e is ProductNotFoundException) {
        throw ProductNotFoundException();
      }
      throw ServerException();
    }
  }

  // @override
  // Future<ProductModel> updateProduct(String id, ProductModel tProductModel) async {
  //   final response = await client.put(
  //     Uri.parse(
  //         'https://g5-flutter-learning-path-be.onrender.com/api/v1/products' +
  //             '/$id'),
  //   );

  //   if (response.statusCode == 200) {
  //     final jsonMap = json.decode(response.body) as Map<String, dynamic>;
  //     return ProductModel.fromJson(jsonMap);
  //   } else {
  //     throw ServerException();
  //   }
  // }
  @override
  Future<ProductModel> updateProduct(String id, ProductModel product) async {
    final response = await client.put(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body)['data'] as Map<String, dynamic>;
      return ProductModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }
}
//post and put for add and update method then add the body using json 
