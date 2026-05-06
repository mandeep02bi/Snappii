import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Presentation/Cubit/Campaign_cubit.dart';
import 'package:snappis/Presentation/Widgets/Admin/step_indicator.dart';
import 'package:snappis/Presentation/Widgets/Gradient_buttons.dart';

class Addbrandcampaign extends StatefulWidget {
  const Addbrandcampaign({super.key});

  @override
  State<Addbrandcampaign> createState() => _AddbrandcampaignState();
}

class _AddbrandcampaignState extends State<Addbrandcampaign> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CampaignCubit(),
      child: BlocBuilder<CampaignCubit, int>(
        builder: (context, step) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 700,
              height: 650,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Add New Campaign",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.close),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Step Indicator
                  StepIndicator(currentStep: step),

                  const SizedBox(height: 24),

                  /// Content (Scrollable)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _leftCard(context)),
                          const SizedBox(width: 20),
                          Expanded(child: _rightCard(context)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Bottom Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child:
                              const Text("Saves as Draft"),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: GradientButton(
                          text: "Preview & Publish",
                          onPressed: () {
                            context
                                .read<CampaignCubit>()
                                .nextStep();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _leftCard(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Campaign Name",
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(12)),
          ),
          onChanged: (val) {
            if (val.isNotEmpty) {
              context.read<CampaignCubit>().goTo(1);
            }
          },
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: "Deadline",
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 16),
        GradientButton(
          text: "Continue",
          onPressed: () {
            context.read<CampaignCubit>().nextStep();
          },
        ),
        const SizedBox(height: 24),

        Text(
          "Deliverables By Influencer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        /// Reels Counter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Reels"),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                const Text("0"),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),

        /// Post Counter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Post"),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                const Text("0"),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),

        const SizedBox(height: 16),

        /// Sample Video Upload Box
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.purple),
          ),
          child: const Center(
            child: Icon(Icons.add, size: 40),
          ),
        ),

      ],
    );
  }

  // Widget _rightCard(BuildContext context) {
  //   return Column(
  //     children: [
  //       TextField(
  //         maxLines: 3,
  //         decoration: InputDecoration(
  //           labelText: "Campaign Description",
  //           border: OutlineInputBorder(
  //               borderRadius:
  //                   BorderRadius.circular(12)),
  //         ),
  //         onChanged: (val) {
  //           if (val.isNotEmpty) {
  //             context.read<CampaignCubit>().goTo(2);
  //           }
  //         },
  //       ),
  //       const SizedBox(height: 16),
  //       DropdownButtonFormField(
  //         items: const [
  //           DropdownMenuItem(
  //               value: "Male", child: Text("Male")),
  //           DropdownMenuItem(
  //               value: "Female",
  //               child: Text("Female")),
  //         ],
  //         onChanged: (_) {
  //           context.read<CampaignCubit>().goTo(3);
  //         },
  //         decoration: InputDecoration(
  //           labelText: "Gender",
  //           border: OutlineInputBorder(
  //               borderRadius:
  //                   BorderRadius.circular(12)),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget _rightCard(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Campaign Description
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Campaign Description",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// Gender
        DropdownButtonFormField<String>(
          items: const [
            DropdownMenuItem(value: "Male", child: Text("Male")),
            DropdownMenuItem(value: "Female", child: Text("Female")),
          ],
          onChanged: (_) {},
          decoration: InputDecoration(
            labelText: "Gender",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// Age Range
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Min Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Max Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// Country
        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(value: "India", child: Text("India")),
          ],
          onChanged: (_) {},
          decoration: InputDecoration(
            labelText: "Country",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// State
        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(value: "Delhi", child: Text("Delhi")),
          ],
          onChanged: (_) {},
          decoration: InputDecoration(
            labelText: "State",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// City
        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(value: "Bangalore", child: Text("Bangalore")),
          ],
          onChanged: (_) {},
          decoration: InputDecoration(
            labelText: "City",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    ),
  );
}

}