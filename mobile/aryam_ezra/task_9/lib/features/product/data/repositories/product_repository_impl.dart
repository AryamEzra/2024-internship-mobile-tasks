import 'package:dartz/dartz.dart';
import '../../../../core/connectivity/network_info.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart';



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
    if (await networkInfo.isConnected) {
      // This is a placeholder return statement
      // Replace it with actual remote data source call later
      return Right(product);
    } else {
      // Handle the case when the device is offline
      return const Left(CacheFailure('No internet connection'));
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Product>> getProductById(int id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Product>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, Product>>? getProductById(int id){return null;}

  // @override
  // Future<Either<Failure, List<Product>>> getAllProducts(){return null;}

  // @override
  // Future<Either<Failure, Product>> updateProduct(Product product){return null;}
  
  // @override
  // Future<Either<Failure, void>> deleteProduct(int id){return null;}

}
