import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_page_event.dart';
part 'update_page_state.dart';

class UpdatePageBloc extends Bloc<UpdatePageEvent, UpdatePageState> {
  UpdatePageBloc() : super(UpdatePageInitial()) {
    on<UpdatePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
