import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandBottomNav extends StatelessWidget {
  const BrandBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRoute = Get.currentRoute;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFA774FF),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA774FF).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            Icons.home,
            "/Brand-Home",
            currentRoute == "/Brand-Home",
          ),
          _buildNavItem(
            Icons.campaign_outlined,
            "/Campaign-Main",
            currentRoute == "/Campaign-Main",
          ),
          _buildNavItem(Icons.smart_toy_outlined, "/AI", currentRoute == "/AI"),
          _buildNavItem(
            Icons.chat_bubble_outline,
            "/Chat",
            currentRoute == "/Chat",
          ),
          _buildNavItem(
            Icons.person_outline,
            "/Profile",
            currentRoute == "/Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String route, bool isActive) {
    return InkWell(
      onTap: () {
        if (!isActive) {
          if (route == "/Brand-Home" ||
              route == "/Campaign-Main" ||
              route == "/AI" ||
              route == "/Chat") {
            Get.offNamed(route);
          } else {
            Get.snackbar(
              "Coming Soon",
              "This feature will be available soon!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white70,
            );
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
            size: 26,
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isActive ? 20 : 0,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
