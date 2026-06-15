import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../entities/event_entity.dart';

part 'event_dto.freezed.dart';

@freezed
class EventDto with _$EventDto {
  const factory EventDto({
    @Default('') String id,
    @Default('') String name,
    @Default('') String ticketUrl,
    @Default('') String imageUrl,
    @Default('') String localDate,
    @Default('') String localTime,
    @Default('') String venue,
    @Default('') String city,
    @Default('') String address,
    @Default('') String organizer,
    @Default('') String organizerImageUrl,
    @Default('') String info,
    @Default('') String pleaseNote,
    @Default('') String category,
    @Default(0.0) double minPrice,
    @Default(0.0) double maxPrice,
    @Default('') String currency,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
    @Default(0.0) double distance,
  }) = _EventDto;

  const EventDto._();

  factory EventDto.fromJson(Map<String, dynamic> json) {
    final dates = json['dates'] as Map<String, dynamic>?;
    final start = dates?['start'] as Map<String, dynamic>?;
    final embedded = json['_embedded'] as Map<String, dynamic>?;
    final venues = embedded?['venues'] as List<dynamic>?;
    final venueJson = venues?.whereType<Map<String, dynamic>>().firstOrNull;
    final cityJson = venueJson?['city'] as Map<String, dynamic>?;
    final addressJson = venueJson?['address'] as Map<String, dynamic>?;
    final location = venueJson?['location'] as Map<String, dynamic>?;
    final attractions = embedded?['attractions'] as List<dynamic>?;
    final attraction = attractions
        ?.whereType<Map<String, dynamic>>()
        .firstOrNull;
    final classifications = json['classifications'] as List<dynamic>?;
    final classification = classifications
        ?.whereType<Map<String, dynamic>>()
        .firstOrNull;
    final segment = classification?['segment'] as Map<String, dynamic>?;
    final images = _sortedImages(json['images']);
    final attractionImages = _sortedImages(attraction?['images']);
    final priceRanges = json['priceRanges'] as List<dynamic>?;
    final price = priceRanges?.whereType<Map<String, dynamic>>().firstOrNull;

    return EventDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      ticketUrl: json['url'] as String? ?? '',
      imageUrl: images.firstOrNull?['url'] as String? ?? '',
      localDate: start?['localDate'] as String? ?? '',
      localTime: start?['localTime'] as String? ?? '',
      venue: venueJson?['name'] as String? ?? '',
      city: cityJson?['name'] as String? ?? '',
      address: addressJson?['line1'] as String? ?? '',
      organizer: attraction?['name'] as String? ?? '',
      organizerImageUrl: attractionImages.firstOrNull?['url'] as String? ?? '',
      info: json['info'] as String? ?? '',
      pleaseNote: json['pleaseNote'] as String? ?? '',
      category: segment?['name'] as String? ?? '',
      minPrice: (price?['min'] as num?)?.toDouble() ?? 0.0,
      maxPrice: (price?['max'] as num?)?.toDouble() ?? 0.0,
      currency: price?['currency'] as String? ?? '',
      latitude: double.tryParse(location?['latitude'] as String? ?? '') ?? 0.0,
      longitude: double.tryParse(location?['longitude'] as String? ?? '') ?? 0.0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  EventEntity toEntity() {
    final parsedDate =
        DateTime.tryParse(localDate) ??
        DateTime.fromMillisecondsSinceEpoch(0);
    final parsedTime = _parseTime(localTime);
    final eventDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime?.hour ?? 0,
      parsedTime?.minute ?? 0,
    );
    final hasKnownDate = localDate.isNotEmpty;
    final hasKnownPrice = minPrice > 0 || maxPrice > 0;
    final safeMinPrice = minPrice > 0 ? minPrice : maxPrice;
    final safeMaxPrice = maxPrice > 0 ? maxPrice : minPrice;
    final safeCurrency = currency.trim().isNotEmpty ? currency.trim() : 'USD';
    final locationParts = [
      venue,
      address,
      city,
    ].where((value) => value.trim().isNotEmpty);
    final descriptionParts = [
      info,
      pleaseNote,
    ].where((value) => value.trim().isNotEmpty);

    return EventEntity(
      id: id.trim().isNotEmpty ? id.trim() : 'unknown-event',
      title: name.trim().isNotEmpty ? name.trim() : 'Untitled event',
      imageUrl: imageUrl,
      dateTime: eventDateTime,
      dateLabel: hasKnownDate
          ? DateFormat('d MMMM, y').format(eventDateTime)
          : 'Date to be announced',
      timeLabel: parsedTime == null
          ? 'Time to be announced'
          : DateFormat('EEEE, h:mm a').format(eventDateTime),
      venue: venue.trim().isNotEmpty
          ? venue.trim()
          : 'Venue to be announced',
      address: address.trim().isNotEmpty
          ? address.trim()
          : 'Address to be announced',
      locationLabel: locationParts.isEmpty
          ? 'Location to be announced'
          : locationParts.join(', '),
      organizer: organizer.trim().isNotEmpty
          ? organizer.trim()
          : 'Ticketmaster Event',
      organizerImageUrl: organizerImageUrl,
      description: descriptionParts.isEmpty
          ? 'No additional event information is available.'
          : descriptionParts.join('\n\n'),
      category: category.trim().isNotEmpty
          ? category.trim()
          : 'Event',
      minPrice: safeMinPrice,
      maxPrice: safeMaxPrice,
      currency: safeCurrency,
      priceLabel: hasKnownPrice
          ? _priceLabel(safeMinPrice, safeMaxPrice, safeCurrency)
          : 'See ticket options',
      hasPrice: hasKnownPrice,
      latitude: latitude,
      longitude: longitude,
      distance: distance,
      distanceLabel: distance > 0
          ? '${distance.toStringAsFixed(1)} km away'
          : '',
      ticketUrl: ticketUrl,
    );
  }

  static List<Map<String, dynamic>> _sortedImages(Object? value) {
    final images =
        (value as List<dynamic>?)?.whereType<Map<String, dynamic>>().toList() ??
        [];
    images.sort(
      (a, b) =>
          ((b['width'] as num?) ?? 0).compareTo((a['width'] as num?) ?? 0),
    );
    return images;
  }

  static DateTime? _parseTime(String value) {
    if (value.isEmpty) return null;
    return DateTime.tryParse('2000-01-01T$value');
  }

  static String _priceLabel(double min, double max, String currency) {
    final format = NumberFormat.currency(
      name: currency,
      symbol: currency == 'USD' ? '\$' : '$currency ',
      decimalDigits: 0,
    );
    if (min == max) return format.format(min);
    return '${format.format(min)} - ${format.format(max)}';
  }
}
