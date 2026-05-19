import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandEditProfileAvatar extends StatelessWidget {
  const BrandEditProfileAvatar({super.key, this.onEditTap});

  final VoidCallback? onEditTap;

  static const _avatarAsset = 'assets/icons/person.png';

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 117.w,
                height: 117.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: Image.asset(
                    _avatarAsset,
                    height: 61.h,
                    width: 61.w,
                    cacheHeight: (61 * MediaQuery.devicePixelRatioOf(context))
                        .round(),
                    cacheWidth: (61 * MediaQuery.devicePixelRatioOf(context))
                        .round(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Edit Profile',
            style: TextStyle(fontSize: 15, color: Color(0xE6000000)),
          ),
        ],
      ),
    );
  }
}
