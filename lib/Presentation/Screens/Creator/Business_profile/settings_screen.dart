import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/business_profile_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _purple = Color(0xFFA470FF);

  @override
  Widget build(BuildContext context) {
    return LightBackgroundSystemUi(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: _purple,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Setting',
                      style: TextStyle(
                        color: _purple,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // الكارد الرئيسي
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.grey.withOpacity(0.15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildItem(
                        icon: Icons.person_add_alt_1_outlined,
                        title: 'Edit Profile',
                        showArrow: false,
                        onTap: () {},
                      ),
                      _divider(),
                      _buildItem(
                        icon: Icons.manage_accounts_outlined,
                        title: 'Account',
                        showArrow: true,
                        onTap: () {},
                      ),
                      _divider(),
                      _buildItem(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Wallet',
                        showArrow: false,
                        onTap: () {},
                      ),
                      _divider(),
                      _buildItem(
                        icon: Icons.help_outline_rounded,
                        title: 'Help',
                        showArrow: false,
                        onTap: () {},
                      ),
                      _divider(),
                      _buildItem(
                        icon: Icons.info_outline_rounded,
                        title: 'About',
                        showArrow: true,
                        onTap: () {},
                      ),
                      _divider(),
                      _buildItem(
                        icon: Icons.logout_rounded,
                        title: 'Logout',
                        showArrow: false,
                        isLast: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showArrow = false,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            if (showArrow)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Colors.black45,
              ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      indent: 54,
      endIndent: 18,
      color: Colors.grey.withOpacity(0.18),
    );
  }
}
