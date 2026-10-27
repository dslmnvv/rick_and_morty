import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_page_entity.dart';

abstract interface class CharactersRepository {
  Future<CharactersPageEntity> fetchCharacters({
    required int page,
    required String name,
  });

  Future<CharacterEntity> fetchCharacter(int id);
}
