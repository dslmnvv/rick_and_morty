// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$charactersRoute];

RouteBase get $charactersRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $CharactersRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'character/:id',
      hasOverriddenOnExit: false,
      factory: $CharacterDetailsRoute._fromState,
    ),
  ],
);

mixin $CharactersRoute on GoRouteData {
  static CharactersRoute _fromState(GoRouterState state) =>
      const CharactersRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CharacterDetailsRoute on GoRouteData {
  static CharacterDetailsRoute _fromState(GoRouterState state) =>
      CharacterDetailsRoute(
        id: int.parse(state.pathParameters['id']!),
        $extra: state.extra as CharacterEntity?,
      );

  CharacterDetailsRoute get _self => this as CharacterDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/character/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}
