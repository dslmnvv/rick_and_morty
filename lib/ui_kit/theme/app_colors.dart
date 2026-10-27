import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.divider,
    required this.placeholder,
    required this.statusAlive,
    required this.statusDead,
    required this.statusUnknown,
  });

  static const light = AppColors(
    background: Color(0xFFF3F5F7),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF16181C),
    textSecondary: Color(0xFF6B7280),
    accent: Color(0xFF3FA535),
    divider: Color(0xFFE3E6EA),
    placeholder: Color(0xFFE9ECEF),
    statusAlive: Color(0xFF34C759),
    statusDead: Color(0xFFE5484D),
    statusUnknown: Color(0xFF9CA3AF),
  );

  static const dark = AppColors(
    background: Color(0xFF111316),
    surface: Color(0xFF1C1F24),
    textPrimary: Color(0xFFF2F4F7),
    textSecondary: Color(0xFF9AA1AC),
    accent: Color(0xFF97CE4C),
    divider: Color(0xFF2C3036),
    placeholder: Color(0xFF262A30),
    statusAlive: Color(0xFF55D66B),
    statusDead: Color(0xFFFF6369),
    statusUnknown: Color(0xFF8B929C),
  );

  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color accent;
  final Color divider;
  final Color placeholder;
  final Color statusAlive;
  final Color statusDead;
  final Color statusUnknown;

  AppColors lerp(AppColors other, double progress) {
    return AppColors(
      background: Color.lerp(background, other.background, progress)!,
      surface: Color.lerp(surface, other.surface, progress)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, progress)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, progress)!,
      accent: Color.lerp(accent, other.accent, progress)!,
      divider: Color.lerp(divider, other.divider, progress)!,
      placeholder: Color.lerp(placeholder, other.placeholder, progress)!,
      statusAlive: Color.lerp(statusAlive, other.statusAlive, progress)!,
      statusDead: Color.lerp(statusDead, other.statusDead, progress)!,
      statusUnknown: Color.lerp(statusUnknown, other.statusUnknown, progress)!,
    );
  }
}
