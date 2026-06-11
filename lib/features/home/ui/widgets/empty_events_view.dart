import 'package:event_hup/core/helpers/app_assets.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_button.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyEventsView extends StatelessWidget {
  const EmptyEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),

            Image.asset(
              Assets.imagesPngNoUpcomingEvent,
              width: 220.w,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 32.h),

            Text(
              S.of(context).noUpcomingEvent,
              textAlign: TextAlign.center,
              style: AppTextStyles.font18BlackBold.copyWith(
                fontSize: 24.sp,
              ),
            ),

            SizedBox(height: 16.h),

            Text(
              S.of(context).noUpcomingEventDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.font15BlackRegular.copyWith(
                color: AppColors.greyDark,
                fontSize: 16.sp,
                height: 1.6,
              ),
            ),

            Spacer(),

            CustomButton(
              text: S.of(context).exploreEvents,
              onPressed: () {},
            ),
             SizedBox(height: 33.h),
          ],
        ),
      ),
    );
  }
}