import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_9/features/product/data/models/product_model.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';
import 'package:task_9/features/product/domain/use_case/update_product.dart';
import 'update_product_test.mocks.dart';

class MockFile extends Mock implements File {}

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository productRepository;
  late UpdateProduct usecase;

  setUp(() {
    productRepository = MockProductRepository();
    usecase = UpdateProduct(productRepository);
  });

  const product = ProductModel(
    id: '1',
    name: 'Boots',
    price: 200,
    imageUrl: 'assets/images/boots.jpg',
    description:
        'These boots are made for walking and that\'s just what they\'ll do one of these days these boots are gonna walk all over you',
  );
  final params = UpdateProductParams(product);

  test('should update a product from the repository', () async {
    // Arrange
    when(productRepository.updateProduct(any))
        .thenAnswer((_) async => const Right(product));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, const Right(product));
    verify(productRepository.updateProduct(product));
    verifyNoMoreInteractions(productRepository);
  });
}
