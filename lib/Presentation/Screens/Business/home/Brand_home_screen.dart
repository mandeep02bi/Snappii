import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/brand_bottom_nav.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/circular_action.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/header_icon.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/video_card.dart';
import 'package:snappis/Presentation/Widgets/Banner_slidder.dart';
import 'package:snappis/Presentation/Widgets/Search_Bar.dart' as custom;

class BrandHomeScreen extends StatelessWidget {
  const BrandHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA774FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "@Kumar joined",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    HeaderIcon(icon: Icons.play_circle_outline),
                    const SizedBox(width: 8),
                    HeaderIcon(icon: Icons.notifications_none),
                    const SizedBox(width: 8),
                    HeaderIcon(icon: Icons.account_balance_wallet_outlined),
                  ],
                ),
              ),

              // 2. Search Bar
              custom.SearchBar(),

              // 3. Banner Slider
              const BannerSlidder(),

              const SizedBox(height: 24),

              // 4. Circular Actions (AI, Create Campaign, Smart Auto DM)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircularAction(
                    icon: Icons.smart_toy_outlined,
                    label: "AI",
                    gradientColors: [
                      Color(0xFF232867),
                      Color(0xFF6349F5),
                      Color(0xFF8B48FF),
                    ],
                  ),
                  CircularAction(
                    icon: Icons.campaign_outlined,
                    label: "Create Campaign",
                    gradientColors: const [
                      Color(0xFF232867),
                      Color(0xFF6349F5),
                      Color(0xFF8B48FF),
                    ],
                    onTap: () => Get.toNamed("/Campaign-Main"),
                  ),
                  const CircularAction(
                    icon: Icons.auto_awesome_outlined,
                    label: "Smart Auto DM",
                    gradientColors: [
                      Color(0xFF232867),
                      Color(0xFF6349F5),
                      Color(0xFF8B48FF),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 5. & 6. Grouped Video Section in a Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x8CEEECF3),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFFEAEAEA)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Smart strategies to grow faster with creators",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.purple[300],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 240,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            return const VideoCard();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BrandBottomNav(),
    );
  }
}
