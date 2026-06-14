import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatsRow extends StatelessWidget {
  final String followingCount;
  final String followersCount;

  const ProfileStatsRow({
    super.key,
    required this.followingCount,
    required this.followersCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatColumn(followingCount, S.of(context).followingLabel),
        Container(
          width: 1.w,
          height: 32.h,
          color: AppColors.greyLight,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
        ),
        _buildStatColumn(followersCount, S.of(context).followersLabel),
      ],
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: AppTextStyles.font18BlackBold.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppTextStyles.font12GreyRegular.copyWith(
            fontSize: 13.sp,
            color: AppColors.greyDark,
          ),
        ),
      ],
    );
  }
}
