import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game/adventure_game.dart';

void main() {
  runApp(const GameApp());
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Off Adventure',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GameWidget<AdventureGame>.controlled(
        gameFactory: AdventureGame.new,
      ),
    );
  }
}
