// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/app/core/ui/base_state/base_state.dart';

import 'package:delivery_app/app/pages/home/home_state.dart';
import 'package:delivery_app/app/pages/prduct_detail/shopping_bag_widget.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_products_tile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery_app/app/pages/home/hOme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HOmeController> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     controller.loadProducts();
  //   });
  // }

  @override
  void onReady() {
    // SharedPreferences.getInstance().then((value) => value.clear()); // limpar o sharedPref
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: BlocConsumer<HOmeController, HomeState>(
          listener: (context, state) {
            state.status.matchAny(
                any: () => hiderLoader(),
                loading: () => showLoader(),
                error: () {
                  hiderLoader();
                  ShowError(state.errorMessage ?? 'Error não informado');
                  hiderLoader();
                });
          },
          buildWhen: (previous, current) => current.status.matchAny(
                any: () => false,
                initial: () => true,
                loaded: () => true,
              ),
          builder: (context, state) {
            return Column(
              children: [
                //Text(state.shoppingBag.length.toString()),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      final order = state.shoppingBag
                          .where((order) => order.product == product);
                      return DeliveryProductsTile(
                        product: product,
                        orderProduc: order.isNotEmpty ? order.first : null,
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: state.shoppingBag.isNotEmpty,
                  child: ShoppingBagWidget(bag: state.shoppingBag),
                ),
              ],
            );
          }),
    );
  }
}
