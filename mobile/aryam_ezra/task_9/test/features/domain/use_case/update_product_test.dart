import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:task_9/features/product/domain/entities/product.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';
import 'package:task_9/features/product/domain/use_case/updateProduct.dart';
import 'test_mocks_all.mocks.dart';

class MockFile extends Mock implements File {}

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository productRepository;
  late UpdateProduct usecase;
  late MockFile mockFile;

  setUp(() {
    productRepository = MockProductRepository();
    usecase = UpdateProduct(productRepository);
    mockFile = MockFile();

    
  });
  

  test('should add a product to the repository', () async {
    var product = Product(
      name: 'Boots',
      id: 1,
      category: 'Women\'s shoe',
      price: 199.99,
      image: mockFile,
      description:
          'These boots are made for walking and that\'s just what they\'ll do one of these days these boots are gonna walk all over you',
    );
    
    //Arrange
    when(productRepository.updateProduct(product))
        .thenAnswer((_) async => Right(product));

    //Act
    final result = await usecase(product);

    //Assert
    expect(result, Right(product));
    verify(productRepository.updateProduct(product));
    verifyNoMoreInteractions(productRepository);
  });
}
