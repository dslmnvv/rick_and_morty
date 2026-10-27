import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/theme/app_theme.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => ColoredBox(color: colors.placeholder),
      errorWidget: (context, url, error) => ColoredBox(
        color: colors.placeholder,
        child: Center(
          child: Icon(Icons.person_outline, color: colors.textSecondary),
        ),
      ),
    );
  }
}
