import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_hup/core/di/dependency_injection.dart';
import 'package:event_hup/features/auth/ui/views/sign_in_view.dart';
import 'package:event_hup/features/auth/ui/views/sign_up_view.dart';
import 'package:event_hup/features/event/ui/view/event_details_view.dart';
import 'package:event_hup/features/event/ui/view/events_view.dart';
import 'package:event_hup/features/event/ui/view/search_view.dart';
import 'package:event_hup/features/home/ui/views/bottom_nav_bar_view.dart';
import 'package:event_hup/features/onboarding/ui/view/onboarding_view.dart';
import 'package:event_hup/features/event/ui/view/organizer_profile_view.dart';
import 'package:event_hup/features/event/data/entities/event_query.dart';
import 'package:event_hup/features/event/logic/cubit/events_list_cubit.dart';
import 'package:event_hup/features/event/logic/cubit/event_details_cubit.dart';
import 'package:event_hup/features/event/logic/cubit/search_cubit.dart';
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
    GoRoute(
      path: EventDetailsView.routerPath,
      builder: (context, state) {
        final eventId = state.pathParameters['eventId'] ?? '';
        return BlocProvider(
          create: (_) => getIt<EventDetailsCubit>()..load(eventId),
          child: EventDetailsView(eventId: eventId),
        );
      },
    ),
    GoRoute(
      path: EventsView.routerPath,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<EventsListCubit>(param1: EventListMode.upcoming)..load(),
        child: const EventsView(),
      ),
    ),
    GoRoute(
      path: BottomNavBarView.routerPath,
      builder: (context, state) => const BottomNavBarView(),
    ),
    GoRoute(
      path: OrganizerProfileView.routerPath,
      builder: (context, state) => const OrganizerProfileView(),
    ),
    GoRoute(
      path: SearchView.routerPath,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<SearchCubit>()..loadInitial(),
        child: const SearchView(),
      ),
    ),
  ];
}
