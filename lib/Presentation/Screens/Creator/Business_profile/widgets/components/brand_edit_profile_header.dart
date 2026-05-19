import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_theme.dart';

class BrandEditProfileHeader extends StatelessWidget {
  const BrandEditProfileHeader({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 16, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: BrandEditProfileTheme.headerPurple,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Edit Profile',
            style: TextStyle(
              color: BrandEditProfileTheme.headerPurple,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
