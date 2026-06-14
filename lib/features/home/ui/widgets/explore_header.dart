import 'package:event_hup/core/helpers/app_assets.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12.h,
        left: 24.w,
        right: 24.w,
        bottom: 48.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36.r),
          bottomRight: Radius.circular(36.r),
        ),
      ),
      child: Column(
        children: [
          _buildHeaderTopRow(context),
          SizedBox(height: 24.h),
          _buildSearchRow(context),
        ],
      ),
    );
  }

  Widget _buildHeaderTopRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(Assets.imagesPngSettingIcon ,
           width: 24.w ,
           
               )
        ),
        Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).currentLocation,
                  style: AppTextStyles.font15WhiteRegular.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.white.withValues(alpha: 0.7),
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              S.of(context).newYorkUSA,
              style: AppTextStyles.font18WhiteMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.bell,
                color: AppColors.white,
                size: 20.sp,
              ),
            ),
            Positioned(
              right: 6.w,
              top: 6.h,
              child: Container(
                width: 7.r,
                height: 7.r,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                CupertinoIcons.search,
                color: AppColors.white,
                size: 24.sp,
              ),
              SizedBox(width: 8.w),
              Container(
                width: 1.w,
                height: 20.h,
                color: AppColors.white.withValues(alpha: 0.3),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: TextField(
                  style: AppTextStyles.font15WhiteRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.white,
                  decoration: InputDecoration(
                    hintText: S.of(context).searchHint,
                    hintStyle: AppTextStyles.font15WhiteRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.white.withValues(alpha: 0.4),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFF5D5FEF), // Filter button color
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10.r,
                backgroundColor: AppColors.white.withValues(alpha: 0.15),
                child: Icon(
                  CupertinoIcons.slider_horizontal_3,
                  color: AppColors.white,
                  size: 12.sp,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                S.of(context).filters,
                style: AppTextStyles.font15WhiteRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
