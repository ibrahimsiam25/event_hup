import 'package:event_hup/features/event/ui/widgets/event_app_bar.dart';
import 'package:event_hup/features/event/ui/widgets/events_list.dart';
import 'package:event_hup/features/event/ui/widgets/events_tabs.dart';
import 'package:event_hup/features/event/data/entities/event_query.dart';
import 'package:event_hup/features/event/logic/cubit/events_list_cubit.dart';
import 'package:event_hup/core/widgets/custom_empty_state.dart';
import 'package:event_hup/core/widgets/custom_error_state.dart';
import 'package:event_hup/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/themes/app_colors.dart';



class EventsView extends StatelessWidget {
  const EventsView({super.key});

  static const routerPath = "/eventsView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<EventsListCubit>(param1: EventListMode.upcoming)..load(),
      child: const _EventsViewScaffold(),
    );
  }
}
class _EventsViewScaffold extends StatefulWidget {
  const _EventsViewScaffold();

  @override
  State<_EventsViewScaffold> createState() => _EventsViewScaffoldState();
}

class _EventsViewScaffoldState extends State<_EventsViewScaffold> {
  EventListMode selectedTab = EventListMode.upcoming;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      context.read<EventsListCubit>().load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const EventAppBar(),
      body: Column(
        children: [
          SizedBox(height: 12.h),

          EventsTabs(
            selectedTab: selectedTab,
            onChanged: (tab) {
              setState(() => selectedTab = tab);

              context.read<EventsListCubit>().changeMode(tab);
            },
          ),

          SizedBox(height: 24.h),

          Expanded(
            child: EventsViewBody(
              scrollController: _scrollController,
              selectedTab: selectedTab,
            ),
          ),
        ],
      ),
    );
  }
}
class EventsViewBody extends StatelessWidget {
  const EventsViewBody({
    super.key,
    required this.scrollController,
    required this.selectedTab,
  });

  final ScrollController scrollController;
  final EventListMode selectedTab;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsListCubit, EventsListState>(
  builder: (context, state) {

  
    if (state.status == ListStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.status == ListStatus.failure &&
        state.events.isEmpty) {
      return CustomErrorState(
        errorMessage: state.errorMessage,
        onRetry: () =>
            context.read<EventsListCubit>().load(refresh: true),
      );
    }


if (state.status == ListStatus.success && state.events.isEmpty) {

      return CustomEmptyState(
        title: selectedTab == EventListMode.upcoming
            ? S.of(context).noUpcomingEvent
            : S.of(context).noPastEvent,
        message: S.of(context).noUpcomingEventDescription,
      );
    }

 
    return RefreshIndicator(
      onRefresh: () =>
          context.read<EventsListCubit>().load(refresh: true),
      child: EventsList(
        events: state.events,
        scrollController: scrollController,
        isLoadingMore: state.isLoadingMore,
      ),
    );
  },
);
  }
}