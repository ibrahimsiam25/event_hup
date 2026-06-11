import 'package:event_hup/features/home/ui/widgets/empty_events_view.dart';
import 'package:event_hup/features/home/ui/widgets/event_app_bar.dart';
import 'package:event_hup/features/home/ui/widgets/events_list.dart';
import 'package:event_hup/features/home/ui/widgets/events_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';

enum EventsTab {
  upcoming,
  past,
}
class EventsView extends StatefulWidget {
  const EventsView({super.key});

  static const routerPath = "/eventsView";

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  EventsTab selectedTab = EventsTab.upcoming;

  @override
  Widget build(BuildContext context) {
    final upcomingEvents = <dynamic>[];
    final pastEvents = <dynamic>[];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: EventAppBar(),
      body: Column(
        children: [
          SizedBox(height: 12.h),

          EventsTabs(
            selectedTab: selectedTab,
            onChanged: (tab) {
              setState(() {
                selectedTab = tab;
              });
            },
          ),

          SizedBox(height: 24.h),

          Expanded(
            child: selectedTab == EventsTab.upcoming
                ? (upcomingEvents.isEmpty
                    ? const EmptyEventsView()
                    : EventsList(events: upcomingEvents))
                : (pastEvents.isEmpty
                    ? const EmptyEventsView()
                    : EventsList(events: pastEvents)),
          ),
        ],
      ),
    );
  }
}
