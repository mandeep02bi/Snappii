import 'package:flutter/material.dart';

class ConnectInstagramSection extends StatelessWidget {
  const ConnectInstagramSection({super.key, this.onConnectTap});

  final VoidCallback? onConnectTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),

        LayoutBuilder(
          builder: (context, constraints) {
            final phoneWidth = constraints.maxWidth * 0.28;
            final phoneHeight = phoneWidth * 1.6;
            final cardsWidth = constraints.maxWidth * 0.75;
            final totalHeight = phoneHeight + 30;

            return SizedBox(
              height: totalHeight,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  // صورة الموبايل في الخلف
                  Image.asset(
                    'assets/images/image 3 (1).png',
                    width: phoneWidth,
                    height: phoneHeight,
                    fit: BoxFit.contain,
                  ),

                  // صورة الكروت فوق الموبايل
                  Positioned(
                    top: phoneHeight * 0.18,
                    child: Image.asset(
                      'assets/images/Group 587.png',
                      width: cardsWidth,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 50),

        GestureDetector(
          onTap: onConnectTap,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFFBB93FF), Color(0xFF5765FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Connect Instagram',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),
        Text(
          'Protected with Official Meta APIs Security',
          style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12),
        ),
      ],
    );
  }
}
