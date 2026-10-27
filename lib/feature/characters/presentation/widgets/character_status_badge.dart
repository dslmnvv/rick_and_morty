import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_status.dart';
import 'package:rick_and_morty/feature/characters/presentation/utils/character_status_ext.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class CharacterStatusBadge extends StatelessWidget {
  const CharacterStatusBadge({required this.status, this.species, super.key});

  final CharacterStatus status;
  final String? species;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context);
    final statusLabel = status.label(l10n);
    final species = this.species;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: theme.dimensions.statusDotSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: status.color(theme.colors),
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox(width: theme.dimensions.spacingS),
        Flexible(
          child: Text(
            species == null
                ? statusLabel
                : l10n.statusWithSpecies(statusLabel, species),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
