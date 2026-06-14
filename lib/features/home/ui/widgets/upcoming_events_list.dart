import 'package:event_hup/features/event/ui/widgets/event_card.dart';
import 'package:event_hup/features/event/data/event_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingEventsList extends StatelessWidget {
  const UpcomingEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventMockData> events = [
      EventMockData(
        title: 'International Band Music Concert',
        image: 'https://images.unsplash.com/photo-1506157786151-b8491531f063?q=80&w=400',
        date: '10',
        month: 'JUNE',
        address: '36 Guild Street London, UK',
      ),
      EventMockData(
        title: "Jo Malone London's Mother's Day Concert",
        image: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?q=80&w=400',
        date: '12',
        month: 'JUNE',
        address: 'Radius Gallery London, UK',
      ),
      EventMockData(
        title: 'Gala Art Exhibition & Gallery Day',
        image: 'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?q=80&w=400',
        date: '15',
        month: 'JUNE',
        address: 'Convention Center New York, USA',
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
