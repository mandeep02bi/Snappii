import 'package:flutter/material.dart';

/// Shared tokens for the brand edit profile form.
abstract final class BrandEditProfileTheme {
  static const headerPurple = Color(0xFFBB93FF);
  static const borderColor = Color(0x33000000);
  static const gradientStart = Color(0xFFBB93FF);
  static const gradientEnd = Color(0xFF5765FF);
  static const updateShadow = Color(0x8CE1D0FF);

  static const fieldTextStyle = TextStyle(fontSize: 15, color: Colors.black87);
  static const labelTextStyle = TextStyle(fontSize: 15, color: Colors.black);
  static const sectionTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static final inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: headerPurple),
    ),
  );
}
