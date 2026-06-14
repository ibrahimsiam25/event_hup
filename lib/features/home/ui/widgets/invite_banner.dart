import 'package:event_hup/core/helpers/app_assets.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteBanner extends StatelessWidget {
  const InviteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD6F5FF),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20.w,
            bottom: -20.h,
            child: CircleAvatar(
              radius: 60.r,
              backgroundColor: AppColors.white.withValues(alpha: 0.2),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).inviteFriends,
                        style: AppTextStyles.font18BlackBold.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        S.of(context).get20ForTicket,
                        style: AppTextStyles.font14GreyMedium.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.greyDark,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00F0FF), // Bright cyan button
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                        ),
                        child: Text(
                          S.of(context).invite,
                          style: AppTextStyles.font14PrimaryMedium.copyWith(
                            color: AppColors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
           
        
              ],
            ),
          ),
             
           Positioned(
            right: -10.w,
            bottom: -30.h,
            child: Image.asset(Assets.imagesPngGift, width: 220.w,))
        ],
      ),
    );
  }


}
