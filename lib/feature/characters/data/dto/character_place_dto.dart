import 'package:json_annotation/json_annotation.dart';

part 'generated/character_place_dto.g.dart';

@JsonSerializable()
class CharacterPlaceDto {
  const CharacterPlaceDto({required this.name, required this.url});

  factory CharacterPlaceDto.fromJson(Map<String, Object?> json) =>
      _$CharacterPlaceDtoFromJson(json);

  final String name;
  final String url;
}
