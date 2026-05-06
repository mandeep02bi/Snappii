import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/ServiceEntities.dart';
import 'package:snappis/Domains/Entities/Service_entites.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Domains/controllers/booking_summary_controller.dart';
import 'package:snappis/Presentation/Screens/Business/Book_service/Campaign_details.dart';
import 'package:snappis/Presentation/Widgets/Service_card_widget.dart';
import 'package:snappis/Presentation/bloc/booking_bloc.dart';

class Selectservice extends StatefulWidget {
    final int reelsPrice;
  final int storyPrice;
  final int postPrice;
  final String creatorid;

  const Selectservice({
    super.key,
    required this.reelsPrice,
    required this.storyPrice,
    required this.postPrice, 
    required this.creatorid,
  });

  @override
  State<Selectservice> createState() => _SelectserviceState();
}

class _SelectserviceState extends State<Selectservice> {
  final summaryController = Get.put(BookingSummaryController());
   late List<ServiceEntity> services;

@override
void initState() {
  super.initState();
 context.read<BookingBloc>().add(
    InitializeServices([
      ServiceEntity1(
        title: "Reels",
        description: "Shorts for video content",
        price: widget.reelsPrice,
      ),
      ServiceEntity1(
        title: "Story",
        description: "Shorts for video content",
        price: widget.storyPrice,
      ),
      ServiceEntity1(
        title: "Post",
        description: "Shorts for video content",
        price: widget.postPrice,
      ),
    ]),
  );
}

  int get subtotal =>
      services.fold(0, (sum, s) => sum + (s.price * s.quantity));

  @override
  Widget build(BuildContext context) {
    print("SelectService Bloc: ${context.read<BookingBloc>().hashCode}");
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 12),
                  Text("Step 1/4", style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),

              const SizedBox(height: 14),
              const Text(
                "Select Service",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Choose the services you want to book",
                style: TextStyle(color: Colors.black45),
              ),

              const SizedBox(height: 20),

              // Expanded(
              //   child: ListView(
              //     children: services.map((s) {
              //       return ServiceCardWidget(
              //         service: s,
              //         onAdd: () => setState(() => s.quantity++),
              //         onRemove: () {
              //           if (s.quantity > 1) {
              //             setState(() => s.quantity--);
              //           }
              //         },
              //       );
              //     }).toList(),
              //   ),
              // ),
             Expanded(
                  child: BlocListener<BookingBloc, BookingState>(
                    listener: (context, state) {
                      if (state is BookingUpdated) {
                        summaryController.updateSummary(state.services);
                      }
                    },
                    child: BlocBuilder<BookingBloc, BookingState>(
                      builder: (context, state) {
                        if (state is BookingUpdated) {
                          return ListView.builder(
                            itemCount: state.services.length,
                            itemBuilder: (context, index) {
                              final service = state.services[index];

                              return ServiceCardWidget(
                                service: service,
                                onAdd: () {
                                  context.read<BookingBloc>()
                                      .add(IncreaseQuantity(index));
                                },
                                onRemove: () {
                                  context.read<BookingBloc>()
                                      .add(DecreaseQuantity(index));
                                },
                              );
                            },
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              // Container(
              //   padding: const EdgeInsets.all(14),
              //   decoration: BoxDecoration(
              //     color: AppColors.lightPurples,
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const Text("Order summary"),
              //           Text(
              //             "${services.length} Services selected",
              //             style: const TextStyle(fontSize: 12),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: [
              //           const Text("Subtotal"),
              //           Text(
              //             "₹$subtotal",
              //             style: const TextStyle(
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              Obx(() => Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.lightPurples,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Order summary"),
                        Text(
                          "${summaryController.totalItems.value} Services selected",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Subtotal"),
                        Text(
                          "₹${summaryController.subtotal.value}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => const CampaignDetails(),
                          //   ),
                          // ); 

                        final blocState = context.read<BookingBloc>().state;

                          if (blocState is BookingUpdated) {
                            final formController = Get.find<BookingFormController>();
                            formController.setServices(blocState.services);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CampaignDetails(
                                  services: blocState.services,
                                  totalAmount: summaryController.subtotal.value,
                                ),
                              ),
                            );
                          }
                  },
                  child: const Text("Next",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}