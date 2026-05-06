import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Widgets/Banner_slidder.dart';
import 'package:snappis/Presentation/Widgets/Creator_home_camp.dart';
import 'package:snappis/Presentation/Widgets/Search_field.dart';

class Chomescreen extends StatefulWidget {
  const Chomescreen({super.key});

  @override
  State<Chomescreen> createState() => _ChomescreenState();
}

class _ChomescreenState extends State<Chomescreen> {
  @override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchField(),
              SizedBox(height: 16),
              BannerSlidder(),
              SizedBox(height: 20),
              Text("Suggest Campaign",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              CreatorHomeCamp(),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Powered by Official\nMeta Apis",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.muted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}