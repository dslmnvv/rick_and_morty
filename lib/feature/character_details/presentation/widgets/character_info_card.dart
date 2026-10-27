import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/character_details/presentation/widgets/character_info_row.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/presentation/utils/character_gender_ext.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class CharacterInfoCard extends StatelessWidget {
  const CharacterInfoCard({required this.character, super.key});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final dimensions = AppTheme.of(context).dimensions;
    final l10n = AppLocalizations.of(context);
    final type = character.type;
    final rows = [
      CharacterInfoRow(label: l10n.detailsSpecies, value: character.species),
      if (type != null) CharacterInfoRow(label: l10n.detailsType, value: type),
      CharacterInfoRow(
        label: l10n.detailsGender,
        value: character.gender.label(l10n),
      ),
      CharacterInfoRow(
        label: l10n.detailsOrigin,
        value: character.originName ?? l10n.valueUnknown,
      ),
      CharacterInfoRow(
        label: l10n.detailsLocation,
        value: character.locationName ?? l10n.valueUnknown,
      ),
      CharacterInfoRow(
        label: l10n.detailsEpisodes,
        value: '${character.episodeCount}',
      ),
    ];

    return Card(
      child: Column(
        children: [
          for (final (index, row) in rows.indexed) ...[
            if (index > 0)
              Divider(
                height: dimensions.dividerThickness,
                thickness: dimensions.dividerThickness,
                indent: dimensions.spacingL,
              ),
            row,
          ],
        ],
      ),
    );
  }
}
