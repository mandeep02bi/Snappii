import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Provider/User_provider.dart';
import 'package:provider/provider.dart';
import 'package:snappis/Presentation/Widgets/Serch_list.dart';


class Searchingprofile extends StatefulWidget {
  const Searchingprofile({super.key});

  @override
  State<Searchingprofile> createState() => _SearchingprofileState();
}

class _SearchingprofileState extends State<Searchingprofile> {

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search user name",
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            Expanded(
              child: provider.loading
                  ? const ShimmerList()
                  : ListView.separated(
                      itemCount: provider.users.length,
                      separatorBuilder: (_, __) =>
                          const Divider(color: AppColors.divider),
                      itemBuilder: (_, index) {
                        final user = provider.users[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundImage:
                                NetworkImage(user.imageUrl),
                          ),
                          title: Text(
                            user.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(user.category),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // Bottom navigation
     
    );
  }
  
}