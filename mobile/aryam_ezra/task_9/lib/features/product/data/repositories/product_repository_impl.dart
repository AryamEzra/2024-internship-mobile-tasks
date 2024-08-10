import '../../../../core/connectivity/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart';
import '../models/product_model.dart';

abstract class ProductRepository {
  Future<ProductModel> addProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(String id);
}

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
  Future<ProductModel> addProduct(ProductModel product) async {
    if (await networkInfo.isConnected) {
      final remoteProduct = await remoteDataSource.addProduct(product, imagePath);
      await localDataSource.addProduct(remoteProduct);
      return remoteProduct;
    } else {
      return await localDataSource.addProduct(product);
    }
  }
    

  @override
  Future<void> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        await localDataSource.deleteProduct(id);
      } on ServerException {
        throw ServerException();
      }
    } else {
      await localDataSource.deleteProduct(id);
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProduct(product.id, product);
        await localDataSource.updateProduct(product);
      } on ServerException {
        throw ServerException();
      }
    } else {
      await localDataSource.updateProduct(product);
    }
    
    // Add a return statement here
    return product;
    // throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProducts();
        await localDataSource.cacheProducts(remoteProducts);
        return remoteProducts;
      } on ServerException {
        return await localDataSource.getAllProducts();
      }
    } else {
      return await localDataSource.getAllProducts();
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProductById(id);
        await localDataSource.cacheProducts([remoteProduct]);
        return remoteProduct;
      } on ServerException {
        return await localDataSource.getProductById(id);
      }
    } else {
      return await localDataSource.getProductById(id);
    }
  }
}

