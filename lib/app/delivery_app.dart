import 'package:delivery_app/app/core/global/global_context.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/pages/auth/login/login_router.dart';
import 'package:delivery_app/app/pages/auth/register/register_router.dart';
import 'package:delivery_app/app/pages/home/home-router.dart';
import 'package:delivery_app/app/pages/order/widget/order_complet_page.dart';
import 'package:delivery_app/app/pages/order/widget/order_router.dart';
import 'package:delivery_app/app/pages/prduct_detail/product_detail_route.dart';
import 'package:delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/provider/aplication_binding.dart';

class DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();
  DeliveryApp({super.key}) {
    GlobalContext.inst.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
      child: MaterialApp(
        title: 'Delivery-App',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.pages,
          '/productDetail': (context) => ProductDetailRoute.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
          '/order/completed': (context) => const OrderCompletPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
// CustomSnackBar.error(message: 'Login expirado clique na sacola novamnete'backgroundColor: Colors.b,)