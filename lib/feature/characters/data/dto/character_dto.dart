import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/feature/characters/data/dto/character_place_dto.dart';

part 'generated/character_dto.g.dart';

@JsonSerializable()
class CharacterDto {
  const CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
  });

  factory CharacterDto.fromJson(Map<String, Object?> json) =>
      _$CharacterDtoFromJson(json);

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterPlaceDto origin;
  final CharacterPlaceDto location;
  final String image;
  final List<String> episode;
}
