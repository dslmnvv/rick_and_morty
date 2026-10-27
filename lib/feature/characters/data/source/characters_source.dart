import 'package:rick_and_morty/feature/characters/data/dto/character_dto.dart';
import 'package:rick_and_morty/feature/characters/data/dto/characters_page_dto.dart';

abstract interface class CharactersSource {
  Future<CharactersPageDto> fetchCharacters({
    required int page,
    required String name,
  });

  Future<CharacterDto> fetchCharacter(int id);
}
