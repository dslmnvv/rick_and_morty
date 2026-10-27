import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/character_details/bloc/character_details_status.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_exception.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';
import 'package:rick_and_morty/feature/characters/domain/usecase/fetch_character_usecase.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';
part 'event/load_character_details_event.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  CharacterDetailsBloc({
    required FetchCharacterUsecase fetchCharacterUsecase,
    required int characterId,
    CharacterEntity? initialCharacter,
  }) : _fetchCharacterUsecase = fetchCharacterUsecase,
       _characterId = characterId,
       super(
         initialCharacter == null
             ? const CharacterDetailsState()
             : CharacterDetailsState(
                 status: CharacterDetailsStatus.success,
                 character: initialCharacter,
               ),
       ) {
    on<_LoadCharacterDetailsEvent>(_onLoad, transformer: droppable());
  }

  final FetchCharacterUsecase _fetchCharacterUsecase;
  final int _characterId;

  Future<void> _onLoad(
    _LoadCharacterDetailsEvent event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    final hasCharacter = state.character != null;
    if (state.status == CharacterDetailsStatus.failure) {
      emit(const CharacterDetailsState());
    }
    try {
      final character = await _fetchCharacterUsecase(_characterId);
      emit(
        CharacterDetailsState(
          status: CharacterDetailsStatus.success,
          character: character,
        ),
      );
    } on Object catch (error, stackTrace) {
      if (!hasCharacter) {
        emit(
          CharacterDetailsState(
            status: CharacterDetailsStatus.failure,
            failure: error is CharactersException
                ? error.failure
                : CharactersFailure.unknown,
          ),
        );
      }
      addError(error, stackTrace);
    }
  }
}
