import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChipsList extends StatelessWidget {
  const CategoryChipsList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      _CategoryData(
        name: S.of(context).sports,
        color: AppColors.chipSports,
        icon: Icons.sports_basketball,
      ),
      _CategoryData(
        name: S.of(context).music,
        color: AppColors.chipMusic,
        icon: Icons.music_note,
      ),
      _CategoryData(
        name: S.of(context).food,
        color: AppColors.chipFood,
        icon: Icons.restaurant,
      ),
      _CategoryData(
        name: S.of(context).art,
        color: const Color(0xFF46CDFB),
        icon: Icons.palette,
      ),
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Container(
          margin: EdgeInsets.only(right: 12.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: cat.color,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: cat.color.withValues(alpha: 0.25),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                cat.icon,
                color: AppColors.white,
                size: 18.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                cat.name,
                style: AppTextStyles.font15WhiteRegular.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CategoryData {
  final String name;
  final Color color;
  final IconData icon;

  _CategoryData({
    required this.name,
    required this.color,
    required this.icon,
  });
}
