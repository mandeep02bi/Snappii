import 'package:flutter/material.dart';
import 'onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Image.asset(
          'assets/images/Group 6.png',
          width: size.width,
          height: size.height * 0.28 + MediaQuery.of(context).viewPadding.top,
          fit: BoxFit.cover,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 8),
          child: Image.asset(
            data.imagePath,
            height: size.height * 0.2,
            fit: BoxFit.contain,
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 28, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 140),
      ],
    );
  }
}
