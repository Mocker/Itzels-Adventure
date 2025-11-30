import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'player.dart';

class InteractableItem extends PositionComponent with CollisionCallbacks {
  final String id;
  bool _isNearPlayer = false;

  InteractableItem({required this.id, super.position})
    : super(size: Vector2.all(32), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    add(RectangleComponent(size: size, paint: Paint()..color = Colors.yellow));
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Visual feedback for interaction range
    children.whereType<RectangleComponent>().first.paint.color = _isNearPlayer
        ? Colors.green
        : Colors.yellow;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) {
      _isNearPlayer = true;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is Player) {
      _isNearPlayer = false;
    }
  }

  void interact() {
    if (_isNearPlayer) {
      debugPrint('Interacted with item: $id');
      // TODO: Add interaction logic (add to inventory, etc.)
    }
  }
}
