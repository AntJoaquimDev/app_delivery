import 'dart:developer';

import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/pages/home/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/products/products_repository.dart';

class HOmeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HOmeController(
    this._productsRepository,
  ) : super(HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      //await Future.delayed(Duration(seconds: 1)); // para testes
      final products = await _productsRepository.findAllProducts();
      //throw Exception(); // para teste de error
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];

    final orderIndex = shoppingBag
        .indexWhere((orderP) => orderP.product == orderProduct.product);
    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }

  void updateBag(List<OrderProductDto> updateBag) {
    emit(state.copyWith(shoppingBag: updateBag));
  }
}
