import 'package:event_hup/core/di/dependency_injection.dart';
import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/home/logic/cubit/home_cubit.dart';
import 'package:event_hup/features/home/ui/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: BlocProvider(
        create: (context) => getIt<HomeCubit>()..load(),
        child: const HomeViewBody(),
      ),
    );
  }
}
