import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Campaignmainpage.dart';
import 'package:snappis/Presentation/Screens/Business/Chats/Inbox_screen.dart';
import 'package:snappis/Presentation/Screens/Business/Home_screen/Bhome.dart';
import 'package:snappis/Presentation/Screens/Business/Searching/SearchingProfile.dart';
import 'package:snappis/Presentation/Screens/Profile_main_Screen.dart';
import 'package:snappis/Presentation/bloc/creator_bloc.dart';

class BmainPage extends StatefulWidget {
  const BmainPage({super.key});

  @override
  State<BmainPage> createState() => _BmainPageState();
}

class _BmainPageState extends State<BmainPage> {
   int index = 0; // Setting is last tab

  final screens = [
    // const BusinessHomePage(), // Home
  BlocProvider(
    create: (_) => CreatorBloc()..add(FetchCreators()),
    child: const BusinessHomePage(),
  ),
    const Searchingprofile(), // Search
    const Campaignmainpage(), // Campaign
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