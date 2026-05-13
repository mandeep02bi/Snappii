import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Controllers/ai_assistant_controller.dart';

class AIAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AIAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AIAssistantController>();

    return Obx(
      () => SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      controller.isChatting.value
                          ? Icons.arrow_back_ios_new_rounded
                          : Icons.menu_rounded,
                      color: controller.isChatting.value
                          ? const Color(0xFF7D35F9)
                          : Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      if (controller.isChatting.value) {
                        controller.goBack();
                      } else {
                        scaffoldKey.currentState?.openDrawer();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
