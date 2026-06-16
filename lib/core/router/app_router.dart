import 'package:event_hup/core/helpers/logger.dart';
import 'package:event_hup/core/router/routes_list.dart';
import 'package:event_hup/features/home/ui/views/bottom_nav_bar_view.dart';
import 'package:event_hup/features/onboarding/ui/view/onboarding_view.dart';
import 'package:event_hup/features/auth/ui/views/sign_in_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter? _router;

  static GoRouter getRouter({
    required bool isNotFirstLogin,
    required bool hasSession,
  }) {
    if (_router != null) return _router!;

    _router = GoRouter(
      initialLocation: getInitialLocation(isNotFirstLogin, hasSession),
      routes: RoutesList.all,
    );

    return _router!;
  }

  static String getInitialLocation(bool isNotFirstLogin, bool hasSession) {
    AppLogger.logData(
      'isNotFirstLogin: $isNotFirstLogin, hasSession: $hasSession',
    );
    
    if (!isNotFirstLogin) {
      return OnboardingView.routerPath;
    } else if (hasSession) {
      return BottomNavBarView.routerPath;
    } else {
      return SignInView.routerPath;
    }
  }
}
