import 'package:event_hup/core/di/dependency_injection.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/auth/logic/login/login_cubit.dart';
import 'package:event_hup/features/auth/ui/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routerPath = '/signIn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<LoginCubit>()..loadRememberedUsers(),
          child: const SignInViewBody(),
        ),
      ),
    );
  }
}
