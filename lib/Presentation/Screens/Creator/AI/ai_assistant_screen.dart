import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Controllers/ai_assistant_controller.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/brand_bottom_nav.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_app_bar.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_assistant_drawer.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_chat_view.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_home_view.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/Widgets/ai_input_area.dart';

class AIAssistantScreen extends StatelessWidget {
  const AIAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIAssistantController());

    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.white,
        drawer: AIAssistantDrawer(onChatItemTap: controller.startChat),
        body: SafeArea(
          child: Column(
            children: [
              AIAppBar(scaffoldKey: controller.scaffoldKey),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.isChatting.value
                      ? AIChatView(key: const ValueKey('chat'), messages: controller.messages)
                      : AIHomeView(key: const ValueKey('home'), onActionTap: controller.startChat),
                ),
              ),
              AIInputArea(
                controller: controller.textController,
                onSend: controller.handleSend,
              ),
            ],
          ),
        ),
        bottomNavigationBar: controller.isChatting.value ? null : const BrandBottomNav(),
      ),
    );
  }
}
