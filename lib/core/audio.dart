import 'package:just_audio/just_audio.dart';

/// класс для унификации работы со звуком
class Bach {
  static bool musicEnableFlag = true;
  static AudioPlayer bgm = AudioPlayer();

  static void pauseBgm() {
    bgm.pause();
  }

  static void resumeBgm() {
    if (!musicEnableFlag) return;
    bgm.play();
  }

  static void stopBgm() => bgm.stop();

  static void playBgm(String name) {
    if (!musicEnableFlag) return;
    stopBgm();
    bgm
      ..setLoopMode(LoopMode.one)
      ..setAsset('assets/audio/$name')
      ..play();
  }
}
