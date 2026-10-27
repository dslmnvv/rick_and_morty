import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Rick and Morty'**
  String get appTitle;

  /// No description provided for @searchHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по имени'**
  String get searchHint;

  /// No description provided for @searchClear.
  ///
  /// In ru, this message translates to:
  /// **'Очистить'**
  String get searchClear;

  /// No description provided for @retry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;

  /// No description provided for @emptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Никого не нашли'**
  String get emptyTitle;

  /// No description provided for @emptySubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте изменить запрос'**
  String get emptySubtitle;

  /// No description provided for @errorConnection.
  ///
  /// In ru, this message translates to:
  /// **'Нет соединения с интернетом'**
  String get errorConnection;

  /// No description provided for @errorUnknown.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get errorUnknown;

  /// No description provided for @errorNextPage.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось загрузить следующую страницу'**
  String get errorNextPage;

  /// No description provided for @errorRefresh.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось обновить список'**
  String get errorRefresh;

  /// No description provided for @statusAlive.
  ///
  /// In ru, this message translates to:
  /// **'Жив'**
  String get statusAlive;

  /// No description provided for @statusDead.
  ///
  /// In ru, this message translates to:
  /// **'Мёртв'**
  String get statusDead;

  /// No description provided for @statusUnknown.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестно'**
  String get statusUnknown;

  /// No description provided for @genderFemale.
  ///
  /// In ru, this message translates to:
  /// **'Женский'**
  String get genderFemale;

  /// No description provided for @genderMale.
  ///
  /// In ru, this message translates to:
  /// **'Мужской'**
  String get genderMale;

  /// No description provided for @genderGenderless.
  ///
  /// In ru, this message translates to:
  /// **'Бесполый'**
  String get genderGenderless;

  /// No description provided for @genderUnknown.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестно'**
  String get genderUnknown;

  /// No description provided for @detailsSpecies.
  ///
  /// In ru, this message translates to:
  /// **'Вид'**
  String get detailsSpecies;

  /// No description provided for @detailsType.
  ///
  /// In ru, this message translates to:
  /// **'Подвид'**
  String get detailsType;

  /// No description provided for @detailsGender.
  ///
  /// In ru, this message translates to:
  /// **'Пол'**
  String get detailsGender;

  /// No description provided for @detailsOrigin.
  ///
  /// In ru, this message translates to:
  /// **'Происхождение'**
  String get detailsOrigin;

  /// No description provided for @detailsLocation.
  ///
  /// In ru, this message translates to:
  /// **'Последняя локация'**
  String get detailsLocation;

  /// No description provided for @detailsEpisodes.
  ///
  /// In ru, this message translates to:
  /// **'Эпизодов'**
  String get detailsEpisodes;

  /// No description provided for @valueUnknown.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестно'**
  String get valueUnknown;

  /// No description provided for @statusWithSpecies.
  ///
  /// In ru, this message translates to:
  /// **'{status} · {species}'**
  String statusWithSpecies(String status, String species);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
