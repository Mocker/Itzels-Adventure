import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'scenes/base_scene.dart';
import 'state/game_state.dart';

class AdventureGame extends FlameGame {
  late final RouterComponent router;

  @override
  Color backgroundColor() => const Color(0xFF000000);

  @override
  Future<void> onLoad() async {
    // Initialize Game State
    GameState();

    // Setup Router for Scene Management
    router = RouterComponent(
      initialRoute: 'start',
      routes: {'start': Route(BaseScene.new)},
    );
    add(router);
  }
}
