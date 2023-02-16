import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  ColorsApp._();

  static ColorsApp get inst {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF007d21);
  Color get secundary => Color(0xFFF88B0C);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.inst;
}
