import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_flutter/blocs/match/match_bloc.dart';

enum Pressed {
  pressedByUser,
  pressedByOpponent,
  notPressed,
}

String returnText(
    String val, List<String> playerSelected, List<String> rivalSelected) {
  if (playerSelected.contains(val)) {
    return 'X';
  } else if (rivalSelected.contains(val)) {
    return 'O';
  } else {
    return '';
  }
}

class Tile extends StatelessWidget {
  final String value;

  const Tile({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<MatchBloc>(context);

    return BlocBuilder<MatchBloc, MatchState>(builder: (context, state) {
      return GestureDetector(
          onTap: () {
            if (state.gameStatus != Status.playing ||
                state.playerSelected.contains(value) ||
                state.rivalSelected.contains(value)) {
              return;
            }
            provider.add(AddTile(value: value));
            provider.add(AddTileRival());
            if (state.playerSelected.length >= 2) {
              provider.add(CheckStatus());
            }
          },
          child: Container(
            color: const Color.fromARGB(255, 0, 100, 255),
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                returnText(value, state.playerSelected, state.rivalSelected),
                style: const TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ));
    });
  }
}
