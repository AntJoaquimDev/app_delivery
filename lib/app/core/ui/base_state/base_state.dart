import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/core/ui/helpers/messages.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../helpers/loader.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     controller.loadProducts();
  //   });
  // }

  void onReady() {}
}
