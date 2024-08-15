import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/product_model.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<Either<Failure, ProductModel>> call(UpdateProductParams params) async {
    return await repository.updateProduct(params.product);
  }
}

class UpdateProductParams {
  final ProductModel product;

  UpdateProductParams(this.product);
}
