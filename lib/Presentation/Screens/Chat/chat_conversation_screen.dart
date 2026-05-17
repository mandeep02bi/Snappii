import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Domains/Entities/ChatMessage_entities.dart';
import 'package:snappis/Presentation/Screens/Chat/widgets/chat_message_bubble.dart';
import 'package:snappis/Presentation/Screens/Chat/widgets/chat_collaboration_cards.dart';

enum ChatCollaborationState {
  negotiation, // Screen 1: Offer & negotiation flow
  paymentPending, // Screen 2: Custom offer editor & pay button
  paymentSecured, // Screen 3: Confirmed payment status & media preview
  review, // Screen 4: Link submission & approval buttons
  completed, // Screen 5: Completed state & locked chat notice
}

class ChatConversationScreen extends StatefulWidget {
  final String title;
  const ChatConversationScreen({super.key, required this.title});

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  final TextEditingController _controller = TextEditingController();
  ChatCollaborationState _currentState = ChatCollaborationState.negotiation;

  // Custom offer values that can be edited in State 2
  String _offerAmount = "10000";
  String _offerMessage = "Your Profile According Budget";

  // Simulate sending a text message
  final List<ChatMessage> _customMessages = [];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    if (_currentState == ChatCollaborationState.completed)
      return; // Prevent sending when locked

