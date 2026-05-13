import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Controllers/ai_assistant_controller.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_message_bubble.dart';

class AIChatView extends StatelessWidget {
  final List<AIMessage> messages;

  const AIChatView({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AIAssistantController>();

    return Obx(() => ListView.builder(
      controller: controller.scrollController,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      itemCount: messages.length + (controller.isLoading.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == messages.length) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Row(
              children: [
                Icon(Icons.auto_awesome_outlined, size: 18, color: Color(0xFF7D35F9)),
                SizedBox(width: 12),
                Text(
                  "Typing...",
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF8E8E93),
                  ),
                ),
              ],
            ),
          );
        }
        final msg = messages[index];
        return AIMessageBubble(
          text: msg.text,
          isUser: msg.isUser,
        );
      },
    ));
  }
}
