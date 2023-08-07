part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}
class GameDraw extends GameEvent {}
class GameLoading extends GameEvent {}
class GameFinish extends GameEvent {}