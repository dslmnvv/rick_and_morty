import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/characters/presentation/config/characters_screen_listener.dart';
import 'package:rick_and_morty/feature/characters/presentation/config/characters_screen_scope.dart';
import 'package:rick_and_morty/feature/characters/presentation/layout/characters_layout.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CharactersScreenScope(
      child: CharactersScreenListener(child: CharactersLayout()),
    );
  }
}
