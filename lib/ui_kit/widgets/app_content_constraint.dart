import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class AppContentConstraint extends StatelessWidget {
  const AppContentConstraint({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: AppTheme.of(context).dimensions.contentMaxWidth,
        ),
        child: SizedBox.expand(child: child),
      ),
    );
  }
}
