import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/ReelsApp/trending_audio_screen.dart';

class ReelsHomeScreen extends StatelessWidget {
  const ReelsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            const SizedBox(height: 20),

            // Banner - Using Rectangle 15.png
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // The actual banner image
                  Image.asset(
                    "assets/images/Rectangle 15.png",
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(true),
                        _buildDot(false),
                        _buildDot(false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Trending Audio Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Trending Audio",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrendingAudioScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "View More",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Trending Audio Cards (Horizontal Scroll)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildTrendingAudioCard(context),
                  const SizedBox(width: 16),
                  _buildTrendingAudioCard(context),
                ],
              ),
            ),
            const SizedBox(height: 250), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple : Colors.white70,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildTrendingAudioCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Text(
                  "Choose Trending Music to Boost Your Reels",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.deepPurple),
            ],
          ),
          const SizedBox(height: 16),
          _buildAudioTile("Gleech Music", "(Shreya Ghoshal)"),
          const SizedBox(height: 12),
          _buildAudioTile("Music", "(Arijit Singh)"),
          const SizedBox(height: 12),
          _buildAudioTile("Gleech Music", "(Shreya Ghoshal)"),
        ],
      ),
    );
  }

  Widget _buildAudioTile(String title, String subtitle) {
    return Row(
      children: [
        // Rectangle 53.png as the audio thumbnail
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/images/Rectangle 53.png",
            width: 42,
            height: 42,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "🎵 $title",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
