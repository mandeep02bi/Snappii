import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/ServiceEntities.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Presentation/Controllers/Creatordetailscontroller.dart';
import 'package:snappis/Presentation/Screens/Business/Book_service/SelectService.dart';
// import 'package:snappis/Presentation/Screens/Business/Book_service/SelectService.dart';
import 'package:snappis/Presentation/Widgets/Creator_header.dart';
import 'package:snappis/Presentation/Widgets/Pricing_chip.dart';
// import 'package:snappis/Presentation/Widgets/Progressbar.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';
// import 'package:snappis/Presentation/Widgets/Section_card.dart';
// import 'package:snappis/Presentation/Widgets/gender_split.dart';
// import 'package:snappis/Presentation/Widgets/location_tile.dart';
import 'package:snappis/Presentation/Widgets/stat_chips.dart';
import 'package:snappis/Presentation/bloc/booking_bloc.dart';
import 'package:snappis/Presentation/bloc/creator_details_bloc.dart';

class ProfilCamp extends StatefulWidget {

  final String creatorId;

  const ProfilCamp({super.key, required this.creatorId});

  @override
  State<ProfilCamp> createState() => _ProfilCampState();
}

class _ProfilCampState extends State<ProfilCamp> {
  final detailController = Get.put(CreatorDetailController());
  final formController = Get.find<BookingFormController>();

 Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: AppColors.bg1,
  body: BlocListener<CreatorDetailBloc, CreatorDetailState>(
    listener: (context, state) {
      if (state is CreatorDetailLoaded) {
        detailController.setCreator(state.creator);
      }
    },
    child: BlocBuilder<CreatorDetailBloc, CreatorDetailState>(
      builder: (context, state) {

        if (state is CreatorDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CreatorDetailError) {
          return const Center(child: Text("Failed to load profile"));
        }

        return Obx(() {

          final creator = detailController.creator;

          if (creator.isEmpty) {
            return const SizedBox();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Text("${creator["data"]["name"]}"),
                /// HEADER
                CreatorHeader(
                  name: creator["data"]["name"],
                  username: creator["data"]["instagram_username"],
                  imageUrl:
                      "${ApiConstants.baseUrl}${creator["data"]["profile_picture_url"] ?? ""}",
                  followers: creator["data"]["followers_count"],
                ),
                const SizedBox(height: 16),

                /// Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatChip(
                      title: "Followers",
                      value:
                          "${creator["data"]["followers_count"] ?? 0}",
                    ),
                    StatChip(
                      title: "Avg.Views",
                      value:
                          "${creator["data"]["avg_reel_views"] ?? 0}",
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                /// Pricing (auto-adaptive)
                if (creator["data"]["reels_price"] != null ||
                    creator["data"]["story_price"] != null ||
                    creator["data"]["post_price"] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Pricing",
                          style:
                              TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          
                            PricingChip(
                                title:
                                    "Reels\n₹${creator["data"]["reels_price"]}"),
                          
                            PricingChip(
                                title:
                                    "Story\n₹${creator["data"]["story_price"]}"),
                          
                            PricingChip(
                                title:
                                    "Post\n₹${creator["data"]["post_price"]}"),
                        ],
                      ),
                    ],
                  ),

                const SizedBox(height: 20),

                SecprimarBtn(
                  text: "Book Service",
                  onPressed: () {
                    // Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (_) => const Selectservice(),
                    //         ),
                    //       ); 

                    final creator = detailController.creator;

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => BlocProvider.value(
                    //       value: context.read<BookingBloc>(),  // 🔥 Pass existing bloc
                    //       child: Selectservice(
                    //         reelsPrice: creator["data"]["reels_price"] ?? 0,
                    //         storyPrice: creator["data"]["story_price"] ?? 0,
                    //         postPrice: creator["data"]["post_price"] ?? 0,
                    //       ),
                    //     ),
                    //   ),
                    // );
                      formController.setCreator(
                        id: widget.creatorId,
                        name: creator["data"]["name"] ?? "",
                        image: "${ApiConstants.baseUrl}${creator["data"]["profile_picture_url"] ?? ""}",
                        followers: creator["data"]["followers_count"] ?? 0,
                        username: creator["data"]["instagram_username"] ?? "",
                      );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => BlocProvider(
                    //       create: (_) => BookingBloc()
                    //         ..add(InitializeServices([
                    //           ServiceEntity1(
                    //             title: "Reels",
                    //             description: "...",
                    //             price: creator["data"]["reels_price"] ?? 0,
                    //           ),
                    //           ServiceEntity1(
                    //             title: "Story",
                    //             description: "...",
                    //             price: creator["data"]["story_price"] ?? 0,
                    //           ),
                    //           ServiceEntity1(
                    //             title: "Post",
                    //             description: "...",
                    //             price: creator["data"]["post_price"] ?? 0,
                    //           ),
                    //         ])),
                    //       child: Selectservice(
                    //         reelsPrice: creator["data"]["reels_price"] ?? 0,
                    //         storyPrice: creator["data"]["story_price"] ?? 0,
                    //         postPrice: creator["data"]["post_price"] ?? 0,
                    //         creatorid: widget.creatorId,
                    //       ),
                    //     ),
                    //   ),
                    // );
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<BookingBloc>()
                              ..add(
                                InitializeServices([
                                  ServiceEntity1(
                                    title: "Reels",
                                    description: "...",
                                    price: creator["data"]["reels_price"] ?? 0,
                                  ),
                                  ServiceEntity1(
                                    title: "Story",
                                    description: "...",
                                    price: creator["data"]["story_price"] ?? 0,
                                  ),
                                  ServiceEntity1(
                                    title: "Post",
                                    description: "...",
                                    price: creator["data"]["post_price"] ?? 0,
                                  ),
                                ]),
                              ),
                            child: Selectservice(
                              reelsPrice: creator["data"]["reels_price"] ?? 0,
                              storyPrice: creator["data"]["story_price"] ?? 0,
                              postPrice: creator["data"]["post_price"] ?? 0,
                              creatorid: widget.creatorId,
                            ),
                          ),
                        ),
                      );
                  },
                ),
              ],
            ),
          );
        });
      },
    ),
  ),
);
 }

