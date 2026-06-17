import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_hup/core/database/database_helper.dart';

class AuthService {
  static const String _keyUserId = 'user_id';
  static const String _keyRememberedUserIds = 'remembered_user_ids';

  Future<bool> login(String email, String password, bool rememberMe) async {
    final user = await DatabaseHelper.instance.getUser(email, password);
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_keyUserId, user['id']);
      
      List<String> rememberedIds = prefs.getStringList(_keyRememberedUserIds) ?? [];
      final idStr = user['id'].toString();
      
      if (rememberMe) {
        if (!rememberedIds.contains(idStr)) {
          rememberedIds.add(idStr);
          await prefs.setStringList(_keyRememberedUserIds, rememberedIds);
        }
      } else {
        if (rememberedIds.contains(idStr)) {
          rememberedIds.remove(idStr);
          await prefs.setStringList(_keyRememberedUserIds, rememberedIds);
        }
      }
      return true;
    }
    return false;
  }

  Future<int> register(String name, String email, String password) async {
    return await DatabaseHelper.instance.createUser({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt(_keyUserId);
    if (userId != null) {
      return await DatabaseHelper.instance.getUserById(userId);
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getRememberedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final idsStr = prefs.getStringList(_keyRememberedUserIds) ?? [];
    List<Map<String, dynamic>> users = [];
    for (String idStr in idsStr) {
      final id = int.tryParse(idStr);
      if (id != null) {
        final user = await DatabaseHelper.instance.getUserById(id);
        if (user != null) {
          users.add(user);
        }
      }
    }
    return users;
  }
}
