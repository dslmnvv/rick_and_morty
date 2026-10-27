import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_gender.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_status.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_page_entity.dart';

CharacterEntity buildCharacter(int id) {
  return CharacterEntity(
    id: id,
    name: 'Character $id',
    status: CharacterStatus.alive,
    species: 'Human',
    gender: CharacterGender.male,
    imageUrl: 'https://rickandmortyapi.com/api/character/avatar/$id.jpeg',
    episodeCount: 1,
    originName: 'Earth (C-137)',
    locationName: 'Citadel of Ricks',
  );
}

CharactersPageEntity buildPage(List<int> ids, {bool hasMore = false}) {
  return CharactersPageEntity(
    characters: ids.map(buildCharacter).toList(),
    hasMore: hasMore,
  );
}

Map<String, Object?> buildCharacterJson({
  int id = 1,
  String status = 'Alive',
  String type = '',
  String originName = 'Earth (C-137)',
  String locationName = 'Citadel of Ricks',
}) {
  return {
    'id': id,
    'name': 'Rick Sanchez',
    'status': status,
    'species': 'Human',
    'type': type,
    'gender': 'Male',
    'origin': {'name': originName, 'url': ''},
    'location': {'name': locationName, 'url': ''},
    'image': 'https://rickandmortyapi.com/api/character/avatar/$id.jpeg',
    'episode': [
      'https://rickandmortyapi.com/api/episode/1',
      'https://rickandmortyapi.com/api/episode/2',
    ],
    'url': 'https://rickandmortyapi.com/api/character/$id',
    'created': '2017-11-04T18:48:46.250Z',
  };
}
