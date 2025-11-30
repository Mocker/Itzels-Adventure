import 'package:flame/components.dart';
import '../adventure_game.dart';
import '../components/player.dart';
import '../components/interactable_item.dart';

class WorldScene extends Component with HasGameReference<AdventureGame> {
  @override
  Future<void> onLoad() async {
    // Add Player
    add(Player(position: Vector2(100, 100)));

    // Add some items
    add(InteractableItem(id: 'item_1', position: Vector2(300, 200)));
    add(InteractableItem(id: 'item_2', position: Vector2(500, 100)));
  }
}
