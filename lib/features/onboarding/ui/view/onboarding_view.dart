import 'package:event_hup/core/themes/app_colors.dart';
import 'package:event_hup/features/onboarding/ui/widgets/bottom_bar.dart';
import 'package:event_hup/features/onboarding/ui/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import '../../model/onboarding_model.dart';

import 'package:event_hup/core/helpers/app_constants.dart';
import 'package:event_hup/core/helpers/shared_pref_helper.dart';
import 'package:event_hup/features/auth/ui/views/sign_in_view.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  static const  routerPath = '/onboarding';
  @override
  State<OnboardingView> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _completeOnboarding() {
    SharedPrefHelper.setData(AppConstants.prefsIsNotFirstLogin, true);
    context.go(SignInView.routerPath);
  }

  void _onNext() {
    if (_currentIndex < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _onSkip() {
    _completeOnboarding();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
             
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (_, index) =>
                  OnboardingPage(page: onboardingPages[index]),
            ),
        
        
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomBar(
                currentIndex: _currentIndex,
                total: onboardingPages.length,
                onNext: _onNext,
                onSkip: _onSkip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
