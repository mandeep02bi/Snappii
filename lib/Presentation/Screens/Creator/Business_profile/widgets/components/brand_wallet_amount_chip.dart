import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_wallet_theme.dart';

class BrandWalletAmountChip extends StatelessWidget {
  const BrandWalletAmountChip({
    super.key,
    required this.amount,
    required this.selected,
    required this.onTap,
  });

  final int amount;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? BrandWalletTheme.headerPurple.withValues(alpha: 0.12) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: selected ? BrandWalletTheme.headerPurple : BrandWalletTheme.chipBorder,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 46,
          child: Center(
            child: Text(
              '₹ $amount',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: selected ? BrandWalletTheme.headerPurple : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
