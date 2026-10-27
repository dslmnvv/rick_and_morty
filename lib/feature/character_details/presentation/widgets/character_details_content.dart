import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/character_details/presentation/widgets/character_info_card.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/presentation/utils/character_hero_tag.dart';
import 'package:rick_and_morty/feature/characters/presentation/widgets/character_status_badge.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';
import 'package:rick_and_morty/ui_kit/widgets/app_network_image.dart';

class CharacterDetailsContent extends StatelessWidget {
  const CharacterDetailsContent({required this.character, super.key});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final dimensions = AppTheme.of(context).dimensions;

    return ListView(
      padding: EdgeInsets.all(dimensions.spacingL),
      children: [
        Card(
          child: AspectRatio(
            aspectRatio: dimensions.detailsImageAspectRatio,
            child: Hero(
              tag: CharacterHeroTag.image(character.id),
              child: AppNetworkImage(url: character.imageUrl),
            ),
          ),
        ),
        SizedBox(height: dimensions.spacingXl),
        Text(
          character.name,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: dimensions.spacingS),
        CharacterStatusBadge(status: character.status),
        SizedBox(height: dimensions.spacingXl),
        CharacterInfoCard(character: character),
      ],
    );
  }
}
