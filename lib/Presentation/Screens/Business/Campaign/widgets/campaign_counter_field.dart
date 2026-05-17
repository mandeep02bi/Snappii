import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignCounterField extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const CampaignCounterField({
    super.key,
    this.initialValue = 1,
    this.onChanged,
  });

  @override
  State<CampaignCounterField> createState() => _CampaignCounterFieldState();
}

class _CampaignCounterFieldState extends State<CampaignCounterField> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: Colors.black87, size: 20.r),
            onPressed: () {
              if (value > 1) {
                setState(() => value--);
                widget.onChanged?.call(value);
              }
            },
          ),
          SizedBox(width: 20.w),
          Container(
            width: 30.w,
            height: 30.h,
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
          SizedBox(width: 20.w),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black87, size: 20.r),
            onPressed: () {
              setState(() => value++);
              widget.onChanged?.call(value);
            },
          ),
        ],
      ),
    );
  }
}
