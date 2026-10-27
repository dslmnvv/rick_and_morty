// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Rick and Morty';

  @override
  String get searchHint => 'Search by name';

  @override
  String get searchClear => 'Clear';

  @override
  String get retry => 'Retry';

  @override
  String get emptyTitle => 'Nobody found';

  @override
  String get emptySubtitle => 'Try changing the query';

  @override
  String get errorConnection => 'No internet connection';

  @override
  String get errorUnknown => 'Something went wrong';

  @override
  String get errorNextPage => 'Failed to load the next page';

  @override
  String get errorRefresh => 'Failed to refresh the list';

  @override
  String get statusAlive => 'Alive';

  @override
  String get statusDead => 'Dead';

  @override
  String get statusUnknown => 'Unknown';

  @override
  String get genderFemale => 'Female';

  @override
  String get genderMale => 'Male';

  @override
  String get genderGenderless => 'Genderless';

  @override
  String get genderUnknown => 'Unknown';

  @override
  String get detailsSpecies => 'Species';

  @override
  String get detailsType => 'Type';

  @override
  String get detailsGender => 'Gender';

  @override
  String get detailsOrigin => 'Origin';

  @override
  String get detailsLocation => 'Last known location';

  @override
  String get detailsEpisodes => 'Episodes';

  @override
  String get valueUnknown => 'Unknown';

  @override
  String statusWithSpecies(String status, String species) {
    return '$status · $species';
  }
}
