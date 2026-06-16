import 'package:event_hup/core/helpers/validators_regex.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/core/widgets/custom_button.dart';
import 'package:event_hup/core/widgets/custom_text_field.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:event_hup/core/helpers/auth_service.dart';
import 'package:go_router/go_router.dart';

import '../../../home/ui/views/bottom_nav_bar_view.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  List<Map<String, dynamic>> _rememberedUsers = [];

  @override
  void initState() {
    super.initState();
    _loadRememberedUsers();
  }

  Future<void> _loadRememberedUsers() async {
    final users = await AuthService().getRememberedUsers();
    if (users.isNotEmpty) {
      setState(() {
        _rememberedUsers = users;
        _rememberMe = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.signIn,
            style: AppTextStyles.font18BlackBold.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.h),
          if (_rememberedUsers.isNotEmpty)
            Wrap(
              spacing: 24.w,
              runSpacing: 16.h,
              alignment: WrapAlignment.start,
              children: _rememberedUsers.map((user) {
                final userName = user['name'] as String;
                return GestureDetector(
                  onTap: () async {
                    final success = await AuthService().login(
                      user['email'],
                      user['password'],
                      true,
                    );
                    if (success && mounted) {
                      context.go(BottomNavBarView.routerPath);
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                    
                        backgroundColor: AppColors.primary,
                        child: Text(
                          userName.length >= 2 ? userName.substring(0, 2).toUpperCase() : userName.toUpperCase(),
                          style: AppTextStyles.font18BlackBold.copyWith(color: AppColors.white, fontSize: 24.sp),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        userName,
                        style: AppTextStyles.font15BlackRegular.copyWith(color: AppColors.darkText),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          if (_rememberedUsers.isNotEmpty) SizedBox(height: 20.h),
          CustomTextField(
            controller: _emailController,
            hintText: localization.emailHint,
            prefixIcon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) return localization.emailRequired;
              if (!ValidatorsRegex.isEmailValid(value)) return localization.invalidEmail;
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
              if (value == null || value.isEmpty) return localization.passwordRequired;
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
                      onChanged: (value) => setState(() => _rememberMe = value),
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final success = await AuthService().login(
                  _emailController.text,
                  _passwordController.text,
                  _rememberMe,
                );
                if (success) {
                  if (mounted) context.go(BottomNavBarView.routerPath);
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid email or password')),
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
