import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/brand_bottom_nav.dart';
import 'package:snappis/Presentation/Widgets/Chat/chat_list_tile.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = [
    'All',
    'Active',
    'Unread',
    'Complete',
    'Campaign',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF7D35F9),
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Chat',
          style: TextStyle(
            color: Color(0xFF7D35F9),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // Horizontal Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: _filters.map((filter) {
                bool isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF7D35F9)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xFF7D35F9),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF7D35F9),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          // Chat List
          Expanded(child: _buildChatList(_selectedFilter)),
        ],
      ),
      bottomNavigationBar: const BrandBottomNav(),
    );
  }

  Widget _buildChatList(String type) {
    final List<Map<String, dynamic>> dummyChats = [
      {
        'title': 'Gucci',
        'subtitle': 'Brand is Offering: ₹10000',
        'time': '10:00 PM',
        'unreadCount': 1,
        'imageUrl': '',
        'isActive': true,
        'isComplete': false,
        'isCampaign': true,
      },
      {
        'title': 'Luna',
        'subtitle': 'Brand is Offering: ₹10000',
        'time': '10:00 PM',
        'unreadCount': 1,
        'imageUrl': '',
        'isActive': true,
        'isComplete': false,
        'isCampaign': false,
      },
      {
        'title': 'Glory',
        'subtitle': 'Brand is Offering: ₹10000',
        'time': '10:00 PM',
        'unreadCount': 1,
        'imageUrl': '',
        'isActive': true,
        'isComplete': false,
        'isCampaign': false,
      },
      {
        'title': 'Campaign Complete',
        'subtitle': 'Your Campaign has been successfully Compe...',
        'time': '10:00 PM',
        'unreadCount': 1,
        'imageUrl': '',
        'isActive': false,
        'isComplete': true,
        'isCampaign': true,
      },
    ];

    List<Map<String, dynamic>> filteredChats = dummyChats;
    if (type == 'Active') {
      filteredChats = dummyChats
          .where((chat) => chat['isActive'] == true)
          .toList();
    } else if (type == 'Unread') {
      filteredChats = dummyChats
          .where((chat) => (chat['unreadCount'] as int) > 0)
          .toList();
    } else if (type == 'Complete') {
      filteredChats = dummyChats
          .where((chat) => chat['isComplete'] == true)
          .toList();
    } else if (type == 'Campaign') {
      filteredChats = dummyChats
          .where((chat) => chat['isCampaign'] == true)
          .toList();
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: filteredChats.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: 80,
        endIndent: 16,
        color: Color(0xFFF3F3F3),
      ),
      itemBuilder: (context, index) {
        final chat = filteredChats[index];
        return ChatListTile(
          title: chat['title'],
          subtitle: chat['subtitle'],
          time: chat['time'],
          unreadCount: chat['unreadCount'],
          imageUrl: chat['imageUrl'],
        );
      },
    );
  }
}
