import 'package:flutter/foundation.dart';

class GameState extends ChangeNotifier {
  static final GameState _instance = GameState._internal();

  factory GameState() {
    return _instance;
  }

  GameState._internal();

  // Inventory
  final List<String> _inventory = [];
  List<String> get inventory => List.unmodifiable(_inventory);

  // Flags
  final Map<String, bool> _flags = {};
  bool getFlag(String key) => _flags[key] ?? false;
  void setFlag(String key, bool value) {
    _flags[key] = value;
    notifyListeners();
  }

  // Scene Management
  String _currentSceneId = 'start';
  String get currentSceneId => _currentSceneId;

  void addItem(String item) {
    _inventory.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _inventory.remove(item);
    notifyListeners();
  }

  void changeScene(String sceneId) {
    _currentSceneId = sceneId;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'inventory': _inventory,
      'flags': _flags,
      'currentSceneId': _currentSceneId,
    };
  }

  static GameState fromJson(Map<String, dynamic> json) {
    final state = GameState();
    state._inventory.clear();
    state._inventory.addAll(List<String>.from(json['inventory'] ?? []));

    state._flags.clear();
    state._flags.addAll(Map<String, bool>.from(json['flags'] ?? {}));

    state._currentSceneId = json['currentSceneId'] ?? 'start';
    return state;
  }
}
