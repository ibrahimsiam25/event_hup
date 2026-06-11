

import 'package:event_hup/features/onboarding/ui/view/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class RoutesList {
  static final List<RouteBase> all = [
    GoRoute(
      path: OnboardingView.routerPath,
      builder: (context, state) => const OnboardingView(),
    ),
  
  ];
}
