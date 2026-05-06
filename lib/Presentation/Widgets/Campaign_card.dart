import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Presentation/bloc/booking_bloc.dart';

class CampaignCard extends StatelessWidget {
  final String? campaignname;
  final String? campaigndescription;
  final int? deadline;
  CampaignCard({super.key, this.campaignname, this.campaigndescription, this.deadline});
  final formController = Get.find<BookingFormController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "${campaignname}",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            "Deadline  ${formController.deadline.value} days",
            style: TextStyle(fontSize: 12, color: AppColors.muted),
          ),
          const SizedBox(height: 10),
          Container(
                            width: double.infinity,

            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFD7D1F2),
              borderRadius: BorderRadius.circular(10),
            ),
            // child: const Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text("Reel 1"),
            //     SizedBox(height: 4),
            //     Text("Story 1"),
            //     SizedBox(height: 4),
            //     Text("Post 1"),
            //   ],
            // ),
            child: BlocBuilder<BookingBloc, BookingState>(
              builder: (context, state) {
                if (state is BookingUpdated) {
                  final selected = state.services
                      .where((s) => s.quantity > 0)
                      .toList();

                  if (selected.isEmpty) {
                    return const Text("No service selected");
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: selected.map((service) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            /// Service Title
                            Expanded(
                              flex: 3,
                              child: Text(
                                service.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            /// Quantity
                            Expanded(
                              flex: 2,
                              child: Text(
                                "x ${service.quantity}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),

                            /// Price
                            Expanded(
                              flex: 2,
                              child: Text(
                                "₹${service.price * service.quantity}",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
