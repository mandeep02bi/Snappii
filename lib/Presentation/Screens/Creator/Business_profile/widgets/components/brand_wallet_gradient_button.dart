import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_wallet_theme.dart';

class BrandWalletGradientButton extends StatelessWidget {
  const BrandWalletGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          height: 49,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: BrandWalletTheme.payGradient,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE1D0FF).withValues(alpha: 0.55),
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
