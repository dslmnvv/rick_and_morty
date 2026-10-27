part of 'characters_bloc.dart';

sealed class CharactersEvent {
  const factory CharactersEvent.load() = _LoadCharactersEvent;

  const factory CharactersEvent.search(String query) = _SearchCharactersEvent;

  const factory CharactersEvent.loadNextPage() = _LoadNextPageCharactersEvent;

  const factory CharactersEvent.refresh() = _RefreshCharactersEvent;

  const factory CharactersEvent.retry() = _RetryCharactersEvent;
}
