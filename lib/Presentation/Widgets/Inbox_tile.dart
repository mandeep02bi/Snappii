import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/Inbox_entities.dart';
import 'package:snappis/Presentation/Screens/Chat/chat_conversation_screen.dart';

class InboxTile extends StatelessWidget {
  final InboxEntity item;

  const InboxTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.to(() => ChatConversationScreen(title: item.title)),
          leading: CircleAvatar(child: Text(item.title[0])),
          title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(item.subtitle),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.time, style: const TextStyle(fontSize: 12)),
              if (item.unread > 0)
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    item.unread.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
        const Divider(color: AppColors.divider),
      ],
    );
  }
}
