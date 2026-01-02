import 'package:flutter/material.dart';

/// Dark theme color scheme - Singleton pattern
/// Pink/Red palette - Dating/messaging app identity
class ColorSchemeDark {
  /// Factory constructor - Singleton pattern
  factory ColorSchemeDark() => _instance ??= ColorSchemeDark._init();

  ColorSchemeDark._init();

  static ColorSchemeDark? _instance;

  // Primary colors - Soft pink for dark mode
  final Color primary = const Color(0xFFFFB1C8);
  final Color onPrimary = const Color(0xFF5E1133);
  final Color primaryContainer = const Color(0xFF7D294A);
  final Color onPrimaryContainer = const Color(0xFFFFD9E2);
  final Color primaryFixed = const Color(0xFFFFD9E2);
  final Color primaryFixedDim = const Color(0xFFFFB1C8);
  final Color onPrimaryFixed = const Color(0xFF3E001D);
  final Color onPrimaryFixedVariant = const Color(0xFF7D294A);

  // Secondary colors - Muted pink-gray
  final Color secondary = const Color(0xFFE3BDC6);
  final Color onSecondary = const Color(0xFF422931);
  final Color secondaryContainer = const Color(0xFF5A3F47);
  final Color onSecondaryContainer = const Color(0xFFFFD9E2);
  final Color secondaryFixed = const Color(0xFFFFD9E2);
  final Color secondaryFixedDim = const Color(0xFFE3BDC6);
  final Color onSecondaryFixed = const Color(0xFF2B151C);
  final Color onSecondaryFixedVariant = const Color(0xFF5A3F47);

  // Tertiary colors - Soft coral for variety
  final Color tertiary = const Color(0xFFEFBD94);
  final Color onTertiary = const Color(0xFF48290C);
  final Color tertiaryContainer = const Color(0xFF623F20);
  final Color onTertiaryContainer = const Color(0xFFFFDCC2);
  final Color tertiaryFixed = const Color(0xFFFFDCC2);
  final Color tertiaryFixedDim = const Color(0xFFEFBD94);
  final Color onTertiaryFixed = const Color(0xFF2E1500);
  final Color onTertiaryFixedVariant = const Color(0xFF623F20);

  // Error colors
  final Color error = const Color(0xFFFFB4AB);
  final Color onError = const Color(0xFF690005);
  final Color errorContainer = const Color(0xFF93000A);
  final Color onErrorContainer = const Color(0xFFFFDAD6);

  // Surface colors - Clean, neutral dark
  final Color surface = const Color(0xFF191113);
  final Color onSurface = const Color(0xFFEDE0E1);
  final Color surfaceDim = const Color(0xFF191113);
  final Color surfaceBright = const Color(0xFF413738);
  final Color surfaceContainerLowest = const Color(0xFF140C0E);
  final Color surfaceContainerLow = const Color(0xFF22191B);
  final Color surfaceContainer = const Color(0xFF261D1F);
  final Color surfaceContainerHigh = const Color(0xFF312829);
  final Color surfaceContainerHighest = const Color(0xFF3C3234);
  final Color onSurfaceVariant = const Color(0xFFD5C2C6);

  // Outline colors
  final Color outline = const Color(0xFF9E8C90);
  final Color outlineVariant = const Color(0xFF514347);

  // Other colors
  final Color shadow = const Color(0xFF000000);
  final Color scrim = const Color(0xFF000000);
  final Color inverseSurface = const Color(0xFFEDE0E1);
  final Color onInverseSurface = const Color(0xFF362F30);
  final Color inversePrimary = const Color(0xFFB01B58);
  final Color surfaceTint = const Color(0xFFFFB1C8);

  // Chat-specific colors
  final Color sentBubble = const Color(0xFF5E1133);
  final Color sentBubbleText = const Color(0xFFFFFFFF);
  final Color receivedBubble = const Color(0xFF3C3234);
  final Color receivedBubbleText = const Color(0xFFFFFFFF);
  final Color onlineIndicator = const Color(0xFF81C784);
  final Color offlineIndicator = const Color(0xFF757575);

  // Convenience aliases for backward compatibility
  Color get background => surface;
  Color get card => surfaceContainerHigh;
  Color get divider => outlineVariant;

  /// Get the full ColorScheme for Flutter
  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        primaryFixed: primaryFixed,
        primaryFixedDim: primaryFixedDim,
        onPrimaryFixed: onPrimaryFixed,
        onPrimaryFixedVariant: onPrimaryFixedVariant,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        secondaryFixed: secondaryFixed,
        secondaryFixedDim: secondaryFixedDim,
        onSecondaryFixed: onSecondaryFixed,
        onSecondaryFixedVariant: onSecondaryFixedVariant,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        tertiaryFixed: tertiaryFixed,
        tertiaryFixedDim: tertiaryFixedDim,
        onTertiaryFixed: onTertiaryFixed,
        onTertiaryFixedVariant: onTertiaryFixedVariant,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainerLowest: surfaceContainerLowest,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainer: surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: shadow,
        scrim: scrim,
        inverseSurface: inverseSurface,
        onInverseSurface: onInverseSurface,
        inversePrimary: inversePrimary,
        surfaceTint: surfaceTint,
      );
}
