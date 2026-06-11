import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/core/themes/app_text_styles.dart';
import 'package:event_hup/features/onboarding/ui/widgets/dots_indicator.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final int total;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.total,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: MediaQuery.of(context).padding.bottom + 16,
        top: 4,
      ),
      child: SizedBox(
        height: 34,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip
            GestureDetector(
              onTap: onSkip,
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 60,
                height: 34,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).skip,
                    style: AppTextStyles.font18WhiteMedium.copyWith(
                      color: AppColors.onboardingSkip,
                    ),
                  ),
                ),
              ),
            ),

            DotsIndicator(currentIndex: currentIndex, total: total),

            GestureDetector(
              onTap: onNext,
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 111,
                height: 34,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    S.of(context).next,
                    style: AppTextStyles.font18WhiteMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
