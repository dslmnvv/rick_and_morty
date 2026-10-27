import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class CharacterInfoRow extends StatelessWidget {
  const CharacterInfoRow({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.dimensions.spacingL,
        vertical: theme.dimensions.spacingM,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                color: theme.colors.textSecondary,
              ),
            ),
          ),
          SizedBox(width: theme.dimensions.spacingL),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
