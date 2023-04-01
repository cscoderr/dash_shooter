import 'dart:math';

import 'package:dash_shooter/game/game.dart';
import 'package:flame/components.dart';

class DashTimerComponent extends TimerComponent
    with HasGameRef<DashShooterGame> {
  DashTimerComponent() : super(period: 1.5, repeat: true);

  final Random random = Random();

  @override
  void onTick() {
    gameRef.addAll(
      List.generate(
        gameRef.level * 2,
        (index) => DashEnemyComponent(
          position: Vector2(
            (gameRef.size.x - 30) * random.nextDouble(),
            (gameRef.size.y / 2) * random.nextDouble(),
          ),
        ),
      ),
    );
  }
}
