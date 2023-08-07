import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtest/core/audio.dart';

class Donjone {
  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    bool music = prefs.getBool('music') ?? true;
    Bach.musicEnableFlag = music;
  }

  static Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('music', Bach.musicEnableFlag);
  }

  static int game = 0;
  static int step = 0;

  static void init() {
    game = 0;
    step = 0;
  }
}
