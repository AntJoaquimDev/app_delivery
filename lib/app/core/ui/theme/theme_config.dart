import 'dart:ui';

import 'package:flutter/material.dart';

import '../styles/app_style.dart';
import '../styles/colors_app.dart';

class ThemeConfig {
  ThemeConfig._();
  String font = 'mplus1';
  static final _defultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    //scaffoldBackgroundColor: Colors.amber[50],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primaryColor: ColorsApp.inst.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.inst.primary,
      primary: ColorsApp.inst.primary,
      secondary: ColorsApp.inst.secundary,
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.instance.primaryButtom),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defultInputBorder,
      enabledBorder: _defultInputBorder,
      focusedBorder: _defultInputBorder,
      labelStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      errorStyle:
          const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
    ),
  );
}
