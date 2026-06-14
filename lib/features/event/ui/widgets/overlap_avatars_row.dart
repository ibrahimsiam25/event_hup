import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverlapAvatarsRow extends StatelessWidget {
  final int count;
  final String text;

  const OverlapAvatarsRow({
    super.key,
    this.count = 3,
    this.text = '+20 Going',
  });

  @override
  Widget build(BuildContext context) {
    final avatarColors = [
      const Color(0xFFED6A5E),
      const Color(0xFFF9A11B),
      const Color(0xFF61C554),
    ];

    return Row(
      children: [
        SizedBox(
          width: 52.w,
          height: 22.h,
          child: Stack(
            children: List.generate(count, (i) {
              return Positioned(
                left: (i * 14).w,
                child: Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: avatarColors[i % avatarColors.length],
                    border: Border.all(color: AppColors.white, width: 1.5),
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                    size: 12.sp,
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: AppTextStyles.font14PrimaryMedium.copyWith(
            fontSize: 11.sp,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
