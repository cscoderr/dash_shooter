import 'package:dash_shooter/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class DashEnemyComponent extends SpriteAnimationComponent
    with HasGameRef<DashShooterGame> {
  DashEnemyComponent({required super.position});

  final Vector2 velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    size = Vector2.all(30);
    animation = await gameRef.loadSpriteAnimation(
      'dash_center.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.2,
        amount: 1,
        textureSize: Vector2.all(64),
      ),
    );
    anchor = Anchor.center;
    add(CircleHitbox()..collisionType = CollisionType.passive);
  }

  @override
  void update(double dt) {
    super.update(dt);
    y += 100 * dt;
    if (y >= gameRef.size.y) {
      removeFromParent();
    }
  }

  void collide() {
    removeFromParent();
    gameRef.increaseScore();
    gameRef.shotSound();
    if (gameRef.score % 50 == 0) {
      gameRef.increaseLevel();
    }
  }

  void hit() {
    gameRef.add(ExplosionComponent(position: position));
    FlameAudio.play('hit.wav');
    removeFromParent();
    gameRef.reset();
  }
}
