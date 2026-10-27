import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_page_status.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_status.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_exception.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_page_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/usecase/fetch_characters_usecase.dart';

import '../../../fixtures/character_fixtures.dart';
import '../../../mocks/mock_characters_repository.dart';

void main() {
  late MockCharactersRepository repository;
  late CharactersBloc bloc;

  void stubPage(int page, CharactersPageEntity result, {String name = ''}) {
    when(
      () => repository.fetchCharacters(page: page, name: name),
    ).thenAnswer((_) async => result);
  }

  Future<void> settle() =>
      Future<void>.delayed(const Duration(milliseconds: 10));

  setUp(() {
    repository = MockCharactersRepository();
    bloc = CharactersBloc(
      fetchCharactersUsecase: FetchCharactersUsecase(repository),
      searchDebounce: Duration.zero,
    );
  });

  tearDown(() => bloc.close());

  test('load emits loading and then the first page', () async {
    stubPage(1, buildPage([1, 2], hasMore: true));

    bloc.add(const CharactersEvent.load());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const CharactersState(status: CharactersStatus.loading),
        CharactersState(
          status: CharactersStatus.success,
          characters: buildPage([1, 2]).characters,
          page: 1,
          hasMore: true,
        ),
      ]),
    );
  });

  test('load reports connection failure', () async {
    when(
      () => repository.fetchCharacters(page: 1, name: ''),
    ).thenThrow(const CharactersException(CharactersFailure.connection));

    bloc.add(const CharactersEvent.load());
    await settle();

    expect(bloc.state.status, CharactersStatus.failure);
    expect(bloc.state.failure, CharactersFailure.connection);
  });

  test('empty result is exposed as isEmpty', () async {
    stubPage(1, const CharactersPageEntity.empty(), name: 'zzz');

    bloc.add(const CharactersEvent.search('zzz'));
    await settle();

    expect(bloc.state.isEmpty, isTrue);
  });

  test('next page is appended to the list', () async {
    stubPage(1, buildPage([1, 2], hasMore: true));
    stubPage(2, buildPage([3]));

    bloc.add(const CharactersEvent.load());
    await settle();
    bloc.add(const CharactersEvent.loadNextPage());
    await settle();

    expect(bloc.state.characters.map((character) => character.id), [1, 2, 3]);
    expect(bloc.state.page, 2);
    expect(bloc.state.hasMore, isFalse);
  });

  test('next page is not requested when there are no more pages', () async {
    stubPage(1, buildPage([1]));

    bloc.add(const CharactersEvent.load());
    await settle();
    bloc.add(const CharactersEvent.loadNextPage());
    await settle();

    verifyNever(
      () => repository.fetchCharacters(page: 2, name: any(named: 'name')),
    );
  });

  test('retry reloads a failed next page', () async {
    stubPage(1, buildPage([1], hasMore: true));
    when(
      () => repository.fetchCharacters(page: 2, name: ''),
    ).thenThrow(const CharactersException(CharactersFailure.unknown));

    bloc.add(const CharactersEvent.load());
    await settle();
    bloc.add(const CharactersEvent.loadNextPage());
    await settle();

    expect(bloc.state.pageStatus, CharactersPageStatus.failure);

    stubPage(2, buildPage([2]));
    bloc.add(const CharactersEvent.retry());
    await settle();

    expect(bloc.state.pageStatus, CharactersPageStatus.idle);
    expect(bloc.state.characters.map((character) => character.id), [1, 2]);
  });

  test('search trims the query and skips duplicates', () async {
    stubPage(1, buildPage([1]), name: 'rick');

    bloc.add(const CharactersEvent.search('  rick '));
    await settle();
    bloc.add(const CharactersEvent.search('rick'));
    await settle();

    expect(bloc.state.query, 'rick');
    verify(() => repository.fetchCharacters(page: 1, name: 'rick')).called(1);
  });

  test('a stale response does not overwrite a newer search', () async {
    final initialLoad = Completer<CharactersPageEntity>();
    when(
      () => repository.fetchCharacters(page: 1, name: ''),
    ).thenAnswer((_) => initialLoad.future);
    stubPage(1, buildPage([7]), name: 'morty');

    bloc.add(const CharactersEvent.load());
    await settle();
    bloc.add(const CharactersEvent.search('morty'));
    await settle();
    initialLoad.complete(buildPage([1, 2, 3]));
    await settle();

    expect(bloc.state.query, 'morty');
    expect(bloc.state.characters.map((character) => character.id), [7]);
  });

  test('failed refresh keeps the list and flags the failure', () async {
    stubPage(1, buildPage([1, 2]));

    bloc.add(const CharactersEvent.load());
    await settle();

    when(
      () => repository.fetchCharacters(page: 1, name: ''),
    ).thenThrow(const CharactersException(CharactersFailure.connection));
    bloc.add(const CharactersEvent.refresh());
    await settle();

    expect(bloc.state.status, CharactersStatus.success);
    expect(bloc.state.characters, hasLength(2));
    expect(bloc.state.isRefreshing, isFalse);
    expect(bloc.state.refreshFailed, isTrue);
  });
}
