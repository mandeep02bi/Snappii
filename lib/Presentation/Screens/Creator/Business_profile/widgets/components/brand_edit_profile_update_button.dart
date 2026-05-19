import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_theme.dart';

class BrandEditProfileUpdateButton extends StatelessWidget {
  const BrandEditProfileUpdateButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  static const _gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      BrandEditProfileTheme.gradientStart,
      BrandEditProfileTheme.gradientEnd,
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Ink(
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: _gradient,
              boxShadow: const [
                BoxShadow(
                  color: BrandEditProfileTheme.updateShadow,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
