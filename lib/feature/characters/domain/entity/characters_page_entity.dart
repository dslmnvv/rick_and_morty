import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';

class CharactersPageEntity extends Equatable {
  const CharactersPageEntity({required this.characters, required this.hasMore});

  const CharactersPageEntity.empty() : characters = const [], hasMore = false;

  final List<CharacterEntity> characters;
  final bool hasMore;

  @override
  List<Object?> get props => [characters, hasMore];
}
