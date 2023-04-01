import 'package:dash_shooter/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class BackgroundComponent extends ParallaxComponent<DashShooterGame> {
  BackgroundComponent() : super();

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('bg.png'),
      ],
      baseVelocity: Vector2(20, 0),
      alignment: Alignment.center,
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
  }
}
