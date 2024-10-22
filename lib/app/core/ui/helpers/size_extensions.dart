import 'package:flutter/material.dart';

extension SizeExtenssions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeigth => MediaQuery.of(this).size.height;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeigth(double percent) => screenHeigth * percent;
}
