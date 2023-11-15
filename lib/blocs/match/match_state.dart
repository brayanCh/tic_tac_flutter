part of 'match_bloc.dart';

enum Status { win, lose, draw, playing }

class MatchState {
  List<String> playerSelected;
  List<String> rivalSelected;
  Status gameStatus;

  MatchState({
    this.playerSelected = const [],
    this.rivalSelected = const [],
    this.gameStatus = Status.playing,
  });

  MatchState copyWith({
    List<String>? playerSelected,
    List<String>? rivalSelected,
    Status? gameStatus,
  }) {
    return MatchState(
      playerSelected: playerSelected ?? this.playerSelected,
      rivalSelected: rivalSelected ?? this.rivalSelected,
      gameStatus: gameStatus ?? this.gameStatus,
    );
  }

  MatchState checkStatus() {
    for (int i = 0; i < playerSelected.length; i++) {}

    return copyWith();
  }
}
