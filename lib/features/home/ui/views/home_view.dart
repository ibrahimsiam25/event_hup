import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/home/ui/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: const HomeViewBody(),
    );
  }
}
