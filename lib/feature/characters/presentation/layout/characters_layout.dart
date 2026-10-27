import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/characters/presentation/widgets/characters_body.dart';
import 'package:rick_and_morty/feature/characters/presentation/widgets/characters_search_field.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_content_constraint.dart';

class CharactersLayout extends StatelessWidget {
  const CharactersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).appTitle)),
      body: const AppContentConstraint(
        child: Column(
          children: [
            CharactersSearchField(),
            Expanded(child: CharactersBody()),
          ],
        ),
      ),
    );
  }
}
