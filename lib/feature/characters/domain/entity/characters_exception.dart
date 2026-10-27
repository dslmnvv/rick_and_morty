import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';

class CharactersException implements Exception {
  const CharactersException(this.failure);

  final CharactersFailure failure;

  @override
  String toString() => 'CharactersException($failure)';
}
