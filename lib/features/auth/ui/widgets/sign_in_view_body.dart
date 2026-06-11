import 'package:event_hup/core/helpers/app_assets.dart';
import 'package:event_hup/core/helpers/validators_regex.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/auth/ui/views/sign_up_view.dart';
import 'package:event_hup/core/widgets/custom_button.dart';
import 'package:event_hup/core/widgets/custom_text_field.dart';
import 'package:event_hup/features/auth/ui/widgets/social_button.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Column(
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
              ),
            ),
            SizedBox(height: 30.h),

            Text(
              localization.signIn,
              style: AppTextStyles.font18BlackBold.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),

            CustomTextField(
              controller: _emailController,
              hintText: localization.emailHint,
              prefixIcon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return localization.emailRequired;
                }
                if (!ValidatorsRegex.isEmailValid(value)) {
                  return localization.invalidEmail;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),

            CustomTextField(
              controller: _passwordController,
              hintText: localization.passwordHint,
              prefixIcon: Icons.lock_outline_rounded,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return localization.passwordRequired;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        value: _rememberMe,
                        activeThumbColor: AppColors.primary,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      localization.rememberMe,
                      style: AppTextStyles.font15BlackRegular.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkText,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    localization.forgotPassword,
                    style: AppTextStyles.font14PrimaryMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkText,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),

            CustomButton(
              text: localization.signInButton,
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
            SizedBox(height: 24.h),

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
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
