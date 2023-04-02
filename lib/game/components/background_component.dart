import 'package:dash_shooter/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class BackgroundComponent extends ParallaxComponent<DashShooterGame> {
  BackgroundComponent() : super();

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('parallax/sky.png'),
        ParallaxImageData('parallax/far-clouds.png'),
        ParallaxImageData('parallax/far-mountains.png'),
        ParallaxImageData('parallax/near-clouds.png'),
        ParallaxImageData('parallax/mountains.png'),
        ParallaxImageData('parallax/trees.png'),
      ],
      baseVelocity: Vector2(20, 0),
      // alignment: Alignment.center,
      velocityMultiplierDelta: Vector2(1.2, 1.0),
    );
  }
}
