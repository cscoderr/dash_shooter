import 'dart:math';

import 'package:dash_shooter/game/game.dart';
import 'package:flame/components.dart';

class DashTimerComponent extends TimerComponent
    with HasGameRef<DashShooterGame> {
  final Random random = Random();
  final _halfWidth = 30 / 2;

  DashTimerComponent() : super(period: 1, repeat: true);

  @override
  void onTick() {
    gameRef.addAll(
      List.generate(
        gameRef.level * 2,
        (index) => DashEnemyComponent(
          position: Vector2(
            _halfWidth + (gameRef.size.x - _halfWidth) * random.nextDouble(),
            200,
          ),
        ),
      ),
    );
  }
}
