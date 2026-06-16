import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:event_hup/features/event/ui/widgets/event_details_app_bar.dart';
import 'package:event_hup/features/event/ui/widgets/event_details_content.dart';
import 'package:event_hup/features/event/ui/widgets/event_details_bottom_bar.dart';
import 'package:flutter/material.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, this.event});

  final EventEntity? event;

  @override
  Widget build(BuildContext context) {
    final hasEvent = event != null;
    final eventId = hasEvent ? event!.id : '0';
    final title = hasEvent ? event!.title : 'Concert Title Loading...';
    final date = hasEvent ? event!.dateLabel : '14 December, 2021';
    final time = hasEvent ? event!.timeLabel : 'Tuesday, 4:00PM - 9:00PM';
    final venue = hasEvent ? event!.venue : 'Gala Convention Center';
    final address = hasEvent ? event!.address : '36 Guild Street London, UK';
    final description = hasEvent ? event!.description : 'Enjoy your favorite dishes and spend a lovely time...';
    final organizerName = hasEvent ? event!.organizer : 'David Silbia';
    final organizerImageUrl = hasEvent ? event!.organizerImageUrl : '';
    final imageUrl = hasEvent ? event!.imageUrl : '';
    final priceLabel = hasEvent ? event!.priceLabel : '\$120';
    final ticketUrl = hasEvent ? event!.ticketUrl : '';

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            if (hasEvent)
              EventDetailsAppBar(
                event: event!,
              ),
            EventDetailsContent(
              title: title,
              date: date,
              time: time,
              venue: venue,
              address: address,
              description: description,
              organizerName: organizerName,
              organizerImageUrl: organizerImageUrl,
            ),
          ],
        ),
        EventDetailsBottomBar(
          priceLabel: priceLabel,
          ticketUrl: ticketUrl,
        ),
      ],
    );
  }
}
