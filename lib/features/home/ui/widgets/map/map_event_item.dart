import 'package:event_hup/features/event/data/event_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapEventItem {
  final EventMockData event;
  final LatLng point;
  final IconData icon;
  final Color color;

  MapEventItem({
    required this.event,
    required this.point,
    required this.icon,
    required this.color,
  });
}

class MapEventsList {
  static List<MapEventItem> get() {
    return [
      MapEventItem(
        event: EventMockDataLists.upcomingEvents[1],
        point: const LatLng(40.715, -74.008),
        icon: Icons.sports_basketball,
        color: const Color(0xFFED6A5E),
      ),
      MapEventItem(
        event: EventMockDataLists.upcomingEvents[0],
        point: const LatLng(40.718, -74.003),
        icon: Icons.restaurant,
        color: const Color(0xFF61C554),
      ),
      MapEventItem(
        event: EventMockDataLists.upcomingEvents[2],
        point: const LatLng(40.711, -74.012),
        icon: Icons.music_note,
        color: const Color(0xFF5669FF),
      ),
      MapEventItem(
        event: EventMockDataLists.upcomingEvents[3],
        point: const LatLng(40.713, -74.001),
        icon: Icons.palette,
        color: const Color(0xFF46CDFB),
      ),
    ];
  }
}
