import 'package:event_hup/features/event/ui/widgets/event_list_tile.dart';
import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsList extends StatelessWidget {
  final List<EventEntity> events;
  final ScrollController? scrollController;
  final bool isLoadingMore;

  const EventsList({
    super.key,
    required this.events,
    this.scrollController,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      itemCount: events.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == events.length) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: EventListTile(event: events[index]),
        );
      },
    );
  }
}
