import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/routing/app_routes.dart';

class AppRouter {
  AppRouter() : config = GoRouter(routes: $appRoutes);

  final GoRouter config;

  void toCharacterDetails(BuildContext context, CharacterEntity character) {
    unawaited(
      CharacterDetailsRoute(id: character.id, $extra: character).push(context),
    );
  }

  void dispose() => config.dispose();
}
