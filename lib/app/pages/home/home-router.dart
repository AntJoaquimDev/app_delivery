import 'package:delivery_app/app/pages/home/hOme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:delivery_app/app/pages/home/home_page.dart';
import 'package:delivery_app/app/repositories/products/products_repositore_impl.dart';
import 'package:delivery_app/app/repositories/products/products_repository.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get pages => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoreImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HOmeController(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
