part of 'add_page_bloc.dart';

sealed class AddPageState extends Equatable {
  const AddPageState();
  
  @override
  List<Object> get props => [];
}

final class AddPageInitialState extends AddPageState {}

final class AddPageSubmittingState extends AddPageState {}

final class AddPageSumbittedState extends AddPageState {} 

final class AddPageErrorState extends AddPageState {
  final String message;

  const AddPageErrorState(this.message);

  @override
  List<Object> get props => [message];
}
