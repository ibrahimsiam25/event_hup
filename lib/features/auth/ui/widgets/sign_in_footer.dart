import 'package:event_hup/core/helpers/app_assets.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/auth/ui/views/sign_up_view.dart';
import 'package:event_hup/features/auth/ui/widgets/social_button.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      children: [
        Center(
          child: Text(
            localization.or.toUpperCase(),
            style: AppTextStyles.font12GreyRegular.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.greyDivider,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SocialButton(
          iconPath: Assets.imagesPngGoogle,
          text: localization.loginWithGoogle,
          onPressed: () {},
        ),
        SizedBox(height: 16.h),
        SocialButton(
          iconPath: Assets.imagesPngFacebook,
          text: localization.loginWithFacebook,
          onPressed: () {},
        ),
        SizedBox(height: 24.h),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${localization.dontHaveAccount} ',
                style: AppTextStyles.font15BlackRegular.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.darkText,
                ),
              ),
              InkWell(
                onTap: () {
                  context.push(SignUpView.routerPath);
                },
                child: Text(
                  localization.signUp,
                  style: AppTextStyles.font14PrimaryMedium.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
