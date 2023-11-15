import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'match_events.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(MatchState()) {
    on<ResetMatch>((event, emit) => emit(MatchState()));
    on<AddTile>((event, emit) => emit(state
        .copyWith(playerSelected: [...state.playerSelected, event.value])));
    /*
    on<CheckStatus>((event, emit) => emit(state.copyWith(
          gameStatus: _checkStatus(),
        )));
        */
  }
}
