import 'package:delivery_app/app/pages/order/widget/order_page.dart';
import 'package:delivery_app/app/pages/order/widget/order_controller.dart';
import 'package:delivery_app/app/repositories/order/order_repository.dart';
import 'package:delivery_app/app/repositories/order/order_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OrderRouter {
  OrderRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(
              create: (context) => OrderRepositoryImpl(dio: context.read())),
          Provider(create: (contex) => OrderController(contex.read())),
        ],
        child: OrderPage(),
      );
}
