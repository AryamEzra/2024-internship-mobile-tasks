import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_9/features/product/domain/entities/product.dart';

import '../../../domain/use_case/get_product.dart';

part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  final GetProduct getProduct;

  DetailsPageBloc(this.getProduct) : super(DetailsPageInitialState()) {
    on<FetchProductByIdEvent>(_onFetchProductByIdEvent);
  }

  Future<void> _onFetchProductByIdEvent(
      FetchProductByIdEvent event, Emitter<DetailsPageState> emit) async {
    try {
      emit(DetailsPageLoadingState());
      final product = await getProduct(event.id as GetProductParams);
      emit(DetailsPageLoadedState(product as Product));
    } catch (e) {
      emit(DetailsPageErrorState(e.toString()));
    }
  }
}
