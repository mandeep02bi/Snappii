import 'package:flutter/material.dart';
import 'package:snappis/Domains/Entities/Creator_entities.dart';
import 'package:snappis/Presentation/Widgets/Sub_Creator_card.dart';
import 'package:snappis/Presentation/Widgets/filter_btn.dart';

class ExploreCreator extends StatefulWidget {
  const ExploreCreator({super.key});

  @override
  State<ExploreCreator> createState() => _ExploreCreatorState();
}

class _ExploreCreatorState extends State<ExploreCreator> {
   @override
  Widget build(BuildContext context) {
    final creators = List.generate(
      4,
      (i) => CreatorEntity(
        name: "Kituu",
        username: "@kituu8809",
        category: "Beauty",
        followers: 100,
        delivery: "3 days",
        imageUrl: "assets/profile.jpg", id: '', avgViews: 550, reelsFrom: 0, views: '550k',
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back, size: 26),

                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Explore Creators",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: FilterBtn(),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Creator Cards
              ...creators.map((c) => SubCreatorCard(creator: c)),
            ],
          ),
        ),
      ),
    );
  }
}