

import 'package:event_hup/features/auth/ui/views/sign_in_view.dart';
import 'package:event_hup/features/auth/ui/views/sign_up_view.dart';
import 'package:event_hup/features/onboarding/ui/view/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class RoutesList {
  static final List<RouteBase> all = [
    GoRoute(
      path: OnboardingView.routerPath,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: SignInView.routerPath,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: SignUpView.routerPath,
      builder: (context, state) => const SignUpView(),
    ),
  ];
}
