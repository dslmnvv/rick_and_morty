import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/l10n/gen/app_localizations.dart';

class CharactersScreenListener extends StatelessWidget {
  const CharactersScreenListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharactersBloc, CharactersState>(
      listenWhen: (previous, current) =>
          !previous.refreshFailed && current.refreshFailed,
      listener: (context, state) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(l10n.errorRefresh)));
      },
      child: child,
    );
  }
}
