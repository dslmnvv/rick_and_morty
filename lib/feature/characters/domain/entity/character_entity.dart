import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_gender.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_status.dart';

class CharacterEntity extends Equatable {
  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.imageUrl,
    required this.episodeCount,
    this.type,
    this.originName,
    this.locationName,
  });

  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final CharacterGender gender;
  final String imageUrl;
  final int episodeCount;
  final String? type;
  final String? originName;
  final String? locationName;

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    gender,
    imageUrl,
    episodeCount,
    type,
    originName,
    locationName,
  ];
}
