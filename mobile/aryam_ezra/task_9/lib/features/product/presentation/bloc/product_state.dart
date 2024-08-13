part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class InitialState extends ProductState {}

final class LoadingState extends ProductState {}

final class LoadedAllProductsState extends ProductState {
  final List<Product> products;

  const LoadedAllProductsState(this.products);

  @override
  List<Object> get props => [products];
}

final class LoadedSingleProductState extends ProductState {
  final Product product;

  const LoadedSingleProductState(this.product);

  @override
  List<Object> get props => [product];
}


final class ErrorState extends ProductState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
