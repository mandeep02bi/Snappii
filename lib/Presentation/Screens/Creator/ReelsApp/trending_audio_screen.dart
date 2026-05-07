import 'package:flutter/material.dart';

class TrendingAudioScreen extends StatelessWidget {
  const TrendingAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Header text
                  const Text(
                    "Trending Audio",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Discover daily trending Instagram audios to boost your reels, increase reach, and grow faster",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // List container
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: 8,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final isArijit = index % 3 == 1;
                    return _buildListItem(
                      title: isArijit ? "Music" : "Gleech Music",
                      artist: isArijit ? "(Arijit Singh)" : "(Shreya Ghoshal)",
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({required String title, required String artist}) {
    return Row(
      children: [
        // Rectangle 53.png as thumbnail
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/Rectangle 53.png",
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        // Text info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "🎵 $title",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                artist,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        // Play button
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Colors.black87,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.play_arrow, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
