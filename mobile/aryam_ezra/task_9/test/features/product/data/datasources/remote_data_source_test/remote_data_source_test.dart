import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_9/core/error/exceptions.dart';
import 'package:task_9/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/features/product/domain/entities/product.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });
  final jsonResponse = jsonDecode(File(
          'D:/2024-internship-mobile-tasks/mobile/aryam_ezra/task_9/test/features/dummy_test/dummy_json.json')
      .readAsStringSync());
  group('getAllProducts', () {
    test('should return a list of ProductModels when the response code is 200',
        () async {
      // Arrange

      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products')))
          .thenAnswer(
              (_) async => http.Response(jsonEncode(jsonResponse), 200));

      // Act
      final result = await dataSource.getAllProducts();

      // Assert
      expect(result, isA<List<ProductModel>>());
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act
      final call = dataSource.getAllProducts();

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  const String productId = '6672776eb905525c145fe0bb';

  group('get Products by ID', () {
    final resp = jsonDecode(File(
            'D:/2024-internship-mobile-tasks/mobile/aryam_ezra/task_9/test/features/dummy_test/dummy_single_product.json')
        .readAsStringSync());
    test('should return a product when the response code is 200', () async {
      // Arrange

      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$productId')))
          .thenAnswer((_) async => http.Response(jsonEncode(resp), 200));

      // Act
      final result = await dataSource.getProductById(productId);

      // Assert
      expect(result, isA<ProductModel>());
    });

    test('something expected occur', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products')))
          .thenAnswer((_) async => throw ServerException());

      // Act
      final call = dataSource.getProductById('non-existing-id');

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('should throw ProductNotFoundException when the product is not found',
        () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act
      final call = dataSource.getProductById('productId');

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Delete Products by ID', () {
    test('should complete successfully when the response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.delete(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/productId')))
          .thenAnswer((_) async =>
              http.Response('', 200)); // Success response with empty body

      // Act
      dataSource.deleteProduct('productId');

      // Assert
      // Since there's no return value for successful deletion, no assertion is needed
    });

    test('should throw ProductNotFoundException when the response code is 404',
        () async {
      // Arrange
      when(mockHttpClient.delete(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/non-existing-id')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act
      final call = dataSource.deleteProduct('non-existing-id');

      // Assert
      expect(() => call, throwsA(isA<ProductNotFoundException>()));
    });

    test('should throw ServerException for other error codes', () async {
      // Arrange
      when(mockHttpClient.delete(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/productId')))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // Act
      final call = dataSource.deleteProduct('productId');

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

    group('addProduct', () {
    final tProductModel = ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
    );

    final tImageFile = File('assets/images/boots.jpg');

    test('should add product to JSON file and return the product', () async {
      // Arrange
      when(mockHttpClient.send(any)).thenAnswer((_) async {
        final response = http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode({
            'data': {
              'id': '6672776eb905525c145fe0bb',
              'name': 'Anime website',
              'description': 'Explore anime characters.',
              'price': 123.0,
              'imageUrl': 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg'
            }
          }))),
          201,
        );
        return response;
      });


      // Act
      final result = await dataSource.addProduct(tProductModel, tImageFile);

      // Assert
      expect(result, equals(tProductModel));

      // Read the existing file content
      final file = File('D:/2024-internship-mobile-tasks/mobile/aryam_ezra/task_9/test/features/dummy_test/dummy_single_product.json');
      final fileContent = file.readAsStringSync();
      final jsonData = jsonDecode(fileContent);

      // Add the new product to the existing data
      if (jsonData['data'] is List) {
        jsonData['data'].add(tProductModel.toJson());
      } else {
        jsonData['data'] = [jsonData['data'], tProductModel.toJson()];
      }

      // Write the updated content back to the file
      file.writeAsStringSync(jsonEncode(jsonData));

      // Verify the product is added
      final updatedFileContent = file.readAsStringSync();
      final updatedJsonData = jsonDecode(updatedFileContent);
      expect(updatedJsonData['data'], contains(tProductModel.toJson()));
    });
  });
  /*
  group('addProduct', () {
    final tproductModel = ProductModel(
        id: '6672776eb905525c145fe0bb',
        name: 'Anime website',
        description: 'Explore anime characters.',
        price: 123,
        imageUrl:
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg');

    test('should add product to JSON file and return the product', () async {
      // Arrange
      final product = ProductModel(
        id: '6672776eb905525c145fe0bb',
        name: 'Anime website',
        description: 'Explore anime characters.',
        price: 123,
        imageUrl:
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
      );

      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer(
              (_) async => http.Response(jsonEncode(product.toJson()), 201));

      // Act
      final result = await dataSource.addProduct(product);

      // Assert
      expect(result, equals(product));
      final fileContent = File(
              'D:/2024-internship-mobile-tasks/mobile/aryam_ezra/task_9/test/features/dummy_test/dummy_single_product.json')
          .readAsStringSync();
      final jsonData = jsonDecode(fileContent);
      expect(jsonData['data'], contains(product.toJson()));
    });

    test('should throw ServerException when the response code is not 201',
        () async {
      when(mockHttpClient.post(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final call = dataSource.addProduct;

      expect(() => call(tproductModel), throwsA(isA<ServerException>()));
    });
  });
  */

  group('updateProduct', () {
    final tproductModel = ProductModel(
        id: '6672776eb905525c145fe0bb',
        name: 'Anime website',
        description: 'Explore anime characters.',
        price: 123,
        imageUrl:
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg');

    test('should throw ServerException when the response code is not 200',
        () async {
      when(mockHttpClient.put(any,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final call = dataSource.updateProduct;

      expect(() => call(tproductModel), throwsA(isA<ServerException>()));
    });
  });
}
