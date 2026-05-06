import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class UploadImageCard extends StatelessWidget {
  const UploadImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.purple),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Optional",
              style: TextStyle(color: AppColors.greyText),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: AppColors.purple,
                  style: BorderStyle.solid),
            ),
            child: const Center(
              child: Icon(Icons.add,
                  size: 40, color: AppColors.purple),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Recommended. Portrait (2:3 ratio), JPG/PNG",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
