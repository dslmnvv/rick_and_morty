import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/character_details/bloc/character_details_bloc.dart';

class CharacterDetailsTitle extends StatelessWidget {
  const CharacterDetailsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CharacterDetailsBloc, CharacterDetailsState, String?>(
      selector: (state) => state.character?.name,
      builder: (context, name) => name == null
          ? const SizedBox.shrink()
          : Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
