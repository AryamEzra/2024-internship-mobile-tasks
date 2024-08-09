import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_9/core/error/exceptions.dart';
import 'package:task_9/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';

import 'remote_data_source_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });


  group('getAllProducts', () {
    test('should return a list of ProductModels when the response code is 200',
        () async {
      // Arrange
      final jsonResponse = jsonDecode(File('D:/2024-internship-mobile-tasks/mobile/aryam_ezra/task_9/test/features/dummy_test/dummy_json.json').readAsStringSync());


      when(mockHttpClient.get(Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products')))
          .thenAnswer((_) async => http.Response(jsonEncode(jsonResponse), 200));

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
}
