import 'package:dartz/dartz.dart';
import 'package:task_9/core/use_cases/UseCase.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';
import 'package:task_9/features/product/domain/entities/product.dart';
import 'package:task_9/core/failure/failure.dart';

class GetProductParams {
  final int id;
  GetProductParams({required this.id});
}
class GetProduct extends UseCase<Product, GetProductParams> {

  ProductRepository repository;
  GetProduct(this.repository);
  @override
  Future<Either<Failure, Product>> call (GetProductParams params) async {
    return await repository.getProductById(params.id);
  }
}

