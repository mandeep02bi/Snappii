import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/Creator_entities.dart';

class SubCreatorCard extends StatelessWidget {
    final CreatorEntity creator;

  const SubCreatorCard({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // *** Profile Row ***
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(creator.imageUrl),
              ),
              const SizedBox(width: 12),

              // Texts
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    creator.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${creator.username}",
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),

                  // Category pill
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      creator.category,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 20),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                   const Text("Fallowers",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("${creator.followers}",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                 
                ],
              ),
              Column(
                children: [
                  const Text("Avg.Views",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("${creator.views}",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Reels & Delivery row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text("Reels From",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("${creator.followers}",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              Column(
                children: [
                  const Text("delivery",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("${creator.delivery}",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // View button
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}