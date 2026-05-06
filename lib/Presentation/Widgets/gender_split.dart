import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class GenderSplit extends StatelessWidget {
  const GenderSplit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.chip,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text("Gender Split",
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              value: 0.5,
              strokeWidth: 10,
              backgroundColor: Colors.white,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("50%\nMale", textAlign: TextAlign.center),
              Text("50%\nFemale", textAlign: TextAlign.center),
            ],
          )
        ],
      ),
    );
  }
}
