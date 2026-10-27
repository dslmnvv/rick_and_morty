import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_status.dart';
import 'package:rick_and_morty/feature/characters/presentation/utils/characters_failure_ext.dart';
import 'package:rick_and_morty/feature/characters/presentation/widgets/characters_list.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_loader.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_state_view.dart';

class CharactersBody extends StatelessWidget {
  const CharactersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) => switch (state.status) {
        CharactersStatus.initial ||
        CharactersStatus.loading => const AppLoader(),
        CharactersStatus.failure => AppStateView(
          icon: state.failure.icon,
          title: state.failure.message(l10n),
          actionLabel: l10n.retry,
          onAction: () =>
              context.read<CharactersBloc>().add(const CharactersEvent.retry()),
        ),
        CharactersStatus.success when state.isEmpty => AppStateView(
          icon: Icons.person_search_rounded,
          title: l10n.emptyTitle,
          subtitle: l10n.emptySubtitle,
        ),
        CharactersStatus.success => CharactersList(
          characters: state.characters,
          hasMore: state.hasMore,
          pageStatus: state.pageStatus,
        ),
      },
    );
  }
}
