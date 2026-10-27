import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/feature/characters/bloc/characters_page_status.dart';
import 'package:rick_and_morty/feature/characters/domain/entity/character_entity.dart';
import 'package:rick_and_morty/feature/characters/presentation/widgets/character_tile.dart';
import 'package:rick_and_morty/feature/characters/presentation/widgets/characters_page_footer.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    required this.characters,
    required this.hasMore,
    required this.pageStatus,
    super.key,
  });

  final List<CharacterEntity> characters;
  final bool hasMore;
  final CharactersPageStatus pageStatus;

  @override
  Widget build(BuildContext context) {
    final dimensions = AppTheme.of(context).dimensions;

    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) => _onScroll(context, notification),
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            left: dimensions.spacingL,
            right: dimensions.spacingL,
            bottom: dimensions.spacingXl,
          ),
          itemCount: characters.length + (hasMore ? 1 : 0),
          separatorBuilder: (context, index) =>
              SizedBox(height: dimensions.spacingM),
          itemBuilder: (context, index) => index < characters.length
              ? CharacterTile(character: characters[index])
              : CharactersPageFooter(pageStatus: pageStatus),
        ),
      ),
    );
  }

  bool _onScroll(BuildContext context, ScrollUpdateNotification notification) {
    final paginationExtent = AppTheme.of(context).dimensions.paginationExtent;
    final canLoadMore = hasMore && pageStatus == CharactersPageStatus.idle;
    if (canLoadMore && notification.metrics.extentAfter < paginationExtent) {
      context.read<CharactersBloc>().add(const CharactersEvent.loadNextPage());
    }
    return false;
  }

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<CharactersBloc>()
      ..add(const CharactersEvent.refresh());
    await bloc.stream.firstWhere(
      (state) => !state.isRefreshing,
      orElse: () => bloc.state,
    );
  }
}
