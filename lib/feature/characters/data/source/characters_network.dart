import 'package:dio/dio.dart';
import 'package:rick_and_morty/feature/characters/data/dto/character_dto.dart';
import 'package:rick_and_morty/feature/characters/data/dto/characters_page_dto.dart';
import 'package:rick_and_morty/feature/characters/data/source/characters_source.dart';

class CharactersNetwork implements CharactersSource {
  const CharactersNetwork({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<CharactersPageDto> fetchCharacters({
    required int page,
    required String name,
  }) async {
    final response = await _dio.get<Map<String, Object?>>(
      '/character',
      queryParameters: {'page': page, if (name.isNotEmpty) 'name': name},
    );
    return CharactersPageDto.fromJson(response.data ?? const {});
  }

  @override
  Future<CharacterDto> fetchCharacter(int id) async {
    final response = await _dio.get<Map<String, Object?>>('/character/$id');
    return CharacterDto.fromJson(response.data ?? const {});
  }
}
