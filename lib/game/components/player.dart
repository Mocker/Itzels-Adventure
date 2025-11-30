import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../adventure_game.dart';

class Player extends PositionComponent
    with HasGameReference<AdventureGame>, KeyboardHandler {
  final double speed = 200.0;
  final Vector2 velocity = Vector2.zero();

  Player({super.position})
    : super(size: Vector2.all(32), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    // Placeholder: Red square
    add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFFFF0000),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(velocity * dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    velocity.setZero();
    if (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      velocity.y = -speed;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      velocity.y = speed;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      velocity.x = -speed;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      velocity.x = speed;
    }

    return true;
  }
}
