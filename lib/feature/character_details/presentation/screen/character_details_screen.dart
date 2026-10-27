import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/character_details/presentation/config/character_details_screen_scope.dart';
import 'package:rick_and_morty/feature/character_details/presentation/layout/character_details_layout.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({
    required this.characterId,
    this.initialCharacter,
    super.key,
  });

  final int characterId;
  final CharacterEntity? initialCharacter;

  @override
  Widget build(BuildContext context) {
    return CharacterDetailsScreenScope(
      characterId: characterId,
      initialCharacter: initialCharacter,
      child: const CharacterDetailsLayout(),
    );
  }
}
