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

  bool _findWinner(List<String> tiles) {
    int count0InFirstDigit = 0;
    int count1InFirstDigit = 0;
    int count2InFirstDigit = 0;

    int count0InSecondDigit = 0;
    int count1InSecondDigit = 0;
    int count2InSecondDigit = 0;

    for (int i = 0; i < playerSelected.length; i++) {
      if (playerSelected[i].startsWith('0')) {
        count0InFirstDigit++;
      } else if (playerSelected[i].startsWith('1')) {
        count1InFirstDigit++;
      } else if (playerSelected[i].startsWith('2')) {
        count2InFirstDigit++;
      }

      if (playerSelected[i].endsWith('0')) {
        count0InSecondDigit++;
      } else if (playerSelected[i].endsWith('1')) {
        count1InSecondDigit++;
      } else if (playerSelected[i].endsWith('2')) {
        count2InSecondDigit++;
      }
    }
    if (count0InFirstDigit == 3 ||
        count1InFirstDigit == 3 ||
        count2InFirstDigit == 3 ||
        count0InSecondDigit == 3 ||
        count1InSecondDigit == 3 ||
        count2InSecondDigit == 3 ||
        (playerSelected.contains('00') &&
            playerSelected.contains('11') &&
            playerSelected.contains('22')) ||
        (playerSelected.contains('02') &&
            playerSelected.contains('11') &&
            playerSelected.contains('20'))) {
      return true;
    }
    return false;
  }

  MatchState checkStatus() {
    if (_findWinner(playerSelected)) {
      return copyWith(gameStatus: Status.win);
    } else if (_findWinner(rivalSelected)) {
      return copyWith(gameStatus: Status.lose);
    }
    return copyWith(gameStatus: Status.playing);
  }

  MatchState addTileRival() {
    const List<String> allTiles = [
      '00',
      '01',
      '02',
      '10',
      '11',
      '12',
      '20',
      '21',
      '22'
    ];

    List<String> availableTiles = [];

    for (final tile in allTiles) {
      if (!playerSelected.contains(tile) && !rivalSelected.contains(tile)) {
        availableTiles.add(tile);
      }
    }

    if (availableTiles.isEmpty) {
      return copyWith(gameStatus: Status.draw);
    }

    final random = Random();
    final randomTile = availableTiles[random.nextInt(availableTiles.length)];

    return copyWith(rivalSelected: [...rivalSelected, randomTile]);
  }
}
