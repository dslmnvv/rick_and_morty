import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/characters_failure.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';

extension CharactersFailureExt on CharactersFailure {
  String message(AppLocalizations l10n) {
    return switch (this) {
      CharactersFailure.connection => l10n.errorConnection,
      CharactersFailure.unknown => l10n.errorUnknown,
    };
  }

  IconData get icon {
    return switch (this) {
      CharactersFailure.connection => Icons.wifi_off_rounded,
      CharactersFailure.unknown => Icons.error_outline_rounded,
    };
  }
}
