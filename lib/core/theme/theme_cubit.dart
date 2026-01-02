import 'package:azteron_case/core/cache/cache_keys.dart';
import 'package:azteron_case/core/cache/cache_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Supported theme modes
enum AppThemeMode {
  light('light'),
  dark('dark'),
  system('system');

  const AppThemeMode(this.value);
  final String value;

  /// Get Flutter ThemeMode from AppThemeMode
  ThemeMode get themeMode {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  /// Create from string value
  static AppThemeMode fromString(String? value) {
    return AppThemeMode.values.firstWhere(
      (mode) => mode.value == value,
      orElse: () => AppThemeMode.light,
    );
  }

  /// Get display icon for the theme mode
  IconData get icon {
    switch (this) {
      case AppThemeMode.light:
        return Icons.light_mode_rounded;
      case AppThemeMode.dark:
        return Icons.dark_mode_rounded;
      case AppThemeMode.system:
        return Icons.settings_suggest_rounded;
    }
  }
}

/// State for theme cubit
class ThemeState extends Equatable {
  const ThemeState({
    required this.themeMode,
    this.isLoading = false,
  });

  /// Factory constructor for initial state
  factory ThemeState.initial() => const ThemeState(
        themeMode: AppThemeMode.light,
      );

  final AppThemeMode themeMode;
  final bool isLoading;

  ThemeState copyWith({
    AppThemeMode? themeMode,
    bool? isLoading,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  /// Get the actual ThemeMode for MaterialApp
  ThemeMode get flutterThemeMode => themeMode.themeMode;

  @override
  List<Object?> get props => [themeMode, isLoading];
}

/// Cubit for managing theme settings with animation support.
///
/// Usage:
/// ```dart
/// // Provide in widget tree
/// BlocProvider<ThemeCubit>(
///   create: (_) => ThemeCubit()..init(),
///   child: MyApp(),
/// ),
///
/// // Change theme
/// context.read<ThemeCubit>().setThemeMode(AppThemeMode.dark);
///
/// // Listen to changes in MaterialApp
/// BlocBuilder<ThemeCubit, ThemeState>(
///   builder: (context, state) {
///     return MaterialApp(
///       themeMode: state.flutterThemeMode,
///       ...
///     );
///   },
/// )
/// ```
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({CacheManager? cacheManager})
      : _cacheManager = cacheManager ?? CacheManager(),
        super(ThemeState.initial());

  final CacheManager _cacheManager;

  /// Initialize cubit with saved theme preference
  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    // Get saved theme mode from cache
    final savedThemeMode = _cacheManager.getString(CacheKeys.themeMode);
    final themeMode = AppThemeMode.fromString(savedThemeMode);

    emit(
      state.copyWith(
        themeMode: themeMode,
        isLoading: false,
      ),
    );
  }

  /// Set the app theme mode
  Future<void> setThemeMode(AppThemeMode mode) async {
    if (state.themeMode == mode) return;

    emit(state.copyWith(isLoading: true));

    // Persist preference
    await _cacheManager.setString(CacheKeys.themeMode, mode.value);

    emit(
      state.copyWith(
        themeMode: mode,
        isLoading: false,
      ),
    );
  }

  /// Toggle between light and dark themes.
  /// If system mode, switches to the opposite of system preference.
  Future<void> toggleTheme(BuildContext context) async {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isCurrentlyDark = state.themeMode == AppThemeMode.dark ||
        (state.themeMode == AppThemeMode.system &&
            brightness == Brightness.dark);

    final newMode = isCurrentlyDark ? AppThemeMode.light : AppThemeMode.dark;
    await setThemeMode(newMode);
  }

  /// Get all available theme modes
  List<AppThemeMode> get availableThemeModes => AppThemeMode.values;

  /// Check if a theme mode is currently selected
  bool isSelected(AppThemeMode mode) => state.themeMode == mode;

  /// Check if current theme appears dark (considering system theme)
  bool isDarkMode(BuildContext context) {
    if (state.themeMode == AppThemeMode.dark) return true;
    if (state.themeMode == AppThemeMode.light) return false;
    // System mode - check platform brightness
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
