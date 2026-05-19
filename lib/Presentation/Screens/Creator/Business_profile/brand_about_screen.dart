import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/business_profile_widgets.dart';

class BrandAboutScreen extends StatelessWidget {
  const BrandAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LightBackgroundSystemUi(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BrandSubPageHeader(title: 'About', onBack: Get.back),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  children: [
                    BrandAboutLinkRow(
                      icon: Icons.article_outlined,
                      title: 'Terms & Condition',
                      onTap: () {},
                    ),
                    const SizedBox(height: 13),
                    BrandAboutLinkRow(
                      icon: Icons.shield_outlined,
                      title: 'Privacy Policy',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
