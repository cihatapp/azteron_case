import 'package:azteron_case/core/theme/app_theme.dart';
import 'package:azteron_case/core/theme/light/color_scheme_light.dart';
import 'package:azteron_case/core/theme/light/text_theme_light.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Light theme implementation - Singleton pattern
final class LightTheme extends AppTheme {
  /// Factory constructor - Singleton pattern
  factory LightTheme() => _instance ??= LightTheme._init();

  LightTheme._init();

  static LightTheme? _instance;

  /// Color scheme singleton
  final ColorSchemeLight colors = ColorSchemeLight();

  /// Text theme singleton
  final TextThemeLight textTheme = TextThemeLight();

  @override
  ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colors.colorScheme,
    textTheme: GoogleFonts.interTextTheme(textTheme.textTheme),

    // AppBar
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 1,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      surfaceTintColor: Colors.transparent,
    ),

    // Card
    cardTheme: CardThemeData(
      elevation: AppTheme.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
      ),
    ),

    // Input decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.surfaceContainerLow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius / 2),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius / 2),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius / 2),
        borderSide: BorderSide(color: colors.primary),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    ),

    // Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadius / 2),
        ),
      ),
    ),

    // Bottom navigation
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colors.surface,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.onSurfaceVariant,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Divider
    dividerTheme: DividerThemeData(
      color: colors.outlineVariant,
      thickness: 1,
    ),

    // Scaffold
    scaffoldBackgroundColor: colors.surface,
  );
}
