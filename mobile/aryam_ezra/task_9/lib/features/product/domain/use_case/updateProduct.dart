import 'package:dartz/dartz.dart';
import 'package:task_9/core/failure/failure.dart';
import 'package:task_9/core/use_cases/UseCase.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';
import 'package:task_9/features/product/domain/entities/product.dart';



class UpdateProduct extends UseCase<Product, Product> {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.updateProduct(product);
  }
}