import 'dart:async';

import 'package:dash_shooter/game/game.dart';
import 'package:flame/components.dart';

class ExplosionComponent extends SpriteAnimationComponent
    with HasGameRef<DashShooterGame> {
  ExplosionComponent({super.position})
      : super(
          size: Vector2.all(50),
          anchor: Anchor.center,
          removeOnFinish: true,
        );

  @override
  FutureOr<void> onLoad() async {
    animation = await SpriteAnimation.load(
      'explosion1.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.1,
        textureSize: Vector2.all(32),
        loop: false,
      ),
    );
  }
}
