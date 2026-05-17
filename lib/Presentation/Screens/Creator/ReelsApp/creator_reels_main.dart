import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/ai_assistant_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/Campaign/CCampaign.dart';
import 'package:snappis/Presentation/Screens/Creator/ReelsApp/reels_home_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/ReelsApp/reels_profile_screen.dart';
import 'package:snappis/Presentation/Screens/Chat/chat_list_screen.dart';

class CreatorReelsMain extends StatefulWidget {
  const CreatorReelsMain({super.key});

  @override
  State<CreatorReelsMain> createState() => _CreatorReelsMainState();
}

class _CreatorReelsMainState extends State<CreatorReelsMain> {
  int _currentIndex = 2; // AI Assistant selected by default to match Figma

  final List<Widget> _screens = [
    const ReelsHomeScreen(),
    const Ccampaign(),
    const AIAssistantScreen(),
    const ChatListScreen(showBottomNav: false),
    const ReelsProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 100, // Enough space for floating bar + padding
        color: Colors.transparent,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFA774FF),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(icon: Icons.home_filled, index: 0),
              _buildNavItem(icon: Icons.campaign_outlined, index: 1),
              _buildNavItem(icon: Icons.smart_toy_outlined, index: 2),
              _buildNavItem(icon: Icons.chat_bubble_outline, index: 3),
              _buildNavItem(icon: Icons.person_outline, index: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    final bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 18,
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


