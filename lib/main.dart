import 'package:flutter/material.dart';

import 'package:delivery_app/app/delivery_app.dart';

import 'app/core/config/env/env.dart';

Future<void> main() async {
  await Env.inst.load();
  runApp(DeliveryApp());
}
//aula 2 48minzz 