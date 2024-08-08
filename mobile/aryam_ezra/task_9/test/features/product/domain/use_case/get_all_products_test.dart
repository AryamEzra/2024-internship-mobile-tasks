import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:task_9/features/product/domain/entities/product.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';
import 'package:task_9/features/product/domain/use_case/get_all_products.dart'
    show GetAllProducts;
import 'test_mocks_all.mocks.dart';

class MockFile extends Mock implements File {}

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository productRepository;
  late GetAllProducts usecase;

  setUp(() {
    productRepository = MockProductRepository();
    usecase = GetAllProducts(productRepository);
  });
  final product = Product(
    name: 'Boots',
    id: 1,
    price: 199.99,
    imageUrl: 'assets/images/boots.jpg',
    description:
        'These boots are made for walking and that\'s just what they\'ll do one of these days these boots are gonna walk all over you',
  );
  test('should display all products from the repository', () async {
    // Arrange
    final products = [product];
    when(productRepository.getAllProducts())
        .thenAnswer((_) async => Right(products));

    // Act
    final result = await usecase();

    // Assert
    expect(result, equals(Right(products))); // Use equals for direct comparison
    verify(productRepository.getAllProducts());
    verifyNoMoreInteractions(productRepository);
  });
}
