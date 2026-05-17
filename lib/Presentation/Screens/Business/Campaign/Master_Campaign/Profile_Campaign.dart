import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/ServiceEntities.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Presentation/Controllers/Creatordetailscontroller.dart';
import 'package:snappis/Presentation/Screens/Business/Book_service/SelectService.dart';
import 'package:snappis/Presentation/Widgets/Creator_header.dart';
import 'package:snappis/Presentation/Widgets/Pricing_chip.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';
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

  @override
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
              return Center(
                child: Text(
                  "Failed to load profile",
                  style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                ),
              );
            }

            return Obx(() {
              final creator = detailController.creator;

              if (creator.isEmpty) {
                return const SizedBox();
              }

              return SingleChildScrollView(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    CreatorHeader(
                      name: creator["data"]["name"],
                      username: creator["data"]["instagram_username"],
                      imageUrl:
                          "${ApiConstants.baseUrl}${creator["data"]["profile_picture_url"] ?? ""}",
                      followers: creator["data"]["followers_count"],
                    ),
                    SizedBox(height: 16.h),

                    /// Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatChip(
                          title: "Followers",
                          value: "${creator["data"]["followers_count"] ?? 0}",
                        ),
                        StatChip(
                          title: "Avg.Views",
                          value: "${creator["data"]["avg_reel_views"] ?? 0}",
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    /// Pricing (auto-adaptive)
                    if (creator["data"]["reels_price"] != null ||
                        creator["data"]["story_price"] != null ||
                        creator["data"]["post_price"] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pricing",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    SizedBox(height: 20.h),

                    SecprimarBtn(
                      text: "Book Service",
                      onPressed: () {
                        final creator = detailController.creator;

                        formController.setCreator(
                          id: widget.creatorId,
                          name: creator["data"]["name"] ?? "",
                          image:
                              "${ApiConstants.baseUrl}${creator["data"]["profile_picture_url"] ?? ""}",
                          followers: creator["data"]["followers_count"] ?? 0,
                          username: creator["data"]["instagram_username"] ?? "",
                        );

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
                                      price:
                                          creator["data"]["reels_price"] ?? 0,
                                    ),
                                    ServiceEntity1(
                                      title: "Story",
                                      description: "...",
                                      price:
                                          creator["data"]["story_price"] ?? 0,
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
}