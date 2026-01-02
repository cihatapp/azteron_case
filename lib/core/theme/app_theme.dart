import 'package:flutter/material.dart';

/// Abstract base class for all app themes
/// Following singleton pattern for consistent theme access
abstract class AppTheme {
  /// The ThemeData for this theme
  ThemeData? theme;

  /// Global border radius for cards, dialogs, sheets, buttons
  static const double borderRadius = 24;

  /// Consistent elevation for cards
  static const double cardElevation = 2;
}
