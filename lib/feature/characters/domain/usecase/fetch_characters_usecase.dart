import 'package:rick_and_morty/feature/characters/domain/entity/characters_page_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/repository/characters_repository.dart';

class FetchCharactersUsecase {
  const FetchCharactersUsecase(this._repository);

  final CharactersRepository _repository;

  Future<CharactersPageEntity> call({required int page, required String name}) {
    return _repository.fetchCharacters(page: page, name: name);
  }
}
