import 'package:flutter/material.dart';

class ReelsProfileScreen extends StatelessWidget {
  const ReelsProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          // Purple Background Header
          Container(
            height: 900,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFFA881FF)),
            padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Main White Container
          Positioned(
            top: 110, // Adjust overlap
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 24,
                  right: 24,
                  bottom: 100,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    // Options Card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        children: [
                          _buildProfileOption(Icons.person, "Edit Profile"),
                          _buildDivider(),
                          _buildProfileOption(
                            Icons.description,
                            "Terms  & Conditions",
                          ),
                          _buildDivider(),
                          _buildProfileOption(
                            Icons.person_remove,
                            "Delete Account",
                          ),
                          _buildDivider(),
                          _buildProfileOption(Icons.help_outline, "Help"),
                          _buildDivider(),
                          _buildProfileOption(Icons.logout, "Logout"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Profile Picture and Name
          Positioned(
            top: 120,
            left: 10,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/Ellipse 64.png",
                  height: 109,
                  width: 109,
                ),
                const SizedBox(width: 16),
                Text(
                  "Richa",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1, color: Color(0xFFF3F4F6));
  }
}
