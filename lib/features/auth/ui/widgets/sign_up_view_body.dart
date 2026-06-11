import 'package:event_hup/core/helpers/app_assets.dart';
import 'package:event_hup/core/helpers/validators_regex.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_button.dart';
import 'package:event_hup/core/widgets/custom_text_field.dart';
import 'package:event_hup/features/auth/ui/widgets/social_button.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            SizedBox(height: 10.h),

            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              alignment: Alignment.centerLeft,
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.darkText,
                size: 24.sp,
              ),
            ),
            SizedBox(height: 20.h),

            Text(
              localization.signUp,
              style: AppTextStyles.font18BlackBold.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),

            CustomTextField(
              controller: _nameController,
              hintText: localization.fullNameHint,
              prefixIcon: Icons.person_outline_rounded,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return localization.fullNameRequired;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),

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
                if (!ValidatorsRegex.isPasswordValid(value)) {
                  return localization.invalidPassword;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),

            CustomTextField(
              controller: _confirmPasswordController,
              hintText: localization.confirmPasswordHint,
              prefixIcon: Icons.lock_outline_rounded,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return localization.confirmPasswordRequired;
                }
                if (value != _passwordController.text) {
                  return localization.passwordsDoNotMatch;
                }
                return null;
              },
            ),
            SizedBox(height: 30.h),

            CustomButton(
              text: localization.signUpButton,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Perform Sign Up
                }
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
                    '${localization.alreadyHaveAccount} ',
                    style: AppTextStyles.font15BlackRegular.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.darkText,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(
                      localization.signInAction,
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
