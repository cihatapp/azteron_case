import 'package:flutter/material.dart';

/// Light theme color scheme - Singleton pattern
/// Pink/Red palette - Dating/messaging app identity
class ColorSchemeLight {
  /// Factory constructor - Singleton pattern
  factory ColorSchemeLight() => _instance ??= ColorSchemeLight._init();

  ColorSchemeLight._init();

  static ColorSchemeLight? _instance;

  // Primary colors - Pink/Red (dating/messaging app identity)
  final Color primary = const Color(0xFFE91E63);
  final Color onPrimary = const Color(0xFFFFFFFF);
  final Color primaryContainer = const Color(0xFFFFD9E2);
  final Color onPrimaryContainer = const Color(0xFF3E001D);
  final Color primaryFixed = const Color(0xFFFFD9E2);
  final Color primaryFixedDim = const Color(0xFFFFB1C8);
  final Color onPrimaryFixed = const Color(0xFF3E001D);
  final Color onPrimaryFixedVariant = const Color(0xFF8C0D3E);

  // Secondary colors - Warm neutral (complement)
  final Color secondary = const Color(0xFF74565F);
  final Color onSecondary = const Color(0xFFFFFFFF);
  final Color secondaryContainer = const Color(0xFFFFD9E2);
  final Color onSecondaryContainer = const Color(0xFF2B151C);
  final Color secondaryFixed = const Color(0xFFFFD9E2);
  final Color secondaryFixedDim = const Color(0xFFE3BDC6);
  final Color onSecondaryFixed = const Color(0xFF2B151C);
  final Color onSecondaryFixedVariant = const Color(0xFF5A3F47);

  // Tertiary colors - Soft coral for variety
  final Color tertiary = const Color(0xFF7C5635);
  final Color onTertiary = const Color(0xFFFFFFFF);
  final Color tertiaryContainer = const Color(0xFFFFDCC2);
  final Color onTertiaryContainer = const Color(0xFF2E1500);
  final Color tertiaryFixed = const Color(0xFFFFDCC2);
  final Color tertiaryFixedDim = const Color(0xFFEFBD94);
  final Color onTertiaryFixed = const Color(0xFF2E1500);
  final Color onTertiaryFixedVariant = const Color(0xFF623F20);

  // Error colors
  final Color error = const Color(0xFFBA1A1A);
  final Color onError = const Color(0xFFFFFFFF);
  final Color errorContainer = const Color(0xFFFFDAD6);
  final Color onErrorContainer = const Color(0xFF410002);

  // Surface colors - Clean, neutral
  final Color surface = const Color(0xFFFFFBFF);
  final Color onSurface = const Color(0xFF201A1B);
  final Color surfaceDim = const Color(0xFFE4D7D9);
  final Color surfaceBright = const Color(0xFFFFFBFF);
  final Color surfaceContainerLowest = const Color(0xFFFFFFFF);
  final Color surfaceContainerLow = const Color(0xFFFEF1F3);
  final Color surfaceContainer = const Color(0xFFF8EBEC);
  final Color surfaceContainerHigh = const Color(0xFFF3E5E7);
  final Color surfaceContainerHighest = const Color(0xFFEDE0E1);
  final Color onSurfaceVariant = const Color(0xFF514347);

  // Outline colors
  final Color outline = const Color(0xFF847377);
  final Color outlineVariant = const Color(0xFFD5C2C6);

  // Other colors
  final Color shadow = const Color(0xFF000000);
  final Color scrim = const Color(0xFF000000);
  final Color inverseSurface = const Color(0xFF362F30);
  final Color onInverseSurface = const Color(0xFFFAEEEF);
  final Color inversePrimary = const Color(0xFFFFB1C8);
  final Color surfaceTint = const Color(0xFFE91E63);

  // Chat-specific colors (accessible via extension)
  final Color sentBubble = const Color(0xFFFFEBEE);
  final Color sentBubbleText = const Color(0xFF1A1A1A);
  final Color receivedBubble = const Color(0xFFF5F5F5);
  final Color receivedBubbleText = const Color(0xFF1A1A1A);
  final Color onlineIndicator = const Color(0xFF4CAF50);
  final Color offlineIndicator = const Color(0xFF9E9E9E);

  /// Get the full ColorScheme for Flutter
  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.light,
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
