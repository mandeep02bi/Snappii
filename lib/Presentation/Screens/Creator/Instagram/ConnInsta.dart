import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Controllers/Creator_controller.dart';
import 'package:snappis/Presentation/Screens/Creator/Instagram/Connectinsta2.dart';
import 'package:snappis/Presentation/Widgets/App_textField.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class Conninsta extends StatefulWidget {
  const Conninsta({super.key});

  @override
  State<Conninsta> createState() => _ConninstaState();
}

class _ConninstaState extends State<Conninsta> {

final CreatorController controller = Get.put(CreatorController());

  @override
  void initState() {
    super.initState();
    controller.fetchGenders();
    controller.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back + Title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Connect instagram",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              const Center(
                child: Text(
                  "Secured with Meta APIs",
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 10),
              const Text("Step 1/1"),

              const SizedBox(height: 12),

              /// Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 14),

                    const Text("Your Name"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Your Name",
                      onChanged: (value) => controller.name.value = value,
                    ),


                    const SizedBox(height: 12),

                    const Text("Category"),
                    const SizedBox(height: 6),
                    // const AppTextField(hint: "e.g Lifestyle"),
                    Obx(() {
                      if (controller.isCategoryLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return DropdownButtonFormField<DropdownModel>(
                        value: controller.selectedCategory.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        hint: const Text("Select Category"),
                        items: controller.categoryList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedCategory.value = value;
                        },
                      );
                    }),


                    const SizedBox(height: 12),

                    const Text("Story Price (₹)"),
                    const SizedBox(height: 6),
                    // const AppTextField(hint: "Story", suffix: "INR"),
                    AppTextField(
                      hint: "Story",
                      suffix: "INR",
                      keyboardType: TextInputType.number,
                      onChanged: (val) => controller.storyPrice.value = val,
                    ),


                    const SizedBox(height: 12),

                    const Text("Reels Price (₹)"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Reels",
                      suffix: "INR",
                      keyboardType: TextInputType.number,
                      onChanged: (val) => controller.reelPrice.value = val,
                    ),



                    const SizedBox(height: 12),

                    const Text("Post Price"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Post",
                      suffix: "INR",
                      keyboardType: TextInputType.number,
                      onChanged: (val) => controller.postPrice.value = val,
                    ),


                    const SizedBox(height: 12),



                    // const Text("Gender"),
                    // const SizedBox(height: 6),
                    // const AppTextField(
                    //   hint: "Select Gender",
                    // ),

                    const Text("Gender"),
                    const SizedBox(height: 6),

                    Obx(() {
                      if (controller.isGenderLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return DropdownButtonFormField<DropdownModel>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        hint: const Text("Select Gender"),
                        value: controller.selectedGender.value,
                        items: controller.genderList.map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedGender.value = value;
                        },
                      );
                    }),


                    const SizedBox(height: 12),

                    const Text("delivers deadline"),
                    const SizedBox(height: 6),
                    // const AppTextField(hint: "", suffix: null,),
                    AppTextField(
                      hint: "Enter deadline",
                      onChanged: (val) => controller.deadline.value = val,
                    ),


                    const SizedBox(height: 20),

                    SecprimarBtn(
                      text: "Next",
                      onPressed: () async{
                          bool success = await controller.submitCreatorProfile();
                            if (success) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const Connectinsta2(),
                                ),
                              );
                            }
                        // Navigate to next step
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}