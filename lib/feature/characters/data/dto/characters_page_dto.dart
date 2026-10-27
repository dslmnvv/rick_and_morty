import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/feature/characters/data/dto/character_dto.dart';
import 'package:rick_and_morty/feature/characters/data/dto/page_info_dto.dart';

part 'generated/characters_page_dto.g.dart';

@JsonSerializable()
class CharactersPageDto {
  const CharactersPageDto({required this.info, required this.results});

  factory CharactersPageDto.fromJson(Map<String, Object?> json) =>
      _$CharactersPageDtoFromJson(json);

  final PageInfoDto info;
  final List<CharacterDto> results;
}
