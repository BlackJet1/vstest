part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameStarting extends GameState {}
class GameWork extends GameState {}
class GameEnd extends GameState {}

