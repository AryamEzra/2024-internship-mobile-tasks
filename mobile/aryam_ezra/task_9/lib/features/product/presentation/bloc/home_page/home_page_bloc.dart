import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product.dart';

import '../../../domain/use_case/get_all_products.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';


class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetAllProducts getAllProducts;

  HomePageBloc(this.getAllProducts) : super(HomePageInitialState()) {
    on<FetchAllProductsEvent>(_onFetchAllProducts);
  }

  Future<void> _onFetchAllProducts(FetchAllProductsEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoadingState());
    final result = await getAllProducts.call();
    result.fold(
      (failure) => emit(const HomePageErrorState('Failed to fetch products')),
      (products) => emit(HomePageLoadedState(products)),
    );
  }
}

