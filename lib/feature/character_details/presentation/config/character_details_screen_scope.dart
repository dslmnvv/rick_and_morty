import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/core/dependencies/app_dependencies.dart';
import 'package:rick_and_morty/feature/character_details/bloc/character_details_bloc.dart';
import 'package:rick_and_morty/feature/characters/data/repository/characters_repository_impl.dart';
import 'package:rick_and_morty/feature/characters/data/source/characters_network.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/domain/usecase/fetch_character_usecase.dart';

class CharacterDetailsScreenScope extends StatelessWidget {
  const CharacterDetailsScreenScope({
    required this.characterId,
    required this.child,
    this.initialCharacter,
    super.key,
  });

  final int characterId;
  final Widget child;
  final CharacterEntity? initialCharacter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: _createBloc, child: child);
  }

  CharacterDetailsBloc _createBloc(BuildContext context) {
    final dependencies = context.read<AppDependencies>();
    final source = CharactersNetwork(dio: dependencies.dio);
    final repository = CharactersRepositoryImpl(source);
    return CharacterDetailsBloc(
      fetchCharacterUsecase: FetchCharacterUsecase(repository),
      characterId: characterId,
      initialCharacter: initialCharacter,
    )..add(const CharacterDetailsEvent.load());
  }
}
