import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_quick_action_card.dart';

class AIHomeView extends StatelessWidget {
  final Function(String) onActionTap;

  const AIHomeView({super.key, required this.onActionTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 120),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Hi! What can I help you\ncreate today?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8E8E93),
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AIQuickActionCard(
                  title: "Refine a\nBio",
                  icon: Icons.edit_outlined,
                  onTap: () => onActionTap("Refine a Bio"),
                ),
                AIQuickActionCard(
                  title: "Generate\nCaption",
                  icon: Icons.auto_awesome_outlined,
                  onTap: () => onActionTap("Generate Caption"),
                ),
                AIQuickActionCard(
                  title: "Draft a\nScript",
                  icon: Icons.description_outlined,
                  onTap: () => onActionTap("Draft a Script"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
