import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_page_status.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_status.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_exception.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';
import 'package:rick_and_morty/feature/characters/domain/usecase/fetch_characters_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

part 'characters_event.dart';
part 'characters_state.dart';
part 'event/load_characters_event.dart';
part 'event/load_next_page_characters_event.dart';
part 'event/refresh_characters_event.dart';
part 'event/retry_characters_event.dart';
part 'event/search_characters_event.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({
    required FetchCharactersUsecase fetchCharactersUsecase,
    required Duration searchDebounce,
  }) : _fetchCharactersUsecase = fetchCharactersUsecase,
       super(const CharactersState()) {
    on<_LoadCharactersEvent>(_onLoad);
    on<_SearchCharactersEvent>(
      _onSearch,
      transformer: _debounceRestartable(searchDebounce),
    );
    on<_LoadNextPageCharactersEvent>(_onLoadNextPage, transformer: droppable());
    on<_RefreshCharactersEvent>(_onRefresh, transformer: droppable());
    on<_RetryCharactersEvent>(_onRetry, transformer: droppable());
  }

  static const _firstPage = 1;

  final FetchCharactersUsecase _fetchCharactersUsecase;
  int _requestId = 0;

  static EventTransformer<Event> _debounceRestartable<Event>(
    Duration duration,
  ) {
    return (events, mapper) =>
        restartable<Event>().call(events.debounce(duration), mapper);
  }

  Future<void> _onLoad(
    _LoadCharactersEvent event,
    Emitter<CharactersState> emit,
  ) {
    return _loadFirstPage(state.query, emit);
  }

  Future<void> _onSearch(
    _SearchCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    final query = event.query.trim();
    if (query == state.query && state.status != CharactersStatus.failure) {
      return;
    }
    await _loadFirstPage(query, emit);
  }

  Future<void> _onLoadNextPage(
    _LoadNextPageCharactersEvent event,
    Emitter<CharactersState> emit,
  ) {
    return _loadNextPage(emit);
  }

  Future<void> _onRefresh(
    _RefreshCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (state.status != CharactersStatus.success) {
      await _loadFirstPage(state.query, emit);
      return;
    }

    final requestId = ++_requestId;
    final query = state.query;
    emit(state.copyWith(isRefreshing: true, refreshFailed: false));
    try {
      final page = await _fetchCharactersUsecase(page: _firstPage, name: query);
      if (requestId != _requestId) {
        return;
      }
      emit(
        CharactersState(
          status: CharactersStatus.success,
          characters: page.characters,
          query: query,
          page: _firstPage,
          hasMore: page.hasMore,
        ),
      );
    } on Object catch (error, stackTrace) {
      if (requestId != _requestId) {
        return;
      }
      emit(
        state.copyWith(
          pageStatus: CharactersPageStatus.idle,
          failure: _failureOf(error),
          isRefreshing: false,
          refreshFailed: true,
        ),
      );
      addError(error, stackTrace);
    }
  }

  Future<void> _onRetry(
    _RetryCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (state.status == CharactersStatus.failure) {
      await _loadFirstPage(state.query, emit);
      return;
    }
    if (state.pageStatus == CharactersPageStatus.failure) {
      emit(state.copyWith(pageStatus: CharactersPageStatus.idle));
      await _loadNextPage(emit);
    }
  }

  Future<void> _loadFirstPage(
    String query,
    Emitter<CharactersState> emit,
  ) async {
    final requestId = ++_requestId;
    emit(CharactersState(status: CharactersStatus.loading, query: query));
    try {
      final page = await _fetchCharactersUsecase(page: _firstPage, name: query);
      if (requestId != _requestId) {
        return;
      }
      emit(
        CharactersState(
          status: CharactersStatus.success,
          characters: page.characters,
          query: query,
          page: _firstPage,
          hasMore: page.hasMore,
        ),
      );
    } on Object catch (error, stackTrace) {
      if (requestId != _requestId) {
        return;
      }
      emit(
        CharactersState(
          status: CharactersStatus.failure,
          query: query,
          failure: _failureOf(error),
        ),
      );
      addError(error, stackTrace);
    }
  }

  Future<void> _loadNextPage(Emitter<CharactersState> emit) async {
    final canLoad =
        state.status == CharactersStatus.success &&
        state.hasMore &&
        !state.isRefreshing &&
        state.pageStatus == CharactersPageStatus.idle;
    if (!canLoad) {
      return;
    }

    final requestId = _requestId;
    final nextPage = state.page + 1;
    emit(state.copyWith(pageStatus: CharactersPageStatus.loading));
    try {
      final page = await _fetchCharactersUsecase(
        page: nextPage,
        name: state.query,
      );
      if (requestId != _requestId) {
        return;
      }
      emit(
        state.copyWith(
          pageStatus: CharactersPageStatus.idle,
          characters: [...state.characters, ...page.characters],
          page: nextPage,
          hasMore: page.hasMore,
        ),
      );
    } on Object catch (error, stackTrace) {
      if (requestId != _requestId) {
        return;
      }
      emit(
        state.copyWith(
          pageStatus: CharactersPageStatus.failure,
          failure: _failureOf(error),
        ),
      );
      addError(error, stackTrace);
    }
  }

  CharactersFailure _failureOf(Object error) {
    return error is CharactersException
        ? error.failure
        : CharactersFailure.unknown;
  }
}
