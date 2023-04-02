import 'dart:async';

import 'package:dash_shooter/game/components/components.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';

class DashShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late DashShooterPlayerComponent player;
  late final TextComponent scoreText;
  late final TextComponent levelText;
  int score = 0;
  int level = 1;
  @override
  FutureOr<void> onLoad() async {
    FlameAudio.bgm.initialize();
    player = DashShooterPlayerComponent();
    addAll([
      BackgroundComponent(),
      scoreText = TextComponent(
        position: Vector2(size.x - 10, 50),
        anchor: Anchor.topRight,
        textRenderer: TextPaint(
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      levelText = TextComponent(
        position: Vector2(10, 50),
        anchor: Anchor.topLeft,
        textRenderer: TextPaint(
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      player,
      DashTimerComponent(),
    ]);
    startBgmMusic();
    player.startShooting();
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreText.text = 'Dash: $score';
    levelText.text = 'Level: $level';
  }

  void startBgmMusic() {
    FlameAudio.bgm.stop();
    FlameAudio.bgm.play('background.mp3', volume: 0.25);
  }

  void shotSound() {
    FlameAudio.play('shot.wav');
  }

  @override
  void onPanUpdate(DragUpdateInfo details) {
    player.move(details.delta.game);
  }

  void increaseScore() {
    score += 1;
  }

  void reset() {
    score = 0;
    level = 1;
  }

  void increaseLevel() {
    level += 1;
  }
}
