import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/onboarding/model/onboarding_model.dart';
import 'package:event_hup/features/onboarding/ui/widgets/phone_mockup.dart';
import 'package:event_hup/features/onboarding/ui/widgets/title_section.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel page;
  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          bottom: 290,
          child: Center(
            child: PhoneMockup(imagePath: page.imagePath),
          ),
        ),
    
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 330,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            padding: const EdgeInsets.only(
              top: 40,
              left: 36,
              right: 36,
            ),
            child: TitleSection(
              title: page.title,
              description: page.description,
            ),
          ),
        ),
      ],
    );
  }
}
