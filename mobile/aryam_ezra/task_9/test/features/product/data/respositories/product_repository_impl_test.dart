import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_9/core/connectivity/network_info.dart';
import 'package:task_9/features/product/data/data_sources/product_local_data_source.dart';
import 'package:task_9/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/features/product/data/repositories/product_repository_impl.dart';
import 'package:task_9/features/product/domain/entities/product.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDataSource {}

class MockLocalDataSource extends Mock implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Future<bool> get isConnected => super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: Future.value(true),
        returnValueForMissingStub: Future.value(true),
      ) as Future<bool>;
}

void main() {
  late ProductRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('addProduct', () {
    final product = Product(
      name: 'Boots',
      id: 1,
      category: 'Women\'s shoe',
      price: 199.99,
      imageUrl: 'assets/images/boots.jpg',
      description:
          'These boots are made for walking and that\'s just what they\'ll do one of these days these boots are gonna walk all over you',
    );

    test(
      'should check if the device is online',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        // Act
        final result = await repository.addProduct(product);

        // Assert
        expect(result, Right(product));
      },
    );
  });
}
