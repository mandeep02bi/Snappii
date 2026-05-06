import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
  static const header = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );

  static const label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const row = TextStyle(
    fontSize: 14,
  );
}
