import 'package:event_hup/features/event/ui/widgets/event_card.dart';
import 'package:event_hup/features/home/data/entities/home_event_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingEventsList extends StatelessWidget {
  final List<HomeEventEntity> events;

  const UpcomingEventsList({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(event: events[index]);
        },
      ),
    );
  }
}
