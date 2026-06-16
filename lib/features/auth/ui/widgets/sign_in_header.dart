import 'package:event_hup/core/helpers/app_assets.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      children: [
        Image.asset(
          Assets.imagesPngLogo,
          height: 56.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 12.h),
        Text(
          localization.eventHub,
          style: AppTextStyles.font18BlackBold.copyWith(
            fontSize: 35.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }
}
