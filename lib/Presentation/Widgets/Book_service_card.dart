import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Presentation/Widgets/Price_row.dart';
import 'package:snappis/Presentation/bloc/booking_bloc.dart';

class ServiceCard extends StatelessWidget {
  ServiceCard({super.key});
  final formController = Get.find<BookingFormController>();

  @override

  @override
Widget build(BuildContext context) {
  return BlocBuilder<BookingBloc, BookingState>(
    builder: (context, state) {
      if (state is BookingUpdated) {

        final selected = state.services
            .where((s) => s.quantity > 0)
            .toList();

        // 🔹 Calculate Subtotal
        final subtotal = selected.fold<int>(
          0,
          (sum, service) => sum + (service.price * service.quantity),
        );

        // 🔹 Tax 18%
        final tax = (subtotal * 0.18).round();

        // 🔹 Platform Fee 5%
        final platformFee = (subtotal * 0.05).round();

        // 🔹 Grand Total
        final grandTotal = subtotal + tax + platformFee;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.borderd, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Center(
                child: Text(
                  "Selected Services",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 Dynamic Service Rows
              ...selected.map((service) {
                return PriceRow(
                  title: "${service.title} x ${service.quantity}",
                  value: "₹${service.price * service.quantity}",
                );
              }),

              const SizedBox(height: 10),

              /// 🔹 Subtotal
              PriceRow(
                title: "Subtotal",
                value: "₹$subtotal",
                bold: true,
              ),

              /// 🔹 Tax
              PriceRow(
                title: "Tax (18%)",
                value: "₹$tax",
              ),

              /// 🔹 Platform Fee
              PriceRow(
                title: "Platform Fee (5%)",
                value: "₹$platformFee",
              ),

              const Divider(thickness: 1),

              /// 🔹 Grand Total
              PriceRow(
                title: "Grand Total",
                value: "₹$grandTotal",
                bold: true,
              ),
            ],
          ),
        );
      }

      return const SizedBox();
    },
  );
}
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: AppColors.cardBg,
  //       borderRadius: BorderRadius.circular(6),
  //       border: Border.all(color: AppColors.borderd, width: 2),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: const [
  //         Center(
  //           child: Text(
  //             "Select Service",
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //         SizedBox(height: 16),

  //         PriceRow(title: "Reel x 1", value: "₹20K"),
  //         PriceRow(title: "Story x 1", value: "₹12K"),
  //         PriceRow(title: "Post x 1", value: "₹2K"),

  //         SizedBox(height: 10),

  //         PriceRow(title: "Subtotal", value: "₹34000", bold: true),
  //         PriceRow(title: "Tax Fee", value: ""),
  //         PriceRow(title: "Platform fee", value: ""),

  //         Divider(thickness: 1),

  //         PriceRow(title: "Grand Total", value: "", bold: true),
  //       ],
  //     ),
  //   );
  // }
}
