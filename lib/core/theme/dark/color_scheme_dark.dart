import 'package:flutter/material.dart';

/// Dark theme color scheme - Singleton pattern
/// Modern dark theme with vibrant pink accent
class ColorSchemeDark {
  /// Factory constructor - Singleton pattern
  factory ColorSchemeDark() => _instance ??= ColorSchemeDark._init();

  ColorSchemeDark._init();

  static ColorSchemeDark? _instance;

  // Primary colors - Vibrant rose pink (maintains brand identity)
  final Color primary = const Color(0xFFFF4081);
  final Color onPrimary = const Color(0xFFFFFFFF);
  final Color primaryContainer = const Color(0xFF6D1B3D);
  final Color onPrimaryContainer = const Color(0xFFFFD9E4);
  final Color primaryFixed = const Color(0xFFFFD9E4);
  final Color primaryFixedDim = const Color(0xFFFF80AB);
  final Color onPrimaryFixed = const Color(0xFF3E001D);
  final Color onPrimaryFixedVariant = const Color(0xFF6D1B3D);

  // Secondary colors - Neutral warm gray
  final Color secondary = const Color(0xFFCDBFC4);
  final Color onSecondary = const Color(0xFF352F31);
  final Color secondaryContainer = const Color(0xFF4C4547);
  final Color onSecondaryContainer = const Color(0xFFE9DBDF);
  final Color secondaryFixed = const Color(0xFFE9DBDF);
  final Color secondaryFixedDim = const Color(0xFFCDBFC4);
  final Color onSecondaryFixed = const Color(0xFF1F1A1C);
  final Color onSecondaryFixedVariant = const Color(0xFF4C4547);

  // Tertiary colors - Soft peach for accents
  final Color tertiary = const Color(0xFFE8B998);
  final Color onTertiary = const Color(0xFF3D2515);
  final Color tertiaryContainer = const Color(0xFF553B28);
  final Color onTertiaryContainer = const Color(0xFFFFDCC8);
  final Color tertiaryFixed = const Color(0xFFFFDCC8);
  final Color tertiaryFixedDim = const Color(0xFFE8B998);
  final Color onTertiaryFixed = const Color(0xFF251104);
  final Color onTertiaryFixedVariant = const Color(0xFF553B28);

  // Error colors - Softer red for dark mode
  final Color error = const Color(0xFFFF6B6B);
  final Color onError = const Color(0xFF4A0F0F);
  final Color errorContainer = const Color(0xFF731F1F);
  final Color onErrorContainer = const Color(0xFFFFDAD6);

  // Surface colors - Clean neutral grays (NO pink/brown tint)
  final Color surface = const Color(0xFF121212);
  final Color onSurface = const Color(0xFFEBEBEB);
  final Color surfaceDim = const Color(0xFF0D0D0D);
  final Color surfaceBright = const Color(0xFF383838);
  final Color surfaceContainerLowest = const Color(0xFF0A0A0A);
  final Color surfaceContainerLow = const Color(0xFF1A1A1A);
  final Color surfaceContainer = const Color(0xFF1E1E1E);
  final Color surfaceContainerHigh = const Color(0xFF282828);
  final Color surfaceContainerHighest = const Color(0xFF333333);
  final Color onSurfaceVariant = const Color(0xFFB8B8B8);

  // Outline colors
  final Color outline = const Color(0xFF6E6E6E);
  final Color outlineVariant = const Color(0xFF444444);

  // Other colors
  final Color shadow = const Color(0xFF000000);
  final Color scrim = const Color(0xFF000000);
  final Color inverseSurface = const Color(0xFFEBEBEB);
  final Color onInverseSurface = const Color(0xFF1A1A1A);
  final Color inversePrimary = const Color(0xFFE91E63);
  final Color surfaceTint = const Color(0xFFFF4081);

  // Chat-specific colors - Clear distinction
  final Color sentBubble = const Color(0xFF3D2832);
  final Color sentBubbleText = const Color(0xFFFFFFFF);
  final Color receivedBubble = const Color(0xFF2A2A2A);
  final Color receivedBubbleText = const Color(0xFFFFFFFF);
  final Color onlineIndicator = const Color(0xFF4ADE80);
  final Color offlineIndicator = const Color(0xFF6B6B6B);

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
