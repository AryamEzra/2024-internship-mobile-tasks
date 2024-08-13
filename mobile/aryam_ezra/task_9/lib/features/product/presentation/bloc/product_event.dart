part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class GetAllProductsEvent extends ProductEvent {
  const GetAllProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductByIdEvent extends ProductEvent {
  final String id;

  const GetProductByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddProductEvent extends ProductEvent {
  final Product product;

  const AddProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateProductEvent extends ProductEvent {
  final Product product;

  const UpdateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}