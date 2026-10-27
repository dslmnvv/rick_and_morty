import 'package:dio/dio.dart';
import 'package:rick_and_morty/feature/characters/data/source/characters_source.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_exception.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_page_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/repository/characters_repository.dart';
import 'package:rick_and_morty/feature/characters/utils/extension/mappers/character_dto_ext.dart';
import 'package:rick_and_morty/feature/characters/utils/extension/mappers/characters_page_dto_ext.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  const CharactersRepositoryImpl(this._source);

  static const _notFoundStatusCode = 404;

  final CharactersSource _source;

  @override
  Future<CharactersPageEntity> fetchCharacters({
    required int page,
    required String name,
  }) async {
    try {
      final pageDto = await _source.fetchCharacters(page: page, name: name);
      return pageDto.toEntity();
    } on DioException catch (error) {
      if (error.response?.statusCode == _notFoundStatusCode) {
        return const CharactersPageEntity.empty();
      }
      throw _mapError(error);
    }
  }

  @override
  Future<CharacterEntity> fetchCharacter(int id) async {
    try {
      final characterDto = await _source.fetchCharacter(id);
      return characterDto.toEntity();
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  CharactersException _mapError(DioException error) {
    final failure = switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError => CharactersFailure.connection,
      _ => CharactersFailure.unknown,
    };
    return CharactersException(failure);
  }
}
