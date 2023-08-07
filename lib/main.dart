import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vtest/core/Donjone.dart';
import 'package:vtest/core/audio.dart';
import 'package:vtest/screens/game.dart';
import 'package:vtest/screens/menu.dart';
import 'package:vtest/screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Donjone.init();
  await Donjone.load();
  Bach.playBgm('loop.ogg');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
            canvasColor: Colors.white,
            textTheme: Theme.of(context).textTheme.apply(
                decoration: TextDecoration.none,
                bodyColor: const Color.fromARGB(255, 0, 0, 0))),
        initialRoute: '/jmenu',
        routes: {
          '/jgame': (BuildContext context) => const JGameWidget(),
          '/jmenu': (BuildContext context) => const JMenuWidget(),
          '/jsettings': (BuildContext context) => const JSettingsWidget(),
        },
        title: 'test app',
        debugShowCheckedModeBanner: false,
      );
}
