import 'package:rick_and_morty/feature/characters/domain/entity/character_gender.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';

extension CharacterGenderExt on CharacterGender {
  String label(AppLocalizations l10n) {
    return switch (this) {
      CharacterGender.female => l10n.genderFemale,
      CharacterGender.male => l10n.genderMale,
      CharacterGender.genderless => l10n.genderGenderless,
      CharacterGender.unknown => l10n.genderUnknown,
    };
  }
}
