import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Widgets/Onboarding_header.dart';
import 'package:snappis/Presentation/Widgets/Role_button.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const OnboardingHeader(
            illustrationPath: 'assets/images/image 1 (3).png',
          ),

          const SizedBox(height: 20),

          const Text(
            'Choose Your Journey',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'Select your role to unlock the right features, tools, and opportunities with Snappis.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                RoleButton(
                  label: "I'm a Creator",
                  filled: true,
                  onTap: () => Get.toNamed('/Creator-Signup'),
                ),
                const SizedBox(height: 14),
                RoleButton(
                  label: "I'm a Brand",
                  filled: false,
                  onTap: () => Get.toNamed('/Brand-Signup'),
                ),
                const SizedBox(height: 14),
                RoleButton(
                  label: "I'm an Agency",
                  filled: false,
                  onTap: () => Get.toNamed('/Brand-Signup'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
