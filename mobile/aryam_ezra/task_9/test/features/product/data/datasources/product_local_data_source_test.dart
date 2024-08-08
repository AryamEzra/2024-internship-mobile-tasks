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

import '../respositories/product_repository_impl_test.mocks.dart' as repo_mocks;
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
    id: 1,
    price: 199.99,
    imageUrl: 'assets/images/boots.jpg',
    description: 'These boots are made for walking and that\'s just what they\'ll do...',
  );

  final tProductModel = ProductModel(
    id: 1,
    name: 'Test Product',
    description: 'This is a test product',
    price: 199.99,
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
