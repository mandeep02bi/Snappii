import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final String? illustrationPath;
  final double heightFactor;
  final double illustrationHeightFactor;

  const OnboardingHeader({
    super.key,
    this.illustrationPath,
    this.heightFactor = 0.35,
    this.illustrationHeightFactor = 0.22,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).viewPadding.top;

    return SizedBox(
      width: size.width,
      height: size.height * heightFactor + topPadding,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/Group 6.png', fit: BoxFit.cover),
          if (illustrationPath != null)
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: Image.asset(
                  illustrationPath!,
                  height: size.height * illustrationHeightFactor,
                  fit: BoxFit.contain,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
