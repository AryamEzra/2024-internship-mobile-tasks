import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_page_event.dart';
part 'add_page_state.dart';

class AddPageBloc extends Bloc<AddPageEvent, AddPageState> {
  AddPageBloc() : super(AddPageInitialState()) {
    on<AddPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
