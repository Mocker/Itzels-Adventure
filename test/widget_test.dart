// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:gameoff_adventure/main.dart';
import 'package:gameoff_adventure/screens/menu_page.dart';
import 'package:gameoff_adventure/game/adventure_game.dart';
import 'package:flame/game.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('GameApp smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    // Build our app and trigger a frame.
    await tester.pumpWidget(const GameApp());
    await tester.pumpAndSettle();

    // Verify that the MenuPage is present.
    expect(find.byType(MenuPage), findsOneWidget);

    // Tap New Game
    await tester.tap(find.text('New Game'));
    await tester.pump(); // Start navigation
    await tester.pump(); // Build GameWidget

    // Verify that the GameWidget is present.
    expect(find.byType(GameWidget<AdventureGame>), findsOneWidget);
  });
}
