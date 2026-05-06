import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class SecprimarBtn extends StatelessWidget {
final String text;
  final VoidCallback onPressed;
  final bool outlined;


  const SecprimarBtn({super.key, required this.text, required this.onPressed, this.outlined = false,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child:  outlined
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: onPressed,
              child: Text(text,
                  style: const TextStyle(color: AppColors.primary)),
            )
          :ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}