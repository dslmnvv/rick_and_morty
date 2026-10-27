import 'package:rick_and_morty/feature/characters/data/dto/characters_page_dto.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_page_entity.dart';
import 'package:rick_and_morty/feature/characters/utils/extension/mappers/character_dto_ext.dart';

extension CharactersPageDtoExt on CharactersPageDto {
  CharactersPageEntity toEntity() {
    return CharactersPageEntity(
      characters: results.map((dto) => dto.toEntity()).toList(),
      hasMore: info.next != null,
    );
  }
}
