import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_status.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/theme/app_colors.dart';

extension CharacterStatusExt on CharacterStatus {
  String label(AppLocalizations l10n) {
    return switch (this) {
      CharacterStatus.alive => l10n.statusAlive,
      CharacterStatus.dead => l10n.statusDead,
      CharacterStatus.unknown => l10n.statusUnknown,
    };
  }

  Color color(AppColors colors) {
    return switch (this) {
      CharacterStatus.alive => colors.statusAlive,
      CharacterStatus.dead => colors.statusDead,
      CharacterStatus.unknown => colors.statusUnknown,
    };
  }
}
