import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:task_9/features/product/domain/entities/product.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';
import 'package:task_9/features/product/domain/use_case/get_product.dart';
import 'test_mocks_all.mocks.dart';

class MockFile extends Mock implements File {}

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository productRepository;
  late GetProduct usecase;

  setUp(() {
    productRepository = MockProductRepository();
    usecase = GetProduct(productRepository);
  });
  final product = Product(
    name: 'Boots',
    id: 1,
    category: 'Women\'s shoe',
    price: 199.99,
    imageUrl: 'assets/images/boots.jpg',
    description:
        'These boots are made for walking and that\'s just what they\'ll do one of these days these boots are gonna walk all over you',
  );
  test('should display a single product from the repository', () async {
    // Arrange
    when(productRepository.getProductById(product.id))
        .thenAnswer((_) async => Right(product));

    // Act
    final result = await usecase(GetProductParams(id: product.id));

    // Assert
    expect(result, equals(Right(product)));
    verify(productRepository.getProductById(product.id));
    verifyNoMoreInteractions(productRepository);
  });
}
