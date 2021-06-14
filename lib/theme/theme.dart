import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextTheme {
  static TextStyle? get title =>
      TextStyle(color: AppColorTheme.textColor, fontSize: 24);
}

class AppColorTheme {
  static get darkMainColor => Color(0xFF962714);
  static get lightMainColor => Color(0xFFCE4E33);
  static get textColor => Color(0xFF2A2A32);
  static get backgroundColor => Color(0xFFF5F7FE);
  static get darkBackgroundColor => Color(0xFF2A2A32);
  static get darkModetextColor => Colors.white;
}
