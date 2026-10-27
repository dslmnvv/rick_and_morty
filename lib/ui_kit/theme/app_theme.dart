import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/theme/app_colors.dart';
import 'package:rick_and_morty/ui_kit/theme/app_dimensions.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.colors,
    this.dimensions = const AppDimensions(),
  });

  static AppTheme of(BuildContext context) =>
      Theme.of(context).extension<AppTheme>()!;

  final AppColors colors;
  final AppDimensions dimensions;

  @override
  AppTheme copyWith({AppColors? colors, AppDimensions? dimensions}) {
    return AppTheme(
      colors: colors ?? this.colors,
      dimensions: dimensions ?? this.dimensions,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double progress) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      colors: colors.lerp(other.colors, progress),
      dimensions: progress < 0.5 ? dimensions : other.dimensions,
    );
  }
}
