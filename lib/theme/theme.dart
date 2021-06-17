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
  // static get darkBackgroundColor => Color(0xFF2A2A32);
  // static get darkModetextColor => Colors.white;
  static get darkModeBackground => Color(0xFF21262D);
  static get darkModeTitle => Color(0xFFC9D1D9);
  static get darkModeSubtitle => Color(0xFF6E7681);
  static get darkModeSecondaryTitle => Color(0xFFF4FAFF);
}
