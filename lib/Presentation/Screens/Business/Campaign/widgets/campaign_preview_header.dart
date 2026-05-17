import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snappis/Core/utils/Colors.dart';

class CampaignPreviewHeader extends StatelessWidget {
  final String title;

  const CampaignPreviewHeader({
    super.key,
    this.title = "Preview",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, size: 24.r),
          onPressed: () => Navigator.pop(context),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
