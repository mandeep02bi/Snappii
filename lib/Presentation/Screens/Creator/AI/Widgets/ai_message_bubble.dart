import 'package:flutter/material.dart';

class AIMessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const AIMessageBubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            const Padding(
              padding: EdgeInsets.only(top: 0, right: 8),
              child: Icon(
                Icons.auto_awesome_outlined,
                size: 20,
                color: Color(0xFF7D35F9),
              ),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(18),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              decoration: BoxDecoration(
                color: isUser ? const Color(0xFFEFE8FF) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(24),
                  topRight: const Radius.circular(24),
                  bottomLeft: Radius.circular(isUser ? 24 : 8),
                  bottomRight: Radius.circular(isUser ? 8 : 24),
                ),
                border: isUser
                    ? null
                    : Border.all(color: const Color(0xFFEFE8FF), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF1A1A2E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (!isUser) ...[
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildActionButton(Icons.copy_outlined, "Copy"),
                          const SizedBox(width: 8),
                          _buildActionButton(
                            Icons.refresh_rounded,
                            "Regenerate",
                          ),
                          const SizedBox(width: 8),
                          _buildActionButton(Icons.share_outlined, "Share"),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEFE8FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF1A1A2E)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF1A1A2E),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
