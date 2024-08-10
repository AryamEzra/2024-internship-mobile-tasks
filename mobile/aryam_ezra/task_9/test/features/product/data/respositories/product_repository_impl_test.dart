/*
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_9/core/connectivity/network_info.dart';
import 'package:task_9/core/error/exceptions.dart';
import 'package:task_9/core/failure/failure.dart';
import 'package:task_9/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/features/product/data/repositories/product_repository_impl.dart';
import 'package:task_9/features/product/domain/entities/product.dart';

import '../datasources/local_data_source_test/product_local_data_source_test.mocks.dart';
import 'product_repository_impl_test.mocks.dart' as repo_mocks; // Adjust import path if needed

@GenerateMocks([ProductRemoteDataSource, NetworkInfo])
void main() {
  late ProductRepositoryImpl repository;
  late repo_mocks.MockProductRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = repo_mocks.MockProductRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: MockProductLocalDataSource(), // Dummy
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

  group('Remote Data Source Tests', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    // test(
    //   'should return remote data when the call to remote data is successful',
    //   () async {
    //     // Add the stub for addProduct method
    //     when(mockRemoteDataSource.addProduct(any))
    //         .thenAnswer((_) async => tProductModel);

    //     final result = await repository.addProduct(product);
    //     expect(result, equals(Right(tProductModel)));
    //     verify(mockRemoteDataSource.addProduct(product));
    //   },
    // );

    // test(
    //   'should return server failure when the call to remote data is unsuccessful',
    //   () async {
    //     // Add the stub for addProduct method
    //     when(mockRemoteDataSource.addProduct(any))
    //         .thenThrow(ServerException());

    //     final result = await repository.addProduct(product);
    //     expect(result, isA<Left<Failure, Product>>());
    //     verify(mockRemoteDataSource.addProduct(product));
    //     verifyZeroInteractions(MockProductLocalDataSource());
    //   },
    // );
  });
}
*/


import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_9/core/connectivity/network_info.dart';

import 'package:task_9/features/product/data/data_sources/product_local_data_source.dart';
import 'package:task_9/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/features/product/data/repositories/product_repository_impl.dart';

import 'product_repository_impl_test.mocks.dart';


@GenerateMocks([ProductRemoteDataSource, ProductLocalDataSource, NetworkInfo])

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;
  late MockProductLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    mockLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const tProductModel = ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
    );
  const tImagePath = 'assets/images/boots.jpg';

  group('addProduct', () {
  test('should add product to remote and local data sources when online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.addProduct(any, any)).thenAnswer((_) async => tProductModel);
      when(mockLocalDataSource.addProduct(any)).thenAnswer((_) async => tProductModel);

      // Act
      final result = await repository.addProduct(tProductModel);

      // Assert
      expect(result, tProductModel);
      verify(mockRemoteDataSource.addProduct(tProductModel, tImagePath));
      verify(mockLocalDataSource.addProduct(tProductModel));
    });

    test('should add product to local data source only when offline', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.addProduct(any)).thenAnswer((_) async => tProductModel);

      // Act
      final result = await repository.addProduct(tProductModel);

      // Assert
      expect(result, tProductModel);
      verifyNever(mockRemoteDataSource.addProduct(tProductModel, tImagePath));
      verify(mockLocalDataSource.addProduct(tProductModel));
    });
});

  group('updateProduct', () {
  test('should update product in remote and local data sources when online', () async {
    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockRemoteDataSource.updateProduct(any, any)).thenAnswer((_) async => Future.value(tProductModel));
    when(mockLocalDataSource.updateProduct(any)).thenAnswer((_) async => Future.value(tProductModel));

    // Act
    await repository.updateProduct(tProductModel);

    // Assert
    verify(mockRemoteDataSource.updateProduct(tProductModel.id, tProductModel));
    verify(mockLocalDataSource.updateProduct(tProductModel));
  });

  test('should update product in local data source only when offline', () async {
    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    when(mockLocalDataSource.updateProduct(any)).thenAnswer((_) async => Future.value(tProductModel));

    // Act
    await repository.updateProduct(tProductModel);

    // Assert
    verifyNever(mockRemoteDataSource.updateProduct(tProductModel.id, tProductModel));
    verify(mockLocalDataSource.updateProduct(tProductModel));
  });
});

  group('deleteProduct', () {
    test('should delete product from remote and local data sources when online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.deleteProduct(any)).thenAnswer((_) async => {});
      when(mockLocalDataSource.deleteProduct(any)).thenAnswer((_) async => {});

      await repository.deleteProduct(tProductModel.id);

      verify(mockRemoteDataSource.deleteProduct(tProductModel.id));
      verify(mockLocalDataSource.deleteProduct(tProductModel.id));
    });

    test('should delete product from local data source only when offline', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.deleteProduct(any)).thenAnswer((_) async => {});

      await repository.deleteProduct(tProductModel.id);

      verifyNever(mockRemoteDataSource.deleteProduct(tProductModel.id));
      verify(mockLocalDataSource.deleteProduct(tProductModel.id));
    });
  });


  group('getAllProducts', () {
    final tProductList = [tProductModel];

    test('should return remote data when online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllProducts()).thenAnswer((_) async => tProductList);
      when(mockLocalDataSource.cacheProducts(any)).thenAnswer((_) async => {});

      final result = await repository.getAllProducts();

      verify(mockRemoteDataSource.getAllProducts());
      verify(mockLocalDataSource.cacheProducts(tProductList));
      expect(result, tProductList);
    });

    test('should return local data when offline', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getAllProducts()).thenAnswer((_) async => tProductList);

      final result = await repository.getAllProducts();

      verifyNever(mockRemoteDataSource.getAllProducts());
      verify(mockLocalDataSource.getAllProducts());
      expect(result, tProductList);
    });
  });

  group('getProductById', () {
    test('should return remote data when online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getProductById(any)).thenAnswer((_) async => tProductModel);
      when(mockLocalDataSource.cacheProducts(any)).thenAnswer((_) async => {});

      final result = await repository.getProductById(tProductModel.id);

      verify(mockRemoteDataSource.getProductById(tProductModel.id));
      verify(mockLocalDataSource.cacheProducts([tProductModel]));
      expect(result, tProductModel);
    });

    test('should return local data when offline', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getProductById(any)).thenAnswer((_) async => tProductModel);

      final result = await repository.getProductById(tProductModel.id);

      verifyNever(mockRemoteDataSource.getProductById(tProductModel.id));
      verify(mockLocalDataSource.getProductById(tProductModel.id));
      expect(result, tProductModel);
    });
  });
}
