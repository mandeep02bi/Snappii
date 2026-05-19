import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_theme.dart';

class BrandEditProfileDisclaimerBox extends StatelessWidget {
  const BrandEditProfileDisclaimerBox({super.key});

  static const _text =
      'These details help us verify your business identity, generate invoices when applicable, and maintain a trusted platform for brand-creator collaborations. Providing accurate information ensures secure payments, smooth onboarding, and compliance readiness.';

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(
            BorderSide(color: BrandEditProfileTheme.borderColor),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Text(
            _text,
            style: TextStyle(fontSize: 11, height: 1.35, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
