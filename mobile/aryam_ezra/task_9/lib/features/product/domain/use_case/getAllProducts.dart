import 'package:dartz/dartz.dart';
import 'package:task_9/core/use_cases/no_para_use_case.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';
import 'package:task_9/features/product/domain/entities/product.dart';
import 'package:task_9/core/failure/failure.dart';

class GetAllProducts extends NoParamsUseCase<Future<Either<Failure, List<Product>>>> {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
