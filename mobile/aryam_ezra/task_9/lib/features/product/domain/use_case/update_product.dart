import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';



class UpdateProduct extends UseCase<Product, Product> {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(Product params) async {
    return await repository.updateProduct(params);
  }
}