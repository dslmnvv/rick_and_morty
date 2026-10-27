part of 'app_routes.dart';

@TypedGoRoute<CharactersRoute>(
  path: '/',
  routes: [TypedGoRoute<CharacterDetailsRoute>(path: 'character/:id')],
)
class CharactersRoute extends GoRouteData with $CharactersRoute {
  const CharactersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CharactersScreen();
  }
}
