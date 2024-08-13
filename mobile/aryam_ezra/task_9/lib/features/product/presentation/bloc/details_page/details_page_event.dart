part of 'details_page_bloc.dart';

sealed class DetailsPageEvent extends Equatable {
  const DetailsPageEvent();

  @override
  List<Object> get props => [];
}

class FetchProductByIdEvent extends DetailsPageEvent {
  final String id;

  const FetchProductByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class DeleteDetailsEvent extends DetailsPageEvent {
  final String id;

  const DeleteDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}