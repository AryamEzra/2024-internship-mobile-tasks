
import 'package:dartz/dartz.dart';
import '../../../../core/connectivity/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart';
import '../models/product_model.dart';



class ProductRepositoryImpl extends ProductRepository{
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Product>> addProduct(Product product) async {
    // Existing code...
    throw UnimplementedError();
  }
    
    /*
    if (await networkInfo.isConnected) {
      
      // This is a placeholder return statement
      // Replace it with actual remote data source call later
      // return Right(product); //- checked if device was online
      return Right(await remoteDataSource.addProduct(product));
    } else {
      // Handle the case when the device is offline
      return const Left(CacheFailure('No internet connection'));
    }
    */
    
    // if (await networkInfo.isConnected) {
    //   try {
    //     final remoteProduct = await remoteDataSource.addProduct(ProductModel.product);
    //     localDataSource.cacheProduct(remoteProduct);
    //     return Right(remoteProduct);
    //   } on ServerException{
    //     return Left(ServerFailure(message: 'Server failure'));
    //   }}
    // else {
    //   try {
    //     final localProduct = await localDataSource.addProduct(product);
    //     return Right(localProduct);
    //   } on CacheException {
    //     return Left(CacheFailure(message: 'Cache failure'));
    //   }
    // }
  
  

   @override
  Future<Either<Failure, void>> deleteProduct(id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Product>> getProductById(id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Product>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  
}

