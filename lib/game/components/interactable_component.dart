import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class InteractableComponent extends PositionComponent with TapCallbacks {
  final String id;
  final VoidCallback? onInteract;

  InteractableComponent({
    required this.id,
    required Vector2 position,
    required Vector2 size,
    this.onInteract,
  }) : super(position: position, size: size);

  @override
  void onTapUp(TapUpEvent event) {
    print('Interacted with $id');
    onInteract?.call();
  }

  @override
  void render(Canvas canvas) {
    // Debug render
    canvas.drawRect(
      size.toRect(),
      Paint()..color = Colors.red.withOpacity(0.5),
    );
  }
}
