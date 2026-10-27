import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/core/dependencies/app_dependencies.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: context.read<AppDependencies>().router.config,
    );
  }
}
