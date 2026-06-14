import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MockProfileView extends StatelessWidget {
  const MockProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        title: Text(S.of(context).profile, style: AppTextStyles.font18BlackBold),
        backgroundColor: AppColors.white,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Icon(
                      CupertinoIcons.person_solid,
                      size: 50.sp,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Ibrahim Siam',
                    style: AppTextStyles.font18BlackBold.copyWith(fontSize: 22.sp),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'ibrahimsiam25@example.com',
                    style: AppTextStyles.font14GreyMedium,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildProfileStat('35', S.of(context).going),
                      Container(
                        width: 1.w,
                        height: 30.h,
                        color: AppColors.greyLight,
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                      ),
                      _buildProfileStat('12', S.of(context).pastLabel),
                      Container(
                        width: 1.w,
                        height: 30.h,
                        color: AppColors.greyLight,
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                      ),
                      _buildProfileStat('150', S.of(context).followers),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 12.h),
            _buildProfileMenuItem(CupertinoIcons.square_list, S.of(context).myEvents),
            _buildProfileMenuItem(CupertinoIcons.bookmark, S.of(context).bookmarkedEvents),
            _buildProfileMenuItem(CupertinoIcons.bell, S.of(context).notifications),
            _buildProfileMenuItem(CupertinoIcons.settings, S.of(context).settings),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.font18BlackBold.copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppTextStyles.font12GreyRegular,
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem(IconData icon, String label) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      color: AppColors.white,
      child: ListTile(
        leading: Icon(icon, color: AppColors.grey, size: 22.sp),
        title: Text(
          label,
          style: AppTextStyles.font15BlackRegular.copyWith(fontWeight: FontWeight.w500),
        ),
        trailing: Icon(CupertinoIcons.chevron_right, color: AppColors.grey, size: 16.sp),
        onTap: () {},
      ),
    );
  }
}
