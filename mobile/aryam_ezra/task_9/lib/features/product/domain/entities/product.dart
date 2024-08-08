import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  String name;
  String description;
  int id;
  double price;
  String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.id,
    required this.price,
    required this.imageUrl,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    description,
    id,
    price,
    imageUrl,
  ];
}