//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bg1,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               const CreatorHeader(),
//               const SizedBox(height: 16),

//               /// Stats
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   StatChip(title: "Followers", value: "100K"),
//                   StatChip(title: "Avg.Views", value: "550K"),
//                   StatChip(title: "Weekly Growth", value: "1.9%"),
//                   StatChip(title: "Avg.Reach", value: "220K"),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               /// Engagement
//               _card(
//                 Column(
//                   children: const [
//                     Text("Engagement analytics",
//                         style: TextStyle(fontWeight: FontWeight.w600)),
//                     SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text("2390\nAvg.Likes",
//                             textAlign: TextAlign.center),
//                         Text("120\nAvg.comments",
//                             textAlign: TextAlign.center),
//                         Text("12%\nEng. Rate",
//                             textAlign: TextAlign.center),
//                       ],
//                     )
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 16),


// SectionCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text("Audience Demographic",
//                         style: TextStyle(fontWeight: FontWeight.w700)),
//                     SizedBox(height: 12),
//                     GenderSplit(),
//                     SizedBox(height: 14),
//                     Text("Age Distribution",
//                         style: TextStyle(fontWeight: FontWeight.w600)),
//                     SizedBox(height: 8),
//                     ProgressRow(label: "18-24", value: 0.8),
//                     SizedBox(height: 6),
//                     ProgressRow(label: "25-34", value: 0.6),
//                     SizedBox(height: 6),
//                     ProgressRow(label: "13-17", value: 0.3),
//                     SizedBox(height: 6),
//                     ProgressRow(label: "35+", value: 0.2),
//                   ],
//                 ),
//               ),

//               /// Top Location
//               SectionCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Top Location",
//                         style: TextStyle(fontWeight: FontWeight.w700)),
//                     SizedBox(height: 10, width: MediaQuery.of(context).size.width,),
//                     const LocationTile(title: "Delhi"),
//                     const LocationTile(title: "mumbai"),
//                     const LocationTile(title: "banglore"),
//                     const LocationTile(title: "hariyana"),
//                   ],
//                 ),
//               ),

//               /// Content performance
//               SectionCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text("Content performance",
//                         style: TextStyle(fontWeight: FontWeight.w700)),
//                     SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         StatChip(title: "Avg.Story.Views", value: "12K"),
//                         StatChip(title: "response Rate", value: "45%"),
//                       ],
//                     )
//                   ],
//                 ),
//               ),

//               /// Pricing
//               const Text("Pricing",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               const SizedBox(height: 10),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   PricingChip(title: "Reels\n₹20K"),
//                   PricingChip(title: "Story\n₹12K"),
//                   PricingChip(title: "Post\n₹2K"),
//                 ],
//               ),

//               const SizedBox(height: 20),

//               SecprimarBtn(
//                 text: "Book Service",
//                 onPressed: () {

//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (_) => const Selectservice(),
//                             ),
//                           ); 
//                 },
//               )
//               /// Audience
//               // _card(
//               //   Column(
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     children: const [
//               //       Text("Audience Demographic",
//               //           style: TextStyle(fontWeight: FontWeight.w600)),
//               //       SizedBox(height: 12),
//               //       ProgressRow(label: "18-24", value: 0.8),
//               //       SizedBox(height: 6),
//               //       ProgressRow(label: "25-34", value: 0.6),
//               //       SizedBox(height: 6),
//               //       ProgressRow(label: "13-17", value: 0.3),
//               //       SizedBox(height: 6),
//               //       ProgressRow(label: "35+", value: 0.2),
//               //     ],
//               //   ),
//               // ),

//               // const SizedBox(height: 16),

//               // /// Pricing
//               // _card(
//               //   Column(
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     children: const [
//               //       Text("Pricing",
//               //           style: TextStyle(fontWeight: FontWeight.w600)),
//               //       SizedBox(height: 12),
//               //       Text("Reels   ₹20K"),
//               //       Text("Story   ₹12K"),
//               //       Text("Post    ₹2K"),
//               //     ],
//               //   ),
//               // ),

//               // const SizedBox(height: 20),

//               // SecprimarBtn(
//               //   text: "Book Service",
//               //   onPressed: () {},
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  // static Widget _card(Widget child) {
  //   return Container(
  //     padding: const EdgeInsets.all(14),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(14),
  //     ),
  //     child: child,
  //   );
  // }
}