import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../entities/home_event_entity.dart';

part 'home_event_dto.freezed.dart';

@freezed
class HomeEventDto with _$HomeEventDto {
  const factory HomeEventDto({
    @Default('') String id,
    @Default('') String name,
    @Default('') String imageUrl,
    @Default('') String localDate,
    @Default('') String localTime,
    @Default('') String venueName,
    @Default('') String city,
    @Default('') String address,
    @Default(0.0) double distance,
  }) = _HomeEventDto;

  const HomeEventDto._();

  factory HomeEventDto.fromJson(Map<String, dynamic> json) {
    final dates = _asMap(json['dates']);
    final start = _asMap(dates?['start']);
    final embedded = _asMap(json['_embedded']);
    final venues = _asList(embedded?['venues']);
    final venue = venues.whereType<Map<String, dynamic>>().firstOrNull;
    final city = _asMap(venue?['city']);
    final address = _asMap(venue?['address']);
    final images = _asList(
      json['images'],
    ).whereType<Map<String, dynamic>>().toList();
    images.sort(
      (a, b) =>
          ((b['width'] as num?) ?? 0).compareTo((a['width'] as num?) ?? 0),
    );

    return HomeEventDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: images.firstOrNull?['url'] as String? ?? '',
      localDate: start?['localDate'] as String? ?? '',
      localTime: start?['localTime'] as String? ?? '',
      venueName: venue?['name'] as String? ?? '',
      city: city?['name'] as String? ?? '',
      address: address?['line1'] as String? ?? '',
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  HomeEventEntity toEntity() {
    final parsedDate = DateTime.tryParse(localDate);
    final dateLabel = parsedDate == null
        ? 'Date to be announced'
        : DateFormat('EEE, MMM d').format(parsedDate).toUpperCase();
    final time = _formatTime(localTime);
    final locationParts = [
      venueName,
      address,
      city,
    ].where((value) => value.trim().isNotEmpty);

    return HomeEventEntity(
      id: id.trim().isNotEmpty ? id.trim() : 'unknown-event',
      title: name.trim().isNotEmpty ? name.trim() : 'Untitled event',
      imageUrl: imageUrl,
      day: parsedDate == null ? '--' : DateFormat('dd').format(parsedDate),
      month: parsedDate == null
          ? 'TBA'
          : DateFormat('MMM').format(parsedDate).toUpperCase(),
      dateLabel: time.isEmpty ? dateLabel : '$dateLabel - $time',
      location: locationParts.isEmpty
          ? 'Location to be announced'
          : locationParts.join(', '),
      distanceLabel: distance > 0 ? '${distance.toStringAsFixed(1)} km away' : '',
    );
  }

  static String _formatTime(String value) {
    if (value.isEmpty) return '';
    final date = DateTime.tryParse('2000-01-01T$value');
    return date == null ? '' : DateFormat('h:mm a').format(date);
  }

  static Map<String, dynamic>? _asMap(Object? value) {
    return value is Map<String, dynamic> ? value : null;
  }

  static List<dynamic> _asList(Object? value) {
    return value is List<dynamic> ? value : const [];
  }
}
