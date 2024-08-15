import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/connectivity/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final imagePath = 'assets/images/boots.jpg';

  @override
  Future<Either<Failure, ProductModel>> addProduct(
      ProductModel productModel, String imagePath) async {
    if (await networkInfo.isConnected) {
      try {
        if (imagePath.isNotEmpty) {
          final remoteProduct =
              await remoteDataSource.addProduct(productModel, imagePath);
          if (remoteProduct != null) {
            await localDataSource.addProduct(remoteProduct);
            return Right(remoteProduct);
          } else {
            return Left(
                ServerFailure(message: 'Failed to add product remotely.'));
          }
        } else {
          return Left(ServerFailure(message: 'Image path is empty.'));
        }
      } on ServerException {
        return Left(ServerFailure(message: 'Server failure.'));
      }
    } else {
      await localDataSource.addProduct(productModel);
      return Left(NetworkFailure(message: 'No internet connection.'));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(Product product,
      {File? imageFile}) async {
    if (await networkInfo.isConnected) {
      try {
        final productModel = ProductModel(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
        );

        await remoteDataSource.updateProduct(productModel.id, productModel);
        await localDataSource.updateProduct(productModel);
        return Right(productModel);
      } on ServerException {
        return Left(ServerFailure(message: 'Server failure.'));
      }
    } else {
      try {
        final productModel = ProductModel(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
        );
        await localDataSource.updateProduct(productModel);
        return Right(productModel);
      } on CacheException {
        return Left(CacheFailure(message: 'Failed to update product locally.'));
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      if (await networkInfo.isConnected) {
        final remoteProducts = await remoteDataSource.getAllProducts();
        await localDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts);
      } else {
        final localProducts = await localDataSource.getAllProducts();
        return Right(localProducts);
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to fetch products.'));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    try {
      if (await networkInfo.isConnected) {
        final remoteProduct = await remoteDataSource.getProductById(id);
        await localDataSource.cacheProducts([remoteProduct]);
        return Right(remoteProduct);
      } else {
        final localProduct = await localDataSource.getProductById(id);
        return Right(localProduct);
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to fetch product.'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.deleteProduct(id);
        await localDataSource.deleteProduct(id);
        return const Right(null);
      } else {
        await localDataSource.deleteProduct(id);
        return const Right(null);
      }
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to delete product.'));
    }
  }
}
