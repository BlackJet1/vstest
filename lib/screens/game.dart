import 'dart:async';

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtest/core/Donjone.dart';

import 'bloc/game_bloc.dart';

class BePainter extends CustomPainter {
  static late ui.Image img;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(
        img,
        Rect.fromLTWH(128.0 * Donjone.step, 128.0 * Donjone.game, 128, 128),
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class JGameWidget extends StatelessWidget {
  const JGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (_) => GameBloc(),
      child: Scaffold(
          body: SafeArea(
              child: DecoratedBox(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 47, 43, 208),
                    Color.fromARGB(255, 252, 21, 201),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: BlocBuilder<GameBloc, GameState>(
                      builder: (context, state) {
                    if (state is GameStarting) {
                      context.read<GameBloc>().add(GameLoading());
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Stack(fit: StackFit.expand, children: [
                      Builder(builder: (BuildContext context) {
                        final minsize =
                            MediaQuery.of(context).size.shortestSide;

                        return CustomPaint(
                          painter: BePainter(),
                          size: Size(minsize, minsize),
                          child: Container(),
                        );
                      }),
                      if (state is GameWork)
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    next(context);
                                  },
                                  child: const Text(
                                    'Выбор 1',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    next(context);
                                  },
                                  child: const Text(
                                    'Выбор 1',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 30),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    next(context);
                                  },
                                  child: const Text(
                                    'Выбор 3',
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 30),
                                  )),
                              const Padding(padding: EdgeInsets.all(20)),
                            ]),
                      if (state is GameEnd)
                        Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/jmenu');
                                },
                                child: const Text('GAME OVER',
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))))
                    ]);
                  })))),
    );
  }

  void next(BuildContext context) {
    Donjone.step += 1;
    if (Donjone.step == 16) {
      Donjone.step = 15;
      context.read<GameBloc>().add(GameFinish());
    } else {
      context.read<GameBloc>().add(GameDraw());
    }
  }
}
