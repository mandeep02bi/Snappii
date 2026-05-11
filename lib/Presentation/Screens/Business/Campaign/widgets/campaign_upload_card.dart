import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:snappis/Core/assets.dart';

class CampaignUploadCard extends StatelessWidget {
  final String title;
  final String? recommendedText;

  const CampaignUploadCard({
    super.key,
    required this.title,
    this.recommendedText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const Text(
            "Optional",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomPaint(
              painter: DashedBorderPainter(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Image.asset(AppAssets.uploadIcon, width: 65, height: 65),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Drag & drop or Click to browse file",
                      style: TextStyle(fontSize: 13, color: Colors.black26),
                    ),
                    if (recommendedText != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F7FF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFFE1D0FF),
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          recommendedText!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9136F3),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black12
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5;
    const double dashSpace = 3;
    final Radius radius = const Radius.circular(15);

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      radius,
    );

    final Path path = Path()..addRRect(rrect);

    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
