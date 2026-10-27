part of 'characters_bloc.dart';

class CharactersState extends Equatable {
  const CharactersState({
    this.status = CharactersStatus.initial,
    this.pageStatus = CharactersPageStatus.idle,
    this.characters = const [],
    this.query = '',
    this.page = 0,
    this.hasMore = false,
    this.failure = CharactersFailure.unknown,
    this.isRefreshing = false,
    this.refreshFailed = false,
  });

  final CharactersStatus status;
  final CharactersPageStatus pageStatus;
  final List<CharacterEntity> characters;
  final String query;
  final int page;
  final bool hasMore;
  final CharactersFailure failure;
  final bool isRefreshing;
  final bool refreshFailed;

  bool get isEmpty => status == CharactersStatus.success && characters.isEmpty;

  CharactersState copyWith({
    CharactersStatus? status,
    CharactersPageStatus? pageStatus,
    List<CharacterEntity>? characters,
    String? query,
    int? page,
    bool? hasMore,
    CharactersFailure? failure,
    bool? isRefreshing,
    bool? refreshFailed,
  }) {
    return CharactersState(
      status: status ?? this.status,
      pageStatus: pageStatus ?? this.pageStatus,
      characters: characters ?? this.characters,
      query: query ?? this.query,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      failure: failure ?? this.failure,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      refreshFailed: refreshFailed ?? this.refreshFailed,
    );
  }

  @override
  List<Object?> get props => [
    status,
    pageStatus,
    characters,
    query,
    page,
    hasMore,
    failure,
    isRefreshing,
    refreshFailed,
  ];
}
