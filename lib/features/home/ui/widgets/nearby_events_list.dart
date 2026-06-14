import 'package:event_hup/features/event/ui/widgets/event_card.dart';
import 'package:event_hup/features/event/ui/widgets/event_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyEventsList extends StatelessWidget {
  const NearbyEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventMockData> events = [
      EventMockData(
        title: 'Food & Wine Festival',
        image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=400',
        date: '18',
        month: 'JUNE',
        address: 'Central Park, New York',
      ),
      EventMockData(
        title: 'Summer Sports Championship',
        image: 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?q=80&w=400',
        date: '22',
        month: 'JUNE',
        address: 'MetLife Stadium, NJ',
      ),
      EventMockData(
        title: 'Jazz Music Under the Stars',
        image: 'https://images.unsplash.com/photo-1511192336575-5a79af67a629?q=80&w=400',
        date: '25',
        month: 'JUNE',
        address: 'Broadway Theatre, NY',
      ),
    ];

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
