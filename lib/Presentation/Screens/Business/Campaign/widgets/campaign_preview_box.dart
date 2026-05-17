import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignPreviewBox extends StatelessWidget {
  final List<CampaignPreviewItemData> items;

  const CampaignPreviewBox({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EBFF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: index < items.length - 1
                    ? Border(right: BorderSide(color: Colors.black12, width: 1.w))
                    : null,
              ),
              child: Column(
                children: [
                  Icon(item.icon, color: const Color(0xFF9136F3), size: 24.r),
                  SizedBox(height: 4.h),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF6A4DBA),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CampaignPreviewItemData {
  final IconData icon;
  final String label;

  CampaignPreviewItemData({required this.icon, required this.label});
}
