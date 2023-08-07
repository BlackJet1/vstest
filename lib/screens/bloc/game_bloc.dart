import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../game.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameStarting()) {
    on<GameLoading>((event, emit) async {
      await load();
      emit(GameWork());
    });
    on<GameDraw>((event, emit) {
      emit(GameWork());
    });
    on<GameFinish>((event, emit) {
      emit(GameEnd());
    });
  }

  Future<bool> load() async {
    var completer = Completer<ImageInfo>();
    var img = const AssetImage('assets/images/data.png');
    img
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((info, _) {
      completer.complete(info);
    }));
    ImageInfo imageInfo = await completer.future;
    BePainter.img = imageInfo.image;
    return true;
  }
}
