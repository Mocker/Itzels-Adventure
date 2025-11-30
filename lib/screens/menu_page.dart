import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/adventure_game.dart';
import '../services/save_manager.dart';
import '../game/state/game_state.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _hasSave = false;
  final _saveManager = SaveManager();

  @override
  void initState() {
    super.initState();
    _checkSave();
  }

  Future<void> _checkSave() async {
    final hasSave = await _saveManager.hasSaveGame();
    if (mounted) {
      setState(() {
        _hasSave = hasSave;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Game Off Adventure',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Courier',
              ),
            ),
            const SizedBox(height: 50),
            _buildMenuButton(context, 'New Game', () {
              // Reset state for new game
              GameState.fromJson({});
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const GameWidget<AdventureGame>.controlled(
                        gameFactory: AdventureGame.new,
                      ),
                ),
              );
            }),
            const SizedBox(height: 20),
            _buildMenuButton(
              context,
              'Continue',
              _hasSave
                  ? () async {
                      final loadedState = await _saveManager.loadGame();
                      if (loadedState != null && context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const GameWidget<AdventureGame>.controlled(
                                  gameFactory: AdventureGame.new,
                                ),
                          ),
                        );
                      }
                    }
                  : null,
            ),
            const SizedBox(height: 20),
            _buildMenuButton(context, 'Options', () {
              // TODO: Implement Options
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String label,
    VoidCallback? onPressed,
  ) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey[800],
          disabledForegroundColor: Colors.grey[500],
        ),
        child: Text(label, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
