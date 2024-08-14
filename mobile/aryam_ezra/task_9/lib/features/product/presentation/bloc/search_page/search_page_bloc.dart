import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/repository/product_repository.dart'; // Adjust the import according to your project structure

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  final ProductRepository productRepository;

  SearchPageBloc(this.productRepository) : super(SearchPageInitialState()) {
    on<SearchPageEvent>(_onSearchProduct as EventHandler<SearchPageEvent, SearchPageState>);
  }

  void _onSearchProduct(SearchPageState event, Emitter<SearchPageState> emit) async {
    emit(SearchPageLoadingState());
    try {
      // final products = await productRepository.searchProducts(event.query);
      // emit(SearchPageLoadedState(products));
    } catch (e) {
      emit(SearchPageErrorState(e.toString()));
    }
  }
}
