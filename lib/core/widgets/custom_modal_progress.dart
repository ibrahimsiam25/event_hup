import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class CustomModalProgress extends StatelessWidget {
  const CustomModalProgress({
    super.key,
    required this.child,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          ModalBarrier(
            dismissible: false,
            color: AppColors.black.withValues(alpha: 0.3),
          ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
      ],
    );
  }
}
