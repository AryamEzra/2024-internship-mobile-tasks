/*
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_9/core/connectivity/network_info.dart';
import 'package:task_9/core/error/exceptions.dart';
import 'package:task_9/core/failure/failure.dart';
import 'package:task_9/features/product/data/data_sources/product_local_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/features/product/data/repositories/product_repository_impl.dart';
import 'package:task_9/features/product/domain/entities/product.dart';

import '../../respositories/product_repository_impl_test.mocks.dart' as repo_mocks;
import 'product_local_data_source_test.mocks.dart' as local_mocks; // Add a prefix

@GenerateMocks([ProductLocalDataSource, NetworkInfo])
void main() {
  late ProductRepositoryImpl repository;
  late local_mocks.MockProductLocalDataSource mockLocalDataSource;
  late local_mocks.MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = local_mocks.MockProductLocalDataSource();
    mockNetworkInfo = local_mocks.MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: repo_mocks.MockProductRemoteDataSource(), // Dummy
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final product = Product(
    name: 'Boots',
    id: '1',
    price: 200 ,
    imageUrl: 'assets/images/boots.jpg',
    description: 'These boots are made for walking and that\'s just what they\'ll do...',
  );

  final tProductModel = ProductModel(
    id: '1',
    name: 'Test Product',
    description: 'This is a test product',
    price: 200,
    imageUrl: 'assets/images/boots.jpg',
  );

  group('Local Data Source Tests', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
      'should return last locally cached data when the cached data is available',
      () async {
        // Add the stub for addProduct method
        when(mockLocalDataSource.addProduct(any))
            .thenAnswer((_) async => tProductModel);

        final result = await repository.addProduct(product);
        expect(result, equals(Right(tProductModel)));
        verify(mockLocalDataSource.addProduct(product));
      },
    );

    test(
      'should return cache failure when the call to local data source is unsuccessful',
      () async {
        // Add the stub for addProduct method
        when(mockLocalDataSource.addProduct(any))
            .thenThrow(CacheException());

        final result = await repository.addProduct(product);
        expect(result, isA<Left<Failure, Product>>());
        verify(mockLocalDataSource.addProduct(product));
        verifyZeroInteractions(repo_mocks.MockProductRemoteDataSource());
      },
    );
  });
}
*/

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_9/features/product/data/data_sources/product_local_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/core/error/exceptions.dart';
import 'dart:convert';

@GenerateMocks([SharedPreferences])
import 'product_local_data_source_test.mocks.dart';

void main() {
  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  final tProductModelList = [
      ProductModel(
        id: '6672776eb905525c145fe0bb',
        name: 'Anime website',
        description: 'Explore anime characters.',
        price: 123,
        imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
      )
    ];

  final tProductModel = ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
    );

  group('getAllProducts', () {

    test('should return List<ProductModel> from SharedPreferences when there is one in the cache', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode(tProductModelList.map((product) => product.toJson()).toList()));

      // Act
      final result = await dataSource.getAllProducts();

      // Assert
      expect(result, equals(tProductModelList));
    });

    test('should throw CacheException when there is not a cached value', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // Act
      final call = dataSource.getAllProducts;

      // Assert
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });

  group('getProductById', () {
    final tProductModel = ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
    );

    test('should return ProductModel when there is a cached product with the given id', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode([tProductModel.toJson()]));

      // Act
      final result = await dataSource.getProductById(tProductModel.id);

      // Assert
      expect(result, equals(tProductModel));
    });

    test('should throw CacheException when there is no cached product with the given id', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode([]));

      // Act
      final call = dataSource.getProductById;

      // Assert
      expect(() => call(tProductModel.id), throwsA(isA<CacheException>()));
    });

    test('should throw CacheException when there is no cached data', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // Act
      final call = dataSource.getProductById;

      // Assert
      expect(() => call(tProductModel.id), throwsA(isA<CacheException>()));
    });
  });

  group('deleteProduct', () {

    test('should delete the product with the given id from SharedPreferences', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode([tProductModel.toJson()]));
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      // Act
      await dataSource.deleteProduct(tProductModel.id);

      // Assert
      verify(mockSharedPreferences.setString(
        'CACHED_PRODUCTS',
        json.encode([]),
      ));
    });

    test('should throw CacheException when there is no cached data', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // Act
      final call = dataSource.deleteProduct;

      // Assert
      expect(() => call(tProductModel.id), throwsA(isA<CacheException>()));
    });
  });

  group('addProduct', () {

    test('should add product to SharedPreferences', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      // Act
      await dataSource.addProduct(tProductModel);

      // Assert
      verify(mockSharedPreferences.setString(
        'CACHED_PRODUCTS',
        json.encode([tProductModel.toJson()]),
      ));
    });

    test('should add product to existing list in SharedPreferences', () async {
      // Arrange
      final existingProducts = [
        ProductModel(
          id: '123456',
          name: 'Existing Product',
          description: 'Existing product description',
          price: 100,
          imageUrl: 'https://example.com/existing_product.jpg',
        )
      ];
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode(existingProducts.map((product) => product.toJson()).toList()));
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      // Act
      await dataSource.addProduct(tProductModel);

      // Assert
      final expectedProducts = existingProducts..add(tProductModel);
      verify(mockSharedPreferences.setString(
        'CACHED_PRODUCTS',
        json.encode(expectedProducts.map((product) => product.toJson()).toList()),
      ));
    });
  });

  group('updateProduct', () {

    test('should update the product in SharedPreferences', () async {
      // Arrange
      final existingProducts = [
        ProductModel(
          id: '6672776eb905525c145fe0bb',
          name: 'Old Anime website',
          description: 'Old description.',
          price: 100,
          imageUrl: 'https://example.com/old_image.jpg',
        )
      ];
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode(existingProducts.map((product) => product.toJson()).toList()));
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      // Act
      await dataSource.updateProduct(tProductModel);

      // Assert
      final expectedProducts = [tProductModel];
      verify(mockSharedPreferences.setString(
        'CACHED_PRODUCTS',
        json.encode(expectedProducts.map((product) => product.toJson()).toList()),
      ));
    });

    test('should throw CacheException when there is no cached product with the given id', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode([]));

      // Act
      final call = dataSource.updateProduct;

      // Assert
      expect(() => call(tProductModel), throwsA(isA<CacheException>()));
    });

    test('should throw CacheException when there is no cached data', () async {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // Act
      final call = dataSource.updateProduct;

      // Assert
      expect(() => call(tProductModel), throwsA(isA<CacheException>()));
    });
  });

}
