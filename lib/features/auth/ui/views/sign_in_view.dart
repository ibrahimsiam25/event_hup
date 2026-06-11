import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/auth/ui/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routerPath = '/signIn';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SignInViewBody(),
      ),
    );
  }
}
