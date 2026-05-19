import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Business/Wallet_screen/Wallet_screen.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Widgets/Settinf_tiles.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// BACK + TITLE
              Row(
                children: const [
                  // Icon(Icons.arrow_back, size: 26),
                  Spacer(),
                  Text(
                    "Setting",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Spacer(),
                ],
              ),

              const SizedBox(height: 40),

              /// MENU ITEMS
              SettingTile(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () => Get.toNamed('/Brand-Edit-Profile'),
              ),
              SettingTile(
                icon: Icons.wallet_outlined,
                title: "Wallet",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const WalletScreen()),
                  );
                },
              ),
              SettingTile(
                icon: Icons.calendar_month_outlined,
                title: "Book Service",
                onTap: () {},
              ),
              SettingTile(
                icon: Icons.support_agent_outlined,
                title: "Support",
                onTap: () {},
              ),
              SettingTile(
                icon: Icons.article_outlined,
                title: "Terms & conditions",
                onTap: () {},
              ),
              SettingTile(
                icon: Icons.info_outline,
                title: "About",
                onTap: () {},
              ),
              SettingTile(icon: Icons.logout, title: "Logout", onTap: () {}),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNavigationBar (),
    );
  }
}
