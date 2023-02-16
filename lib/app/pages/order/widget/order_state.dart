// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/models/payment_type_model.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loading,
  loaded,
  error,
  updateOrder,
  confirmRemoveProduct,
  emptyBag,
  isSucess,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  final List<PaymentTypeModel> paymentTypes;
  final String? erroMessage;

  const OrderState({
    required this.status,
    required this.orderProducts,
    required this.paymentTypes,
    this.erroMessage,
  });
  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [],
        paymentTypes = const [],
        erroMessage = null;

  double get totalOrder => orderProducts.fold(
      0.0, (somaValue, total) => somaValue + total.totalPrice);

  @override
  List<Object?> get props => [status, orderProducts, paymentTypes, erroMessage];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? orderProducts,
    List<PaymentTypeModel>? paymentTypes,
    String? erroMessage,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
      paymentTypes: paymentTypes ?? this.paymentTypes,
      erroMessage: erroMessage ?? this.erroMessage,
    );
  }
}

class OrderConfirmDeleteProductState extends OrderState {
  final OrderProductDto orderProduct;
  final int index;

  const OrderConfirmDeleteProductState({
    required this.orderProduct,
    required this.index,
    required super.status,
    required super.orderProducts,
    required super.paymentTypes,
    super.erroMessage,
  });
}
