import 'package:dash_shooter/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class BulletComponent extends SpriteAnimationComponent
    with HasGameRef<DashShooterGame>, CollisionCallbacks {
  BulletComponent({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2.all(10),
          anchor: Anchor.center,
        );

  static const speed = 600.0;
  late final Vector2 velocity;
  final Vector2 deltaPosition = Vector2.zero();

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox());
    animation = await gameRef.loadSpriteAnimation(
      'bullet.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.2,
        amount: 4,
        textureSize: Vector2(8, 16),
      ),
    );
    velocity = Vector2(0, -1)
      ..rotate(angle)
      ..scale(speed);
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is DashEnemyComponent) {
      removeFromParent();
      other.collide();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    deltaPosition
      ..setFrom(velocity)
      ..scale(dt);
    position += deltaPosition;

    if (position.y < 50 ||
        position.x > gameRef.size.x ||
        position.x + size.x < 0) {
      removeFromParent();
    }
  }
}
