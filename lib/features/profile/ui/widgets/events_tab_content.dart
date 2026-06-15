import 'package:event_hup/features/event/ui/widgets/event_list_tile.dart';
import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsTabContent extends StatelessWidget {
  const EventsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventEntity> events = [
      EventEntity(
        id: '1',
        title: 'A virtual evening of smooth jazz',
        imageUrl: 'https://images.unsplash.com/photo-1511192336575-5a79af67a629?q=80&w=400',
        dateTime: DateTime(2021, 5, 1),
        dateLabel: '1st May',
        timeLabel: '1st May- Sat -2:00 PM',
        venue: 'Central Park',
        address: 'Central Park, New York',
        locationLabel: 'Central Park, New York',
        organizer: 'David Silbia',
        organizerImageUrl: '',
        description: '',
        category: 'Music',
        minPrice: 0,
        maxPrice: 0,
        currency: 'USD',
        priceLabel: 'Free',
        hasPrice: false,
        latitude: 0,
        longitude: 0,
        distance: 0,
        distanceLabel: '',
        ticketUrl: '',
      ),
      EventEntity(
        id: '2',
        title: "Jo malone london's mother's day",
        imageUrl: 'https://images.unsplash.com/photo-1506157786151-b8491531f063?q=80&w=400',
        dateTime: DateTime(2021, 5, 1),
        dateLabel: '1st May',
        timeLabel: '1st May- Sat -2:00 PM',
        venue: 'Radius Gallery',
        address: 'Radius Gallery London, UK',
        locationLabel: 'Radius Gallery London, UK',
        organizer: 'David Silbia',
        organizerImageUrl: '',
        description: '',
        category: 'Art',
        minPrice: 0,
        maxPrice: 0,
        currency: 'USD',
        priceLabel: 'Free',
        hasPrice: false,
        latitude: 0,
        longitude: 0,
        distance: 0,
        distanceLabel: '',
        ticketUrl: '',
      ),
      EventEntity(
        id: '3',
        title: 'Women\'s leadership conference',
        imageUrl: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?q=80&w=400',
        dateTime: DateTime(2021, 5, 1),
        dateLabel: '1st May',
        timeLabel: '1st May- Sat -2:00 PM',
        venue: 'Convention Center',
        address: 'Convention Center New York, USA',
        locationLabel: 'Convention Center New York, USA',
        organizer: 'David Silbia',
        organizerImageUrl: '',
        description: '',
        category: 'Business',
        minPrice: 0,
        maxPrice: 0,
        currency: 'USD',
        priceLabel: 'Free',
        hasPrice: false,
        latitude: 0,
        longitude: 0,
        distance: 0,
        distanceLabel: '',
        ticketUrl: '',
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
