import 'package:flutter/material.dart';

class BusinessProfileBenefitsSection extends StatelessWidget {
  const BusinessProfileBenefitsSection({super.key, required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBenefitCard(
          icon: Icons.bar_chart_rounded,
          title: 'Better Campaign Results',
        ),
        SizedBox(height: 6 * scale),
        _buildBenefitCard(
          icon: Icons.people_outline_rounded,
          title: 'Top Creator Matches',
        ),
        SizedBox(height: 6 * scale),
        _buildBenefitCard(icon: Icons.bolt_rounded, title: 'High ROI Matches'),
        SizedBox(height: 6 * scale),
        _buildBenefitCard(
          icon: Icons.trending_up_rounded,
          title: 'Grow with Creators',
        ),
      ],
    );
  }

  Widget _buildBenefitCard({required IconData icon, required String title}) {
    const accentColor = Color(0xFFB388FF);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * scale,
        vertical: 10 * scale,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10 * scale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 3 * scale,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(width: 10 * scale),
            Icon(icon, size: 20 * scale, color: Colors.black87),
            SizedBox(width: 10 * scale),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 13 * scale,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 10 * scale),
            // خط بنفسجي يمين
            Container(
              width: 3 * scale,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
