import 'package:flutter/material.dart';

abstract final class BrandWalletTheme {
  static const headerPurple = Color(0xFFA774FF);
  static const sheetBackground = Color(0xFFEEECF3);
  static const chipBorder = Color(0x8CAAAAAA);
  static const balanceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFBB93FF), Color(0xFF5765FF)],
  );
  static const payGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFBB93FF), Color(0xFF5765FF)],
  );
}
