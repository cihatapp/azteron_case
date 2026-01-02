import 'package:azteron_case/core/theme/light/color_scheme_light.dart';
import 'package:azteron_case/core/theme/light/text_theme_light.dart';

/// Interface mixin for Light theme components
/// Connects color scheme and text theme singletons
mixin class ILightThemeInterface {
  /// Light color scheme singleton
  ColorSchemeLight? colorSchemeLight = ColorSchemeLight();

  /// Light text theme singleton
  TextThemeLight? textThemeLight = TextThemeLight();
}
