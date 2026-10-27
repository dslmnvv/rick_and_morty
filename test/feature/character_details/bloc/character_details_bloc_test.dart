import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/feature/character_details/bloc/character_details_bloc.dart';
import 'package:rick_and_morty/feature/character_details/bloc/character_details_status.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_exception.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';
import 'package:rick_and_morty/feature/characters/domain/usecase/fetch_character_usecase.dart';

import '../../../fixtures/character_fixtures.dart';
import '../../../mocks/mock_characters_repository.dart';

void main() {
  late MockCharactersRepository repository;

  CharacterDetailsBloc createBloc({bool withInitial = false}) {
    return CharacterDetailsBloc(
      fetchCharacterUsecase: FetchCharacterUsecase(repository),
      characterId: 1,
      initialCharacter: withInitial ? buildCharacter(1) : null,
    );
  }

  setUp(() => repository = MockCharactersRepository());

  test('loads the character by id', () async {
    when(
      () => repository.fetchCharacter(1),
    ).thenAnswer((_) async => buildCharacter(1));
    final bloc = createBloc()..add(const CharacterDetailsEvent.load());

    await expectLater(
      bloc.stream,
      emits(
        CharacterDetailsState(
          status: CharacterDetailsStatus.success,
          character: buildCharacter(1),
        ),
      ),
    );
    await bloc.close();
  });

  test('shows failure when nothing is loaded yet', () async {
    when(
      () => repository.fetchCharacter(1),
    ).thenThrow(const CharactersException(CharactersFailure.connection));
    final bloc = createBloc()..add(const CharacterDetailsEvent.load());

    await expectLater(
      bloc.stream,
      emits(
        const CharacterDetailsState(
          status: CharacterDetailsStatus.failure,
          failure: CharactersFailure.connection,
        ),
      ),
    );
    await bloc.close();
  });

  test('keeps the initial character when refresh fails', () async {
    when(
      () => repository.fetchCharacter(1),
    ).thenThrow(const CharactersException(CharactersFailure.unknown));
    final bloc = createBloc(withInitial: true);

    expect(bloc.state.status, CharacterDetailsStatus.success);

    bloc.add(const CharacterDetailsEvent.load());
    await Future<void>.delayed(const Duration(milliseconds: 10));

    expect(bloc.state.status, CharacterDetailsStatus.success);
    expect(bloc.state.character, buildCharacter(1));
    await bloc.close();
  });
}
