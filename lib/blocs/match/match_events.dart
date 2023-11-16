part of 'match_bloc.dart';

@immutable
abstract class MatchEvent {}

class ResetMatch extends MatchEvent {}

class AddTile extends MatchEvent {
  final String value;

  AddTile({required this.value});
}

class CheckStatus extends MatchEvent {}

class AddTileRival extends MatchEvent {}
