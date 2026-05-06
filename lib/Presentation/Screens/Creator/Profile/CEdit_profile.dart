import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Creator/Instagram/ConnInsta.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class EditProfileSc extends StatefulWidget {
  const EditProfileSc({super.key});

  @override
  State<EditProfileSc> createState() => _EditProfileScState();
}

class _EditProfileScState extends State<EditProfileSc> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      /// ❌ NO APP BAR / NO HAMBURGER
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
          
              /// Profile Image
              const CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
          
              const SizedBox(height: 14),
          
              /// Username
              const Text(
                "kittuuuuu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
          
              const SizedBox(height: 16),
          
              /// Connect Instagram Button
              SecprimarBtn(
                text: "Connect instagram",
                onPressed: () {
                   Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const Conninsta(),
                            ),
                          ); 
                  // TODO: Instagram OAuth
                },
              ),
          
              const Spacer(),
          
              /// Footer text
              const Text(
                "Meta verified Secured Data",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}