import 'dart:async';
import 'dart:convert';
import 'package:event_hup/features/event/data/entities/event_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _keyFavorites = 'favorite_events_data';

  static final _favoritesController = StreamController<List<EventEntity>>.broadcast();

  static Stream<List<EventEntity>> get favoritesStream => _favoritesController.stream;

  static Future<List<EventEntity>> getFavoriteEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoritesJson = prefs.getStringList(_keyFavorites) ?? [];
    return favoritesJson.map((jsonStr) => EventEntity.fromJson(jsonDecode(jsonStr))).toList();
  }

  static Future<bool> isFavorite(String eventId) async {
    final events = await getFavoriteEvents();
    return events.any((e) => e.id == eventId);
  }

  static Future<void> toggleFavorite(EventEntity event) async {
    final prefs = await SharedPreferences.getInstance();
    final events = await getFavoriteEvents();
    
    if (events.any((e) => e.id == event.id)) {
      events.removeWhere((e) => e.id == event.id);
    } else {
      events.add(event);
    }
    
    final List<String> favoritesJson = events.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_keyFavorites, favoritesJson);
    
    _favoritesController.add(events);
  }
}
