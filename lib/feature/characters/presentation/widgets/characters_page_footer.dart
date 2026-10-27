import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_page_status.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class CharactersPageFooter extends StatelessWidget {
  const CharactersPageFooter({required this.pageStatus, super.key});

  final CharactersPageStatus pageStatus;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: theme.dimensions.spacingM),
      child: Center(
        child: switch (pageStatus) {
          CharactersPageStatus.failure => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.errorNextPage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: theme.colors.textSecondary,
                ),
              ),
              TextButton(
                onPressed: () => context.read<CharactersBloc>().add(
                  const CharactersEvent.retry(),
                ),
                child: Text(l10n.retry),
              ),
            ],
          ),
          CharactersPageStatus.idle ||
          CharactersPageStatus.loading => SizedBox.square(
            dimension: theme.dimensions.pageLoaderSize,
            child: CircularProgressIndicator(
              strokeWidth: theme.dimensions.loaderStrokeWidth,
            ),
          ),
        },
      ),
    );
  }
}
