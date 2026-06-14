import 'package:event_hup/features/event/ui/widgets/event_list_tile.dart';
import 'package:event_hup/features/event/data/event_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsTabContent extends StatelessWidget {
  const EventsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventMockData> events = [
      EventMockData(
        title: 'A virtual evening of smooth jazz',
        image: 'https://images.unsplash.com/photo-1511192336575-5a79af67a629?q=80&w=400',
        date: '1',
        month: 'MAY',
        address: 'Central Park, New York',
        time: '1st May- Sat -2:00 PM',
      ),
      EventMockData(
        title: "Jo malone london's mother's day",
        image: 'https://images.unsplash.com/photo-1506157786151-b8491531f063?q=80&w=400',
        date: '1',
        month: 'MAY',
        address: 'Radius Gallery London, UK',
        time: '1st May- Sat -2:00 PM',
      ),
      EventMockData(
        title: 'Women\'s leadership conference',
        image: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?q=80&w=400',
        date: '1',
        month: 'MAY',
        address: 'Convention Center New York, USA',
        time: '1st May- Sat -2:00 PM',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(24.w),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          child: EventListTile(event: events[index]),
        );
      },
    );
  }
}
