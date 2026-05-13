import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_recent_chat_item.dart';

class AIAssistantDrawer extends StatelessWidget {
  final Function(String) onChatItemTap;

  const AIAssistantDrawer({super.key, required this.onChatItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.75,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(Icons.edit_note_rounded, size: 28, color: Color(0xFF1A1A2E)),
                    SizedBox(width: 12),
                    Text(
                      "New Chat",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Chats", 
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A2E),
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "View all", 
                      style: TextStyle(
                        color: Color(0xFF7D35F9), 
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AIRecentChatItem(
                    title: "Write a bio for my brand",
                    time: "2 min ago",
                    onTap: () {
                      Navigator.pop(context);
                      onChatItemTap("Write a bio for my brand");
                    },
                  ),
                  AIRecentChatItem(
                    title: "Hook ideas for Intagram",
                    time: "10 min ago",
                    isSelected: true,
                    onTap: () {
                      Navigator.pop(context);
                      onChatItemTap("Hook ideas for Intagram");
                    },
                  ),
                  AIRecentChatItem(
                    title: "Hook ideas for Intagram",
                    time: "10 min ago",
                    onTap: () {
                      Navigator.pop(context);
                      onChatItemTap("Hook ideas for Intagram");
                    },
                  ),
                  AIRecentChatItem(
                    title: "Script for Youtube",
                    time: "yesterday",
                    onTap: () {
                      Navigator.pop(context);
                      onChatItemTap("Script for Youtube");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
