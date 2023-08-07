import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtest/core/Donjone.dart';

import '../core/audio.dart';

class JSettingsWidget extends StatelessWidget {
  const JSettingsWidget({super.key});

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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_circle_left_outlined,
                                  color: Colors.white,
                                )),
                          ]),
                      JBS('game 1', context),
                    ]))));
  }
}

Widget JBS(String text, BuildContext context) {
  final width = MediaQuery.of(context).size.width * 0.8;
  final height = MediaQuery.of(context).size.height * 0.2;
  final padding = MediaQuery.of(context).size.width * 0.1;
  final space = MediaQuery.of(context).size.height * 0.1;
  return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
    return Padding(
      padding: EdgeInsets.only(
          left: padding, right: padding, bottom: space / 2, top: space / 2),
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(CupertinoIcons.speaker_2, color: Colors.black),
                const Text('Звук'),
                Switch(
                    activeColor: Colors.green,
                    value: Bach.musicEnableFlag,
                    onChanged: (e) {
                      Bach.musicEnableFlag = e;
                      if (Bach.musicEnableFlag) {
                        Bach.playBgm('loop.ogg');
                      } else {
                        Bach.stopBgm();
                      }
                      Donjone.save();
                      setState(() {});
                    })
              ],
            ),
          ),
        ),
      ),
    );
  });
}
