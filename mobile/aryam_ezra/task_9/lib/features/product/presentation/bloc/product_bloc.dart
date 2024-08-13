import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(InitialState()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });
    /*
    @override
    Stream<ProductState> (ProductEvent event) async* {
      yield LoadingState();
      if (event is GetAllProductsEvent) {
        try {
          final products = await productRepository.getAllProducts();
          yield LoadedAllProductsState(products);
        } catch (e) {
          yield ErrorState(e.toString());
        }
      } else if (event is GetProductByIdEvent) {
        try {
          final product = await productRepository.getProductById(event.id);
          yield LoadedSingleProductState(product);
        } catch (e) {
          yield ErrorState(e.toString());
        }
      } else if (event is AddProductEvent) {
        try {
          final productModel = ProductModel.fromJson(event.product as Map<String, dynamic>);
          final product = await productRepository.addProduct(productModel);
          yield LoadedSingleProductState(product);
        } catch (e) {
          yield ErrorState(e.toString());
        }
      } else if (event is DeleteProductEvent) {
        try {
          await productRepository.deleteProduct(event.id);
          yield InitialState();
        } catch (e) {
          yield ErrorState(e.toString());
        }
      } else if (event is UpdateProductEvent) {
        try {
          final productModel = ProductModel.fromJson(event.product as Map<String, dynamic>);
          final product = await productRepository.updateProduct(productModel);
          yield LoadedSingleProductState(product);
        } catch (e) {
          yield ErrorState(e.toString());
        }
      }
    }
    */
  }
}
