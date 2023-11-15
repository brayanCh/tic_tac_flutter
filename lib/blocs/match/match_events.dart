part of 'match_bloc.dart';

@immutable
abstract class MatchEvent {}

class ResetMatch extends MatchEvent {}

class AddTile extends MatchEvent {
  final String value;
  final bool isRival;

  AddTile({required this.value, this.isRival = false});
}

class CheckStatus extends MatchEvent {}
