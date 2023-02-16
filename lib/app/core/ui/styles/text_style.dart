// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self isntance
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'mplus1';
  TextStyles({required String fontFamily, required FontWeight fontWeight});

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: font);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: font);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: font);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: font);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: font);

  TextStyle get TextButtonLabel => textBold.copyWith(fontSize: 14);
  TextStyle get TextTitle => textExtraBold.copyWith(fontSize: 28);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyle => TextStyles.instance;
}
// min 134