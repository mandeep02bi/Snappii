import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class PriceSummaryCard extends StatelessWidget {
  const PriceSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.border,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _row("Campaign fee", "₹349"),
          const SizedBox(height: 6),
          _row("Taxs", "+ ₹99"),
          const Divider(height: 22),
          _row(
            "Total",
            "₹349",
            isBold: true,
            valueColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _row(String title, String value,
      {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.w600 : FontWeight.normal)),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            color: valueColor,
          ),
        ),
      ]
    );
  }
}
