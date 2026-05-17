import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignDeliverableRow extends StatefulWidget {
  final String title;
  final int initialValue;

  const CampaignDeliverableRow({
    super.key,
    required this.title,
    this.initialValue = 1,
  });

  @override
  State<CampaignDeliverableRow> createState() => _CampaignDeliverableRowState();
}

class _CampaignDeliverableRowState extends State<CampaignDeliverableRow> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.remove, size: 20.r, color: Colors.black54),
            onPressed: () {
              if (value > 0) setState(() => value--);
            },
          ),
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: const Color(0xFFE1D0FF).withOpacity(0.55),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFC0C0C0), width: 1.w),
            ),
            child: Center(
              child: Text(
                "$value",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF9136F3),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, size: 20.r, color: Colors.black54),
            onPressed: () {
              setState(() => value++);
            },
          ),
        ],
      ),
    );
  }
}

class CampaignDeliverablesSection extends StatelessWidget {
  const CampaignDeliverablesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        children: const [
          CampaignDeliverableRow(title: "Reels"),
          CampaignDeliverableRow(title: "Story"),
          CampaignDeliverableRow(title: "Post"),
        ],
      ),
    );
  }
}
