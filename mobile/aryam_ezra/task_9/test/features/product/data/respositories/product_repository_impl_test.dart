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