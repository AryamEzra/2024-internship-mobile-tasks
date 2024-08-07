import 'package:dartz/dartz.dart';
import 'package:task_9/core/failure/failure.dart';
import 'package:task_9/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProductById(int id);
  Future<Either<Failure, Product>> addProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, Product>> deleteProduct(int id);
}