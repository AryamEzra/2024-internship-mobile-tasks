part of 'search_page_bloc.dart';

sealed class SearchPageEvent extends Equatable {
  const SearchPageEvent();

  @override
  List<Object> get props => [];
}

class SearchProducts extends SearchPageEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object> get props => [query];
}