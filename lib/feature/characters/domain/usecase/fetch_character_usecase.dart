import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/repository/characters_repository.dart';

class FetchCharacterUsecase {
  const FetchCharacterUsecase(this._repository);

  final CharactersRepository _repository;

  Future<CharacterEntity> call(int id) => _repository.fetchCharacter(id);
}
