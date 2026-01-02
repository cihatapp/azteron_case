import 'package:azteron_case/core/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  // Screen size
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Padding
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  double get topPadding => padding.top;
  double get bottomPadding => padding.bottom;

  // Brightness
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // Focus
  void unfocus() => FocusScope.of(this).unfocus();

  // Localization
  AppLocalizations get l10n => AppLocalizations.of(this);

  // Navigation
  NavigatorState get navigator => Navigator.of(this);
  void pop<T>([T? result]) => navigator.pop(result);
}
