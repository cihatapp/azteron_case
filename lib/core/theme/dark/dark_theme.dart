import 'package:azteron_case/core/theme/app_theme.dart';
import 'package:azteron_case/core/theme/dark/color_scheme_dark.dart';
import 'package:azteron_case/core/theme/dark/text_theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Dark theme implementation - Singleton pattern
/// Nature-inspired green Material 3 theme
final class DarkTheme extends AppTheme {
  /// Factory constructor - Singleton pattern
  factory DarkTheme() => _instance ??= DarkTheme._init();

  DarkTheme._init();

  static DarkTheme? _instance;

  /// Color scheme singleton
  ColorSchemeDark get colors => ColorSchemeDark();

  /// Text theme singleton
  TextThemeDark get textStyles => TextThemeDark();

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: colors.colorScheme,
        textTheme: textStyles.textTheme,
        fontFamily: _fontFamily,
        scaffoldBackgroundColor: colors.surface,

        // AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: colors.onSurface),
          titleTextStyle: textStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colors.surface,
          selectedItemColor: colors.primary,
          unselectedItemColor: colors.onSurfaceVariant,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: textStyles.labelSmall,
          unselectedLabelStyle: textStyles.labelSmall,
        ),

        // Navigation Bar (Material 3)
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: colors.surface,
          indicatorColor: colors.primary.withValues(alpha: 0.2),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: colors.primary);
            }
            return IconThemeData(color: colors.onSurfaceVariant);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return textStyles.labelSmall.copyWith(color: colors.primary);
            }
            return textStyles.labelSmall.copyWith(
              color: colors.onSurfaceVariant,
            );
          }),
        ),

        // Cards
        cardTheme: CardThemeData(
          color: colors.card,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
          ),
          margin: EdgeInsets.zero,
        ),

        // Elevated Button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            ),
            textStyle: textStyles.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Outlined Button
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: colors.onSurface,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            ),
            side: BorderSide(color: colors.outline),
          ),
        ),

        // Text Button
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: colors.primary,
            textStyle: textStyles.labelLarge,
          ),
        ),

        // Input Decoration
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colors.surfaceContainerHigh,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            borderSide: BorderSide(color: colors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            borderSide: BorderSide(color: colors.error),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          hintStyle: textStyles.bodyLarge.copyWith(color: colors.outline),
          prefixIconColor: colors.onSurfaceVariant,
          suffixIconColor: colors.onSurfaceVariant,
        ),

        // Chip
        chipTheme: ChipThemeData(
          backgroundColor: colors.surfaceContainerHigh,
          selectedColor: colors.primary.withValues(alpha: 0.2),
          disabledColor: colors.surfaceContainerHigh,
          labelStyle: textStyles.labelMedium,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide.none,
        ),

        // Bottom Sheet
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colors.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppTheme.borderRadius),
            ),
          ),
          dragHandleColor: colors.outline,
          dragHandleSize: const Size(40, 4),
        ),

        // Dialog
        dialogTheme: DialogThemeData(
          backgroundColor: colors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
          ),
        ),

        // Divider
        dividerTheme: DividerThemeData(
          color: colors.divider,
          thickness: 1,
          space: 1,
        ),

        // Floating Action Button
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // List Tile
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          iconColor: colors.onSurfaceVariant,
          textColor: colors.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        // Icon
        iconTheme: IconThemeData(
          color: colors.onSurface,
          size: 24,
        ),

        // Snackbar
        snackBarTheme: SnackBarThemeData(
          backgroundColor: colors.surfaceContainerHigh,
          contentTextStyle: textStyles.bodyMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

  String get _fontFamily {
    try {
      return GoogleFonts.rubik().fontFamily ?? 'Roboto';
    } on Exception {
      return 'Roboto';
    }
  }
}
