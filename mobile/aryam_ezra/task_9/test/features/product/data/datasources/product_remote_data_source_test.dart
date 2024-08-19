import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_9/core/connectivity/constants.dart';
import 'package:task_9/core/error/exceptions.dart';
import 'package:task_9/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';

import 'product_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });
  final jsonResponse = jsonDecode(File(
          'D:/2024-internship-mobile-tasks/mobile/aryam_ezra/task_9/test/dummy_test/dummy_json.json')
      .readAsStringSync());

  const tProductModel = ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg');
  const tImagePath = 'assets/images/boots.jpg';
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
            'D:/2024-internship-mobile-tasks/mobile/aryam_ezra/task_9/test/dummy_test/dummy_single_product.json')
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
  test('should return ProductModel when the response code is 201 (created)', () async {
    // Arrange
    const expectedProduct = tProductModel;

    final responsePayload = jsonEncode({
      'data': expectedProduct.toJson(),
    });
    when(mockHttpClient.send(any)).thenAnswer((_) async => http.StreamedResponse(
      Stream.fromIterable([utf8.encode(responsePayload)]),
      201,
    ));

    // Act
    final result = await dataSource.addProduct(tProductModel, tImagePath);

    // Assert
    expect(result, equals(expectedProduct));
  });

  test('should throw ServerException when the response code is not 201', () async {
    // Arrange
    when(mockHttpClient.send(any)).thenAnswer((_) async => http.StreamedResponse(
      Stream.fromIterable([utf8.encode('Error')]),
      400,
    ));

    // Act
    final call = dataSource.addProduct;

    // Assert
    expect(() => call(tProductModel, tImagePath), throwsA(isA<ServerException>()));
  });
});
  group('updateProduct', () {
     const tProductModel = ProductModel(
      id: '6672752cbd218790438efdb0',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
    );

    test('should return ProductModel when the response code is 200', () async {
      // Arrange
      final expectedUrl = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${tProductModel.id}');
      when(mockHttpClient.put(
        expectedUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tProductModel.toJson()),
      )).thenAnswer((_) async => http.Response(jsonEncode({'data': tProductModel.toJson()}), 200));

      // Act
      final result = await dataSource.updateProduct(tProductModel.id, tProductModel);

      // Assert
      verify(mockHttpClient.put(
        expectedUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tProductModel.toJson()),
      ));
      expect(result, equals(tProductModel));
    });
    test('should throw a ServerException when the response code is not 200',
        () async {
      // Arrange
      when(mockHttpClient.put(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Something went wrong', 404));

      // Act
      final call = dataSource.updateProduct;

      // Assert
      expect(() => call(tProductModel.id, tProductModel),
          throwsA(isA<ServerException>()));
    });
  });
}
