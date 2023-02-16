import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/dto/order_dto.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/pages/order/widget/order_state.dart';
import 'package:delivery_app/app/repositories/order/order_repository.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  OrderController(this._orderRepository) : super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentTypes = await _orderRepository.getAllPaymentsTypes();

      emit(state.copyWith(
        orderProducts: products,
        status: OrderStatus.loaded,
        paymentTypes: paymentTypes,
      ));
    } catch (e, s) {
      log('Erro ao carregar a pagina ', error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderStatus.error, erroMessage: 'Erro ao carregar a pagina'));
    }
  }

  void incrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    orders[index] = order.copyWith(amount: order.amount + 1);
    emit(
        state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder));
  }

  void decrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    final amount = order.amount;
    if (amount == 1) {
      //alanalizar a exclusão do produto
      if (state.status != OrderStatus.confirmRemoveProduct) {
        emit(OrderConfirmDeleteProductState(
          orderProduct: order,
          index: index,
          status: OrderStatus.confirmRemoveProduct,
          orderProducts: state.orderProducts,
          paymentTypes: state.paymentTypes,
          erroMessage: state.erroMessage,
        ));
        return; //prematuryReturn
      } else {
        orders.removeAt(index);
      }
    } else {
      orders[index] = order.copyWith(amount: order.amount - 1);
    }
    if (orders.isEmpty) {
      emit(state.copyWith(status: OrderStatus.emptyBag));
      return;
    }
    emit(
        state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder));
  }

  void cancelDeleteProcess() {
    emit(state.copyWith(status: OrderStatus.loaded));
  }

  void empytBag() {
    emit(state.copyWith(status: OrderStatus.emptyBag));
  }

  void saveOrder({
    required String address,
    required String document,
    required int paymentMethodId,
  }) async {
    emit(state.copyWith(status: OrderStatus.loading));
    await _orderRepository.saveOrder(OrderDto(
      products: state.orderProducts,
      address: address,
      document: document,
      paymentMethodId: paymentMethodId,
    ));
    emit(state.copyWith(status: OrderStatus.isSucess));
  }
}
