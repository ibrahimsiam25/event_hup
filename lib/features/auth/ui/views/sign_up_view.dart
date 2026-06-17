import 'package:event_hup/core/di/dependency_injection.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/auth/logic/signup/signup_cubit.dart';
import 'package:event_hup/features/auth/ui/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routerPath = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
