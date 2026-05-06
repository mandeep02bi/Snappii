import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Business/Chats/Inbox_screen.dart';
import 'package:snappis/Presentation/Screens/Business/Searching/SearchingProfile.dart';
import 'package:snappis/Presentation/Screens/Creator/Campaign/CCampaign.dart';
import 'package:snappis/Presentation/Screens/Creator/HomeScreen/CHomescreen.dart';
import 'package:snappis/Presentation/Screens/Profile_main_Screen.dart';

class CmainPage extends StatefulWidget {
  const CmainPage({super.key});

  @override
  State<CmainPage> createState() => _CmainPageState();
}

class _CmainPageState extends State<CmainPage> {
 int index = 0; // Setting is last tab

  final screens = [
    const Chomescreen(), // Home
    const Searchingprofile(), // Search
    const Ccampaign(), // Campaign
    const InboxScreen(), // Message
    const ProfileMainScreen(), // Account Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xffE7DDF8),
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(Icons.campaign_outlined), label: "Campaign"),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline), label: "Chat"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }
}