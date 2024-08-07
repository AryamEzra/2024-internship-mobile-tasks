import 'package:dartz/dartz.dart';
import 'package:task_9/core/failure/failure.dart';
import 'package:task_9/core/use_cases/UseCase.dart';
import 'package:task_9/features/product/domain/repository/product_repository.dart';

// Define a class to represent the parameters needed for deletion
class DeleteProductParams {
  final int id;

  DeleteProductParams(this.id);
}


class DeleteProduct
    extends UseCase<void, DeleteProductParams> {
  ProductRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteProductParams params) async {
    return await repository.deleteProduct(params.id);
  }
}
