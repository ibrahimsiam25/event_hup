import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_hup/core/di/dependency_injection.dart';
import 'package:event_hup/features/auth/ui/views/sign_in_view.dart';
import 'package:event_hup/features/auth/ui/views/sign_up_view.dart';
import 'package:event_hup/features/event/ui/view/event_details_view.dart';
import 'package:event_hup/features/event/ui/view/search_view.dart';
import 'package:event_hup/features/home/ui/views/bottom_nav_bar_view.dart';
import 'package:event_hup/features/onboarding/ui/view/onboarding_view.dart';
import 'package:event_hup/features/event/ui/view/organizer_profile_view.dart';
import 'package:event_hup/features/event/logic/cubit/event_details_cubit.dart';
import 'package:event_hup/features/event/logic/cubit/search_cubit.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

class RoutesList {
  static CustomTransitionPage _buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.05, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            )),
            child: child,
          ),
        );
      },
    );
  }

  static final List<RouteBase> all = [
    GoRoute(
      path: OnboardingView.routerPath,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const OnboardingView(),
      ),
    ),
    GoRoute(
      path: SignInView.routerPath,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: SignUpView.routerPath,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: EventDetailsView.routerPath,
      pageBuilder: (context, state) {
        final eventId = state.pathParameters['eventId'] ?? '';
        return _buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (_) => getIt<EventDetailsCubit>()..load(eventId),
            child: EventDetailsView(eventId: eventId),
          ),
        );
      },
    ),
    GoRoute(
      path: BottomNavBarView.routerPath,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const BottomNavBarView(),
      ),
    ),
    GoRoute(
      path: OrganizerProfileView.routerPath,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const OrganizerProfileView(),
      ),
    ),
    GoRoute(
      path: SearchView.routerPath,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (_) => getIt<SearchCubit>()..loadInitial(),
          child: const SearchView(),
        ),
      ),
    ),
  ];
}
