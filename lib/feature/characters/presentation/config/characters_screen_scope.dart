import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/core/const/app_const.dart';
import 'package:rick_and_morty/app/core/dependencies/app_dependencies.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/characters/data/repository/characters_repository_impl.dart';
import 'package:rick_and_morty/feature/characters/data/source/characters_network.dart';
import 'package:rick_and_morty/feature/characters/domain/usecase/fetch_characters_usecase.dart';

class CharactersScreenScope extends StatelessWidget {
  const CharactersScreenScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: _createBloc, child: child);
  }

  CharactersBloc _createBloc(BuildContext context) {
    final dependencies = context.read<AppDependencies>();
    final source = CharactersNetwork(dio: dependencies.dio);
    final repository = CharactersRepositoryImpl(source);
    return CharactersBloc(
      fetchCharactersUsecase: FetchCharactersUsecase(repository),
      searchDebounce: AppConst.searchDebounce,
    )..add(const CharactersEvent.load());
  }
}
