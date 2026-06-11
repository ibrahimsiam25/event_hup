import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/auth/ui/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routerPath = '/signUp';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SignUpViewBody(),
      ),
    );
  }
}
