// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Rick and Morty';

  @override
  String get searchHint => 'Поиск по имени';

  @override
  String get searchClear => 'Очистить';

  @override
  String get retry => 'Повторить';

  @override
  String get emptyTitle => 'Никого не нашли';

  @override
  String get emptySubtitle => 'Попробуйте изменить запрос';

  @override
  String get errorConnection => 'Нет соединения с интернетом';

  @override
  String get errorUnknown => 'Что-то пошло не так';

  @override
  String get errorNextPage => 'Не удалось загрузить следующую страницу';

  @override
  String get errorRefresh => 'Не удалось обновить список';

  @override
  String get statusAlive => 'Жив';

  @override
  String get statusDead => 'Мёртв';

  @override
  String get statusUnknown => 'Неизвестно';

  @override
  String get genderFemale => 'Женский';

  @override
  String get genderMale => 'Мужской';

  @override
  String get genderGenderless => 'Бесполый';

  @override
  String get genderUnknown => 'Неизвестно';

  @override
  String get detailsSpecies => 'Вид';

  @override
  String get detailsType => 'Подвид';

  @override
  String get detailsGender => 'Пол';

  @override
  String get detailsOrigin => 'Происхождение';

  @override
  String get detailsLocation => 'Последняя локация';

  @override
  String get detailsEpisodes => 'Эпизодов';

  @override
  String get valueUnknown => 'Неизвестно';

  @override
  String statusWithSpecies(String status, String species) {
    return '$status · $species';
  }
}
