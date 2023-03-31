import 'package:dash_shooter/game/game.dart';
import 'package:flame/game.dart' hide Route;
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const GamePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GameWidget(
              game: DashShooterGame(),
            ),
          ),
        ],
      ),
    );
  }
}
