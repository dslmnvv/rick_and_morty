import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class AppStateView extends StatelessWidget {
  const AppStateView({
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final subtitle = this.subtitle;
    final actionLabel = this.actionLabel;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(theme.dimensions.spacingXl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: theme.dimensions.stateIconSize,
              color: theme.colors.textSecondary,
            ),
            SizedBox(height: theme.dimensions.spacingL),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium,
            ),
            if (subtitle != null) ...[
              SizedBox(height: theme.dimensions.spacingS),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: theme.colors.textSecondary,
                ),
              ),
            ],
            if (actionLabel != null) ...[
              SizedBox(height: theme.dimensions.spacingXl),
              FilledButton.tonal(onPressed: onAction, child: Text(actionLabel)),
            ],
          ],
        ),
      ),
    );
  }
}
