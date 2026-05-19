import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/business_profile_widgets.dart';

class BrandWalletScreen extends StatelessWidget {
  const BrandWalletScreen({super.key});

  static const _balance = 200.45;

  @override
  Widget build(BuildContext context) {
    return LightBackgroundSystemUi(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BrandSubPageHeader(
                title: 'My Wallet',
                onBack: Get.back,
                titleColor: BrandWalletTheme.headerPurple,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                child: BrandWalletBalanceCard(
                  balance: _balance,
                  onAddMoney: () => Get.toNamed('/Brand-Wallet-Add-Money'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
