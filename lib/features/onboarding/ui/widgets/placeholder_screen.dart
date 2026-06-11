import 'package:event_hup/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEFF),
      child: const Center(
        child: Icon(Icons.event, size: 40, color: AppColors.primary),
      ),
    );
  }
}
