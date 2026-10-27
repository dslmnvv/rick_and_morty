part of 'character_details_bloc.dart';

sealed class CharacterDetailsEvent {
  const factory CharacterDetailsEvent.load() = _LoadCharacterDetailsEvent;
}
