import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/core/dependencies/app_dependencies.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/presentation/utils/character_hero_tag.dart';
import 'package:rick_and_morty/feature/characters/presentation/widgets/character_status_badge.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_network_image.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({required this.character, super.key});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final locationName = character.locationName;

    return Card(
      child: InkWell(
        onTap: () => context.read<AppDependencies>().router.toCharacterDetails(
          context,
          character,
        ),
        child: Row(
          children: [
            SizedBox.square(
              dimension: theme.dimensions.tileImageSize,
              child: Hero(
                tag: CharacterHeroTag.image(character.id),
                child: AppNetworkImage(url: character.imageUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.dimensions.spacingL,
                  vertical: theme.dimensions.spacingM,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: theme.dimensions.spacingXs),
                    CharacterStatusBadge(
                      status: character.status,
                      species: character.species,
                    ),
                    if (locationName != null) ...[
                      SizedBox(height: theme.dimensions.spacingXs),
                      Text(
                        locationName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall?.copyWith(
                          color: theme.colors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: theme.dimensions.spacingS),
              child: Icon(
                Icons.chevron_right_rounded,
                color: theme.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
