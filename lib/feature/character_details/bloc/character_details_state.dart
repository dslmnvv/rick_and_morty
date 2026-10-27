part of 'character_details_bloc.dart';

class CharacterDetailsState extends Equatable {
  const CharacterDetailsState({
    this.status = CharacterDetailsStatus.loading,
    this.character,
    this.failure = CharactersFailure.unknown,
  });

  final CharacterDetailsStatus status;
  final CharacterEntity? character;
  final CharactersFailure failure;

  @override
  List<Object?> get props => [status, character, failure];
}
