import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();
  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  String get font => 'mplus1';

  ButtonStyle get primaryButtom => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      backgroundColor: ColorsApp.inst.primary,
      textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: font,
          fontSize: 14)); //nao consegui copy instance min 134
}

extension appStylesExtensions on BuildContext {
  AppStyles get AppStyle => AppStyles.instance;
}
