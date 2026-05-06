import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:snappis/Domains/Entities/Creator_entities.dart';
import 'package:snappis/Presentation/Controllers/Creator_controller.dart';
import 'package:snappis/Presentation/Screens/Business/Explore_creator/Explore_creator.dart';
import 'package:snappis/Presentation/Screens/Business/Home_screen/Creator_shimmer.dart';
import 'package:snappis/Presentation/Widgets/Banner_slidder.dart';
import 'package:snappis/Presentation/Widgets/Category_tab.dart';
import 'package:snappis/Presentation/Widgets/Creator_card.dart';
import 'package:snappis/Presentation/bloc/creator_bloc.dart';

class BusinessHomePage extends StatefulWidget {
  const BusinessHomePage({super.key});

  @override
  State<BusinessHomePage> createState() => _BusinessHomePageState();
}

class _BusinessHomePageState extends State<BusinessHomePage> {
  // int navIndex = 0;
  // int categoryIndex1 = 0;
  // int categoryIndex2 = 0;
  // int categoryIndex3 = 0;

  // final creator = CreatorEntity(
  //   name: "Kituu",
  //   category: "Beauty",
  //   followers: 100,
  //   avgViews: 550,
  //   imageUrl: "assets/profile.jpg", id: "", reelsFrom: 0,
  // );

  // final tabs = ["Beauty", "Comedy", "Tech"];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const SearchBar(),
  //           const BannerSlidder(),

  //           _sectionTitle("Trenading Creators"),
  //           CategoryTab(
  //               selectedIndex: categoryIndex1,
  //               items: tabs,
  //               onTap: (i) => setState(() => categoryIndex1 = i)),
  //           CreatorCard(creator: creator),

  //           _sectionTitle("Tech Creators"),
  //           CategoryTab(
  //               selectedIndex: categoryIndex2,
  //               items: tabs,
  //               onTap: (i) => setState(() => categoryIndex2 = i)),
  //           CreatorCard(creator: creator),

  //           _sectionTitle("Lifestyle Creators"),
  //           CategoryTab(
  //               selectedIndex: categoryIndex3,
  //               items: tabs,
  //               onTap: (i) => setState(() => categoryIndex3 = i)),
  //           CreatorCard(creator: creator),

  //           const SizedBox(height: 20),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  
  final creatorController = Get.put(CreatorController());

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreatorBloc, CreatorState>(
        listener: (context, state) {
          if (state is CreatorLoaded) {
            creatorController.setCreators(state.creators);
          }
        },
        child: BlocBuilder<CreatorBloc, CreatorState>(
          builder: (context, state) {

            // 🔥 Shimmer loading
            if (state is CreatorLoading) {
              return const CreatorShimmer();
            }

            if (state is CreatorError) {
              return const Center(
                  child: Text("Failed to load creators"));
            }

            return Obx(() => RefreshIndicator(
              onRefresh: () async {
                context.read<CreatorBloc>().add(RefreshCreators());
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchBar(),
                    const BannerSlidder(),

                    if (creatorController.categories.isNotEmpty)
                      _sectionTitle("Trending Creators"),

                    if (creatorController.categories.isNotEmpty)
                      CategoryTab(
                        selectedIndex: creatorController.categories
                            .indexOf(
                            creatorController.selectedCategory.value),
                        items: creatorController.categories,
                        onTap: (i) {
                          creatorController.selectedCategory2.value =
                          creatorController.categories[i];
                        },
                      ),

                   
                  const SizedBox(height: 10),

                  if (creatorController.filteredCreators.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: Text("No Creators Found")),
                    ),

                  ...creatorController.filteredCreators.map(
                    (creator) => CreatorCard(
                      creator: CreatorEntity(
                        id: creator.userId,
                        name: creator.name,
                        category: creator.categoryName,
                        followers: creator.followersCount,
                        avgViews: creator.avgReelViews,
                        imageUrl: creator.profilePictureUrl,
                        reelsFrom: 0,
                      ),
                    ),
                  ),


                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return GestureDetector(
      onTap: () {
                                  Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ExploreCreator(),
                            ),
                          );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("View All",
                style:
                    TextStyle(fontSize: 14, color: Colors.blueAccent)),
          ],
        ),
      ),
    );
  }
}