part of 'app_routes.dart';

class CharacterDetailsRoute extends GoRouteData with $CharacterDetailsRoute {
  const CharacterDetailsRoute({required this.id, this.$extra});

  final int id;
  final CharacterEntity? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CharacterDetailsScreen(characterId: id, initialCharacter: $extra);
  }
}
