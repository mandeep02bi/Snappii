import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  AIMessage({required this.text, required this.isUser, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();
}

class AIAssistantController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final RxList<AIMessage> messages = <AIMessage>[].obs;
  final RxBool isChatting = false.obs;
  final RxBool isLoading = false.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // --- Actions ---

  void startChat(String text) {
    if (text.isEmpty) return;

    resetChat(); // Start fresh if called from home or drawer
    isChatting.value = true;
    _addMessage(text, true);
    _simulateAIResponse();
  }

  void handleSend() {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    if (!isChatting.value) {
      startChat(text);
    } else {
      _addMessage(text, true);
      _simulateAIResponse();
    }
    textController.clear();
  }

  void goBack() {
    isChatting.value = false;
  }

  void resetChat() {
    messages.clear();
    isChatting.value = false;
    isLoading.value = false;
  }

  // --- Private Helpers ---

  void _addMessage(String text, bool isUser) {
    messages.add(AIMessage(text: text, isUser: isUser));
    _scrollToEnd();
  }

  void _simulateAIResponse() {
    isLoading.value = true;

    // Simulate thinking delay
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
      _addMessage(
        "Here's a professional bio for your content creator lifestyle brand:\n\n"
        "Content Creator | Lifestyle Enthusiast | Storyteller\n\n"
        "I create engaging content that inspires, entertains, and connects. "
        "From lifestyle tips to behind-the-scenes moments, I share real Instagram "
        "Caption experiences to build a positive and creative community.",
        false,
      );
    });
  }

  void _scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  @override
  void onClose() {
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
