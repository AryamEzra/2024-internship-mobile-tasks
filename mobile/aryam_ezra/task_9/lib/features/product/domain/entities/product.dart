import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  String name;
  String description;
  String? category;
  int id;
  double price;
  String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.id,
    required this.price,
    required this.imageUrl,
    this.category,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    description,
    category,
    id,
    price,
    imageUrl,
  ];
}
