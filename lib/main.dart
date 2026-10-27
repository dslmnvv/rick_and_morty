import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/app.dart';
import 'package:rick_and_morty/app/core/dependencies/app_dependencies.dart';

void main() {
  runApp(
    Provider<AppDependencies>(
      create: (_) => AppDependencies.create(),
      dispose: (_, dependencies) => dependencies.dispose(),
      child: const App(),
    ),
  );
}
