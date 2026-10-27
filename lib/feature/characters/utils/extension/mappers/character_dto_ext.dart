import 'package:rick_and_morty/feature/characters/data/dto/character_dto.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_gender.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_status.dart';

extension CharacterDtoExt on CharacterDto {
  static const _unknownValue = 'unknown';

  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      status: _mapStatus(status),
      species: species,
      gender: _mapGender(gender),
      imageUrl: image,
      episodeCount: episode.length,
      type: _nullIfBlank(type),
      originName: _nullIfUnknown(origin.name),
      locationName: _nullIfUnknown(location.name),
    );
  }

  static CharacterStatus _mapStatus(String value) {
    return switch (value.toLowerCase()) {
      'alive' => CharacterStatus.alive,
      'dead' => CharacterStatus.dead,
      _ => CharacterStatus.unknown,
    };
  }

  static CharacterGender _mapGender(String value) {
    return switch (value.toLowerCase()) {
      'female' => CharacterGender.female,
      'male' => CharacterGender.male,
      'genderless' => CharacterGender.genderless,
      _ => CharacterGender.unknown,
    };
  }

  static String? _nullIfBlank(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static String? _nullIfUnknown(String value) {
    final trimmed = _nullIfBlank(value);
    return trimmed?.toLowerCase() == _unknownValue ? null : trimmed;
  }
}
