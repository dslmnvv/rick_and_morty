import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/feature/characters/data/dto/character_dto.dart';
import 'package:rick_and_morty/feature/characters/data/dto/characters_page_dto.dart';
import 'package:rick_and_morty/feature/characters/data/repository/characters_repository_impl.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_status.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_exception.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_page_entity.dart';

import '../../../fixtures/character_fixtures.dart';
import '../../../mocks/mock_characters_source.dart';

void main() {
  late MockCharactersSource source;
  late CharactersRepositoryImpl repository;

  final requestOptions = RequestOptions(path: '/character');

  setUp(() {
    source = MockCharactersSource();
    repository = CharactersRepositoryImpl(source);
  });

  test('maps API json to entities', () async {
    final pageDto = CharactersPageDto.fromJson({
      'info': {
        'count': 2,
        'pages': 2,
        'next': 'https://rickandmortyapi.com/api/character?page=2',
        'prev': null,
      },
      'results': [
        buildCharacterJson(),
        buildCharacterJson(
          id: 2,
          status: 'unknown',
          type: 'Parasite',
          originName: 'unknown',
        ),
      ],
    });
    when(
      () => source.fetchCharacters(page: 1, name: ''),
    ).thenAnswer((_) async => pageDto);

    final page = await repository.fetchCharacters(page: 1, name: '');

    expect(page.hasMore, isTrue);
    expect(page.characters.first.status, CharacterStatus.alive);
    expect(page.characters.first.type, isNull);
    expect(page.characters.first.episodeCount, 2);
    expect(page.characters.last.status, CharacterStatus.unknown);
    expect(page.characters.last.type, 'Parasite');
    expect(page.characters.last.originName, isNull);
  });

  test('404 on search is treated as an empty result', () async {
    when(() => source.fetchCharacters(page: 1, name: 'zzz')).thenThrow(
      DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.badResponse,
        response: Response(requestOptions: requestOptions, statusCode: 404),
      ),
    );

    final page = await repository.fetchCharacters(page: 1, name: 'zzz');

    expect(page, const CharactersPageEntity.empty());
  });

  test('connection errors are mapped to a domain failure', () async {
    when(() => source.fetchCharacter(1)).thenThrow(
      DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.connectionError,
      ),
    );

    await expectLater(
      repository.fetchCharacter(1),
      throwsA(
        isA<CharactersException>().having(
          (exception) => exception.failure,
          'failure',
          CharactersFailure.connection,
        ),
      ),
    );
  });

  test('single character json is parsed', () async {
    when(
      () => source.fetchCharacter(1),
    ).thenAnswer((_) async => CharacterDto.fromJson(buildCharacterJson()));

    final character = await repository.fetchCharacter(1);

    expect(character.name, 'Rick Sanchez');
    expect(character.locationName, 'Citadel of Ricks');
  });
}
