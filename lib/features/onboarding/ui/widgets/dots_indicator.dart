import 'package:event_hup/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;
  const DotsIndicator({super.key, required this.currentIndex, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        final isActive = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.only(right: 8),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.dotActive : AppColors.dotInactive,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