    setState(() {
      _customMessages.add(
        ChatMessage(
          text: _controller.text.trim(),
          isMe: true,
          timestamp: DateTime.now(),
        ),
      );
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF7D35F9);

    return Scaffold(
      backgroundColor: const Color(0xFFFBF9FF), // Soft background tint
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryColor,
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        title: GestureDetector(
          onLongPress: () {
            setState(() {
              _currentState = ChatCollaborationState.negotiation;
              _customMessages.clear();
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Collaboration chat reset to State 1'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  'assets/images/Ellipse 64 copy.png',
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Main Chat List Area
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                ..._buildChatContentForState(primaryColor),

                // Render any manually typed messages
                ..._customMessages.map(
                  (msg) => ChatMessageBubble(message: msg, primaryColor: primaryColor),
                ),
              ],
            ),
          ),

          // Bottom Input Area (changes dynamically based on the state)
          _buildInputArea(primaryColor),
        ],
      ),
    );
  }

  // Compiles list of chat items and cards based on selected state
  List<Widget> _buildChatContentForState(Color primaryColor) {
    switch (_currentState) {
      case ChatCollaborationState.negotiation:
        return [
          CampaignOfferCard(primaryColor: primaryColor),
          ChatMessageBubble(
            message: ChatMessage(
              text: "Hey, can you tell me your expetations regarding reel",
              isMe: false,
              timestamp: DateTime.now(),
            ),
            primaryColor: primaryColor,
          ),
          ChatMessageBubble(
            message: ChatMessage(
              text: "Reel 20-30 second mention as @megamart",
              isMe: true,
              timestamp: DateTime.now(),
            ),
            primaryColor: primaryColor,
          ),
          ChatMessageBubble(
            message: ChatMessage(text: "Okay", isMe: false, timestamp: DateTime.now()),
            primaryColor: primaryColor,
          ),
          InfluencerOfferCard(
            primaryColor: primaryColor,
            onNegotiate: () {
              setState(() {
                _currentState = ChatCollaborationState.paymentPending;
              });
            },
            onAccept: () {
              setState(() {
                _currentState = ChatCollaborationState.paymentPending;
              });
            },
          ),
        ];

      case ChatCollaborationState.paymentPending:
        return [
          CampaignOfferEditorCard(
            primaryColor: primaryColor,
            offerAmount: _offerAmount,
            offerMessage: _offerMessage,
            onAmountChanged: (val) {
              _offerAmount = val;
            },
            onMessageChanged: (val) {
              _offerMessage = val;
            },
            onSendOffer: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Offer Sent Successfully')),
              );
            },
          ),
          const SizedBox(height: 16),
          PaymentCard(
            primaryColor: primaryColor,
            offerAmount: _offerAmount,
            buttonText: "Proceed to Pay",
            statusText: "Offer Locked",
            isSecured: false,
            onPressed: () {
              setState(() {
                _currentState = ChatCollaborationState.paymentSecured;
              });
            },
          ),
        ];

      case ChatCollaborationState.paymentSecured:
        return [
          PaymentCard(
            primaryColor: primaryColor,
            offerAmount: _offerAmount,
            buttonText: "Payment Secured",
            statusText:
                "Payment confirmed. Content creation has officially started.",
            isSecured: true,
            onPressed: () {
              setState(() {
                _currentState = ChatCollaborationState.review;
              });
            },
          ),
          ChatMessageBubble(
            message: ChatMessage(
              text: "Thanks for the Payment\nLet me share you the reels",
              isMe: false,
              timestamp: DateTime.now(),
            ),
            primaryColor: primaryColor,
          ),
          ChatMessageBubble(
            message: ChatMessage(text: "Okay", isMe: true, timestamp: DateTime.now()),
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 8),
          VideoPreviewCard(primaryColor: primaryColor),
        ];

      case ChatCollaborationState.review:
        return [
          ChatMessageBubble(
            message: ChatMessage(
              text: "Okay this is fine",
              isMe: true,
              timestamp: DateTime.now(),
            ),
            primaryColor: primaryColor,
          ),
          ChatMessageBubble(
            message: ChatMessage(
              text: "You can upload reels According to you",
              isMe: true,
              timestamp: DateTime.now(),
            ),
            primaryColor: primaryColor,
          ),
          ChatMessageBubble(
            message: ChatMessage(text: "Okay", isMe: false, timestamp: DateTime.now()),
            primaryColor: primaryColor,
          ),
          RequestSubmitCard(
            primaryColor: primaryColor,
            onApprove: () {
              setState(() {
                _currentState = ChatCollaborationState.completed;
              });
            },
          ),
        ];

      case ChatCollaborationState.completed:
        return [
          const SizedBox(height: 20),
          const SuccessStatusBlock(),
          const SizedBox(height: 60),
          const LockedChatWarning(),
        ];
    }
  }

  // --- BOTTOM INPUT AREA ---

  Widget _buildInputArea(Color primaryColor) {
    bool isLocked = _currentState == ChatCollaborationState.completed;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: const Color(0xFFE5E5EA), width: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(0, -2),
            blurRadius: 5,
          ),
        ],
      ),
      child: SafeArea(
        child: IgnorePointer(
          ignoring: isLocked, // Disable completely when chat is completed
          child: Opacity(
            opacity: isLocked ? 0.5 : 1.0,
            child: Row(
              children: [
                // Plus Icon Button (solid purple circle with white bold plus)
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(
                      0xFFB593FF,
                    ), // Soft vibrant purple matching the uploaded button
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white, // White plus icon
                    size: 28, // Bold and large
                  ),
                ),
                const SizedBox(width: 12),
                // Pill Container containing BOTH the TextField and Send Icon
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    height: 53, // Height = 53 from Figma
                    decoration: BoxDecoration(
                      color: Colors.white, // White pill background
                      borderRadius: BorderRadius.circular(
                        14,
                      ), // Corner Radius = 14 from Figma
                      border: Border.all(
                        color: const Color(0xFFEFE6FF),
                        width: 1.5,
                      ), // Subtle lavender border
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            enabled: !isLocked,
                            decoration: const InputDecoration(
                              hintText: "Type a message",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black38,
                                fontSize: 14,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _sendMessage,
                          child: Image.asset(
                            'assets/icons/Vector (1).png',
                            width: 22,
                            height: 22,
                            color: const Color(
                              0xFF7D35F9,
                            ), // Purple tint matching the Figma mockup
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
