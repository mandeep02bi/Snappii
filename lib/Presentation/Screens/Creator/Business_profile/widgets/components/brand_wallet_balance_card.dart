import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_wallet_theme.dart';

class BrandWalletBalanceCard extends StatelessWidget {
  const BrandWalletBalanceCard({
    super.key,
    required this.balance,
    this.onAddMoney,
    this.showAddMoneyButton = true,
  });

  final double balance;
  final VoidCallback? onAddMoney;
  final bool showAddMoneyButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: BrandWalletTheme.balanceGradient,
      ),
      child: Column(
        children: [
          const Text(
            'Current Balance',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            '₹${balance.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const Spacer(),
          if (showAddMoneyButton && onAddMoney != null)
            Align(
              alignment: Alignment.center,
              child: Material(
                color: Colors.white,
                shape: const StadiumBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: onAddMoney,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: Text(
                      '+ Add Money',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
