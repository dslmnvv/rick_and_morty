part of '../characters_bloc.dart';

final class _SearchCharactersEvent implements CharactersEvent {
  const _SearchCharactersEvent(this.query);

  final String query;
}
