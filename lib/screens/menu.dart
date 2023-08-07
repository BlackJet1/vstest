import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtest/core/Donjone.dart';

class JMenuWidget extends StatelessWidget {
  const JMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: DecoratedBox(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 47, 43, 208),
                  Color.fromARGB(255, 252, 21, 201),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/jsettings');
                            },
                            child: const Icon(
                              CupertinoIcons.gear,
                              color: Colors.white,
                            )),
                      ]),
                      JButton(1, context),
                      JButton(2, context),
                      JButton(3, context),
                    ]))));
  }
}

Widget JButton(int game, BuildContext context) {
  final width = MediaQuery.of(context).size.width * 0.8;
  final height = MediaQuery.of(context).size.height * 0.18;
  final padding = MediaQuery.of(context).size.width * 0.1;
  final space = MediaQuery.of(context).size.height * 0.1;
  return Padding(
    padding: EdgeInsets.only(
        left: padding, right: padding, bottom: space / 2, top: space / 2),
    child: TextButton(
      onPressed: () {
        Donjone.game = game-1;
        Donjone.step = 0;
        Navigator.pushNamed(context, '/jgame');
      },
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Игра $game'),
            ],
          ),
        ),
      ),
    ),
  );
}
