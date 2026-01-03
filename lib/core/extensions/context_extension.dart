import 'package:azteron_case/core/constants/app_assets.dart';
import 'package:azteron_case/core/l10n/generated/app_localizations.dart';
import 'package:azteron_case/core/theme/app_text_styles.dart';
import 'package:azteron_case/core/theme/dark/color_scheme_dark.dart';
import 'package:azteron_case/core/theme/light/color_scheme_light.dart';
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

  // ─────────────────────────────────────────────────
  // Figma Design System Access
  // ─────────────────────────────────────────────────

  /// Access to app-specific colors (Figma design system)
  AppColors get appColors => isDarkMode ? _darkColors : _lightColors;

  static final _lightColors = _LightAppColors();
  static final _darkColors = _DarkAppColors();

  /// Access to app-specific text styles (Figma design system)
  AppStyles get appStyles => AppStyles._(this);

  /// Access to app asset paths (singleton)
  AppAssets get appAssets => AppAssets.instance;
}

/// App-specific colors accessor
abstract class AppColors {
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;
  Color get sentBubble;
  Color get sentBubbleText;
  Color get receivedBubble;
  Color get receivedBubbleText;
  Color get onlineIndicator;
  Color get offlineIndicator;
  Color get searchFieldBackground;
  Color get borderColor;
  Color get dividerColor;
}

class _LightAppColors implements AppColors {
  final _colors = ColorSchemeLight();

  @override
  Color get textPrimary => _colors.textPrimary;
  @override
  Color get textSecondary => _colors.textSecondary;
  @override
  Color get textTertiary => _colors.textTertiary;
  @override
  Color get sentBubble => _colors.sentBubble;
  @override
  Color get sentBubbleText => _colors.sentBubbleText;
  @override
  Color get receivedBubble => _colors.receivedBubble;
  @override
  Color get receivedBubbleText => _colors.receivedBubbleText;
  @override
  Color get onlineIndicator => _colors.onlineIndicator;
  @override
  Color get offlineIndicator => _colors.offlineIndicator;
  @override
  Color get searchFieldBackground => _colors.searchFieldBackground;
  @override
  Color get borderColor => _colors.borderColor;
  @override
  Color get dividerColor => _colors.dividerColor;
}

class _DarkAppColors implements AppColors {
  final _colors = ColorSchemeDark();

  @override
  Color get textPrimary => _colors.textPrimary;
  @override
  Color get textSecondary => _colors.textSecondary;
  @override
  Color get textTertiary => _colors.textTertiary;
  @override
  Color get sentBubble => _colors.sentBubble;
  @override
  Color get sentBubbleText => _colors.sentBubbleText;
  @override
  Color get receivedBubble => _colors.receivedBubble;
  @override
  Color get receivedBubbleText => _colors.receivedBubbleText;
  @override
  Color get onlineIndicator => _colors.onlineIndicator;
  @override
  Color get offlineIndicator => _colors.offlineIndicator;
  @override
  Color get searchFieldBackground => _colors.searchFieldBackground;
  @override
  Color get borderColor => _colors.borderColor;
  @override
  Color get dividerColor => _colors.dividerColor;
}

/// App-specific text styles with theme-aware colors
class AppStyles {
  AppStyles._(this._context);

  final BuildContext _context;

  AppColors get _colors => _context.appColors;

  // Messages Page Styles
  TextStyle get pageTitle => AppTextStyles.pageTitle(_colors.textPrimary);
  TextStyle get searchPlaceholder =>
      AppTextStyles.searchPlaceholder(_colors.textSecondary);
  TextStyle get conversationName =>
      AppTextStyles.conversationName(_colors.textPrimary);
  TextStyle get conversationMessage =>
      AppTextStyles.conversationMessage(_colors.textSecondary);
  TextStyle get timeText => AppTextStyles.timeText(_colors.textSecondary);
  TextStyle get badgeText => AppTextStyles.badgeText(Colors.white);

  // Chat Detail Page Styles
  TextStyle get chatTitle => AppTextStyles.chatTitle(_colors.textPrimary);
  TextStyle get onlineStatus =>
      AppTextStyles.onlineStatus(_colors.textSecondary);
  TextStyle get dateSeparator =>
      AppTextStyles.dateSeparator(_colors.textTertiary);
  TextStyle get messageText => AppTextStyles.messageText(_colors.textPrimary);
  TextStyle get messageTime => AppTextStyles.messageTime(_colors.textTertiary);
  TextStyle get inputPlaceholder =>
      AppTextStyles.inputPlaceholder(_colors.textSecondary);
}
