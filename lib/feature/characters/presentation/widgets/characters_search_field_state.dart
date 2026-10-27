part of 'characters_search_field.dart';

class _CharactersSearchFieldState extends State<CharactersSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = AppTheme.of(context).dimensions;
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: dimensions.spacingL,
        right: dimensions.spacingL,
        bottom: dimensions.spacingM,
      ),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _controller,
        builder: (context, value, child) => TextField(
          controller: _controller,
          onChanged: _search,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: l10n.searchHint,
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: value.text.isEmpty
                ? null
                : IconButton(
                    tooltip: l10n.searchClear,
                    icon: const Icon(Icons.close_rounded),
                    onPressed: _clear,
                  ),
          ),
        ),
      ),
    );
  }

  void _search(String query) {
    context.read<CharactersBloc>().add(CharactersEvent.search(query));
  }

  void _clear() {
    _controller.clear();
    _search('');
  }
}
