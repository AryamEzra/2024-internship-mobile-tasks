part of 'details_page_bloc.dart';

sealed class DetailsPageState extends Equatable {
  const DetailsPageState();
  
  @override
  List<Object> get props => [];
}

final class DetailsPageInitialState extends DetailsPageState {}

final class DetailsPageLoadingState extends DetailsPageState {}

final class DetailsPageLoadedState extends DetailsPageState {
  final Product product;

  const DetailsPageLoadedState(this.product);

  @override
  List<Object> get props => [product];
}

final class DetailsPageErrorState extends DetailsPageState {
  final String message;

  const DetailsPageErrorState(this.message);

  @override
  List<Object> get props => [message];
}