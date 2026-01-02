import 'package:azteron_case/core/theme/dark/color_scheme_dark.dart';
import 'package:azteron_case/core/theme/dark/text_theme_dark.dart';

/// Interface mixin for Dark theme components
/// Connects color scheme and text theme singletons
mixin class IDarkThemeInterface {
  /// Dark color scheme singleton
  ColorSchemeDark? colorSchemeDark = ColorSchemeDark();

  /// Dark text theme singleton
  TextThemeDark? textThemeDark = TextThemeDark();
}
