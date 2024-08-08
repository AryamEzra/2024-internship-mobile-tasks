import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource{
  Future<ProductModel> getlastProuct(int id);
  Future<void> cacheProduct(ProductModel productToCach);
  addProduct (Product product);


}