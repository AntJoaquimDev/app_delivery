// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:delivery_app/app/core/exceptions/repositoryExcepition.dart';
import 'package:delivery_app/app/core/rest_client/custon_dio.dart';
import 'package:delivery_app/app/dto/order_dto.dart';
import 'package:delivery_app/app/models/payment_type_model.dart';
import 'package:dio/dio.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustonDio dio;
  OrderRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<PaymentTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');
      return result.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar forma de pagamentos', error: e, stackTrace: s);
      throw RepositoryExcepition('Erro ao buscar forma de pagamentos');
    }
  }

  @override
  Future<void> saveOrder(OrderDto order) async {
    try {
      await dio.auth().post('/orders', data: {
        'producs': order.products
            .map((p) => {
                  'id': p.product.id,
                  'amount': p.amount,
                  'total_price': p.totalPrice
                })
            .toList(),
        'user_id': '#userAuthRef',
        'address': order.address,
        'CPF': order.document,
        'payment_method_id': order.paymentMethodId
      });
    } on DioError catch (e, s) {
      log('Erro ao registrar um produto', error: e, stackTrace: s);
      throw RepositoryExcepition('Erro ao registrar um produto');
    }
  }
}
