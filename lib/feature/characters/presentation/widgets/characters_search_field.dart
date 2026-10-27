import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

part 'characters_search_field_state.dart';

class CharactersSearchField extends StatefulWidget {
  const CharactersSearchField({super.key});

  @override
  State<CharactersSearchField> createState() => _CharactersSearchFieldState();
}
