import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../game/state/game_state.dart';

class SaveManager {
  static const String _saveKey = 'game_save_data';

  Future<void> saveGame(GameState gameState) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(gameState.toJson());
    await prefs.setString(_saveKey, jsonString);
  }

  Future<GameState?> loadGame() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_saveKey);

    if (jsonString != null) {
      try {
        final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        return GameState.fromJson(jsonMap);
      } catch (e) {
        // Handle corruption or version mismatch
        // print('Error loading save game: $e');
        return null;
      }
    }
    return null;
  }

  Future<bool> hasSaveGame() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_saveKey);
  }

  Future<void> clearSave() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_saveKey);
  }
}
