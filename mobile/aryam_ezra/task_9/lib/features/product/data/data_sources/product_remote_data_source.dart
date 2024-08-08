import 'package:task_9/features/product/domain/entities/product.dart';
import 'package:task_9/features/product/data/models/product_model.dart';


abstract class ProductRemoteDataSource {
  Future<ProductModel> getAllProducts();
  Future<ProductModel> getProductById(int id);
  Future<ProductModel> addProduct(Product product);
  Future<ProductModel> updateProduct(Product product);
  Future<ProductModel> deleteProduct(int id);
}