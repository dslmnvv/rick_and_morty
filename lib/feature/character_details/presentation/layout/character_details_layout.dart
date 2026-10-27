import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/character_details/bloc/character_details_bloc.dart';
import 'package:rick_and_morty/feature/character_details/bloc/character_details_status.dart';
import 'package:rick_and_morty/feature/character_details/presentation/widgets/character_details_content.dart';
import 'package:rick_and_morty/feature/character_details/presentation/widgets/character_details_title.dart';
import 'package:rick_and_morty/feature/characters/presentation/utils/characters_failure_ext.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_content_constraint.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_loader.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_state_view.dart';

class CharacterDetailsLayout extends StatelessWidget {
  const CharacterDetailsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: const CharacterDetailsTitle()),
      body: AppContentConstraint(
        child: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
          builder: (context, state) => switch (state) {
            CharacterDetailsState(character: final character?) =>
              CharacterDetailsContent(character: character),
            CharacterDetailsState(status: CharacterDetailsStatus.failure) =>
              AppStateView(
                icon: state.failure.icon,
                title: state.failure.message(l10n),
                actionLabel: l10n.retry,
                onAction: () => context.read<CharacterDetailsBloc>().add(
                  const CharacterDetailsEvent.load(),
                ),
              ),
            _ => const AppLoader(),
          },
        ),
      ),
    );
  }
}
