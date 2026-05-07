import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/ReelsApp/reels_home_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/ReelsApp/reels_profile_screen.dart';

class CreatorReelsMain extends StatefulWidget {
  const CreatorReelsMain({super.key});

  @override
  State<CreatorReelsMain> createState() => _CreatorReelsMainState();
}

class _CreatorReelsMainState extends State<CreatorReelsMain> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ReelsHomeScreen(),
    const ReelsProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          // Screen content
          _screens[_currentIndex],

          // Floating Navigation Bar
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFA774FF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNavItem(
                      icon: Icons.home_filled,
                      index: 0,
                      label: "Home",
                    ),
                    const SizedBox(width: 8),
                    _buildNavItem(
                      icon: Icons.person,
                      index: 1,
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    final bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white.withValues(alpha: 0.25)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: Colors.white),
            // Animated label shown only for active tab
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: isActive
                  ? Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
