part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class FetchAllProductsEvent extends HomePageEvent {
  const FetchAllProductsEvent();

  @override
  List<Object> get props => [];
}