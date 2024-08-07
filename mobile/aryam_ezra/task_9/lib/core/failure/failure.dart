import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Failure extends Equatable {
  String message;
  Failure({required this.message});
  @override
  List<Object> get props => [message];
}