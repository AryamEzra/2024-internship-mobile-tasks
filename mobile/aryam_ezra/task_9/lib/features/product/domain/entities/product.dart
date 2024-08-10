import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  String name;
  String description;
  String id;
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
  List<Object?> get props => [
    name,
    description,
    id,
    price,
    imageUrl,
  ];
}
