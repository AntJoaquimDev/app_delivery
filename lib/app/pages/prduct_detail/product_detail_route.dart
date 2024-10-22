import 'package:delivery_app/app/pages/prduct_detail/product_datail_page.dart';
import 'package:delivery_app/app/pages/prduct_detail/product_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductDetailRoute {
  ProductDetailRoute._();
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          ),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductDetailPage(
              product: args['product'], order: args['order']);
        },
      );
}
