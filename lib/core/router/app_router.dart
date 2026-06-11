
import 'package:event_hup/core/helpers/logger.dart';
import 'package:event_hup/core/router/routes_list.dart';
import 'package:event_hup/features/onboarding/ui/view/onboarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {


  static GoRouter? _router;

  static GoRouter getRouter({
    required bool isNotFirstLogin,
    required String token,
  }) {
  
    if (_router != null) return _router!;

    _router = GoRouter(

      initialLocation: getInitialLocation(isNotFirstLogin, token),
      routes: RoutesList.all,
    );

    return _router!;
  }

  static String getInitialLocation(bool isNotFirstLogin, String token) {
    AppLogger.logData(
      'isNotFirstLogin: $isNotFirstLogin, token: ${token.isNotEmpty}',
    );
    return OnboardingView.routerPath;
  }
}
