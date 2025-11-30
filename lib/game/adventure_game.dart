import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Route;
import 'scenes/base_scene.dart';
import 'scenes/world_scene.dart';
import 'state/game_state.dart';

class AdventureGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  late final RouterComponent router;

  @override
  Color backgroundColor() => const Color(0xFF000000);

  @override
  Future<void> onLoad() async {
    // Initialize Game State
    GameState();

    // Setup Router for Scene Management
    router = RouterComponent(
      initialRoute: 'world',
      routes: {'start': Route(BaseScene.new), 'world': Route(WorldScene.new)},
    );
    add(router);
  }
}
