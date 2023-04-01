import 'package:dash_shooter/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class DashShooterPlayerComponent extends SpriteAnimationComponent
    with HasGameRef<DashShooterGame>, CollisionCallbacks {
  late TimerComponent bulletTimer;

  DashShooterPlayerComponent()
      : super(
          size: Vector2(60, 75),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    position = Vector2((gameRef.size.x - size.x) / 2, gameRef.size.y - size.y);
    add(CircleHitbox());
    add(
      bulletTimer = TimerComponent(
        period: 0.05,
        repeat: true,
        autoStart: false,
        onTick: _newBulletComponent,
      ),
    );
    priority = 1;
    animation = await gameRef.loadSpriteAnimation(
      'player.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.2,
        amount: 3,
        textureSize: Vector2(42.9, 50),
      ),
    );
  }

  void _newBulletComponent() {
    gameRef.add(
      BulletComponent(
        position: position + Vector2(0, -size.y / 2),
      ),
    );
  }

  void move(Vector2 vector) {
    position += vector;
  }

  void startShooting() {
    bulletTimer.timer.start();
  }

  void stopShooting() {
    bulletTimer.timer.pause();
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is DashEnemyComponent) {
      other.hit();
    }
  }
}
