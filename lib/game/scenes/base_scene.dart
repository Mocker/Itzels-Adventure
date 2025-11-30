import 'package:flame/components.dart';

import 'package:flutter/material.dart';

import '../adventure_game.dart';

class BaseScene extends Component with HasGameReference<AdventureGame> {
  @override
  Future<void> onLoad() async {
    // TODO: Load background and interactables based on scene data
    // For now, just a placeholder text
    add(
      TextComponent(
        text: 'Scene: Start',
        position: Vector2(100, 100),
        textRenderer: TextPaint(
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
