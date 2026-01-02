import 'package:azteron_case/core/theme/dark/color_scheme_dark.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Dark theme text styles - Singleton pattern
/// Uses Google Fonts Rubik for consistent typography
final class TextThemeDark {
  /// Factory constructor - Singleton pattern
  factory TextThemeDark() => _instance ??= TextThemeDark._init();

  TextThemeDark._init();

  static TextThemeDark? _instance;

  /// Font family with fallback
  String get _fontFamily {
    try {
      return GoogleFonts.rubik().fontFamily ?? 'Roboto';
    } on Exception {
      return 'Roboto';
    }
  }

  /// Colors from color scheme
  ColorSchemeDark get _colors => ColorSchemeDark();

  // Display styles - Negative letter spacing for visual cohesion (-3%)
  TextStyle get displayLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 57,
        height: 1.12,
        letterSpacing: -1.7,
        color: _colors.onSurface,
      );

  TextStyle get displayMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 45,
        height: 1.16,
        letterSpacing: -1.35,
        color: _colors.onSurface,
      );

  TextStyle get displaySmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 36,
        height: 1.22,
        letterSpacing: -1,
        color: _colors.onSurface,
      );

  // Headline styles - Negative letter spacing (-2.5%)
  TextStyle get headlineLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 32,
        height: 1.25,
        letterSpacing: -0.8,
        color: _colors.onSurface,
      );

  TextStyle get headlineMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 28,
        height: 1.29,
        letterSpacing: -0.7,
        color: _colors.onSurface,
      );

  TextStyle get headlineSmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: 1.33,
        letterSpacing: -0.5,
        color: _colors.onSurface,
      );

  // Title styles - Negative letter spacing (-1.5% to -1.8%)
  TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 22,
        height: 1.27,
        letterSpacing: -0.4,
        color: _colors.onSurface,
      );

  TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        letterSpacing: -0.25,
        color: _colors.onSurface,
      );

  TextStyle get titleSmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.43,
        letterSpacing: -0.15,
        color: _colors.onSurface,
      );

  // Body styles - Reduced positive spacing for cleaner look
  TextStyle get bodyLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.15,
        color: _colors.onSurface,
      );

  TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.1,
        color: _colors.onSurface,
      );

  TextStyle get bodySmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33,
        letterSpacing: 0.2,
        color: _colors.onSurface,
      );

  // Label styles - Reduced positive spacing
  TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.1,
        color: _colors.onSurface,
      );

  TextStyle get labelMedium => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.33,
        letterSpacing: 0.3,
        color: _colors.onSurface,
      );

  TextStyle get labelSmall => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: 1.45,
        letterSpacing: 0.3,
        color: _colors.onSurface,
      );

  /// Get the full TextTheme for Flutter
  TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );
}
