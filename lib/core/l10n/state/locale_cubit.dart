import 'package:azteron_case/core/cache/cache_keys.dart';
import 'package:azteron_case/core/cache/cache_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Supported app locales
enum AppLocale {
  english('en', 'English', 'EN'),
  turkish('tr', 'Türkçe', 'TR');

  const AppLocale(this.code, this.name, this.shortName);
  final String code;
  final String name;
  final String shortName;

  Locale get locale => Locale(code);

  static AppLocale fromCode(String? code) {
    return AppLocale.values.firstWhere(
      (locale) => locale.code == code,
      orElse: () => AppLocale.english,
    );
  }
}

/// State for locale cubit
class LocaleState extends Equatable {
  const LocaleState({
    required this.appLocale,
    this.isLoading = false,
  });

  factory LocaleState.initial() => const LocaleState(
        appLocale: AppLocale.english,
      );

  final AppLocale appLocale;
  final bool isLoading;

  Locale get locale => appLocale.locale;

  LocaleState copyWith({
    AppLocale? appLocale,
    bool? isLoading,
  }) {
    return LocaleState(
      appLocale: appLocale ?? this.appLocale,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [appLocale, isLoading];
}

/// Cubit for managing app locale/language settings.
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit({CacheManager? cacheManager})
      : _cacheManager = cacheManager ?? CacheManager(),
        super(LocaleState.initial());

  final CacheManager _cacheManager;

  /// Initialize cubit with saved locale preference
  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    final savedLocale = _cacheManager.getString(CacheKeys.locale);
    final appLocale = AppLocale.fromCode(savedLocale);

    emit(
      state.copyWith(
        appLocale: appLocale,
        isLoading: false,
      ),
    );
  }

  /// Set the app locale
  Future<void> setLocale(AppLocale locale) async {
    if (state.appLocale == locale) return;

    emit(state.copyWith(isLoading: true));

    await _cacheManager.setString(CacheKeys.locale, locale.code);

    emit(
      state.copyWith(
        appLocale: locale,
        isLoading: false,
      ),
    );
  }

  /// Toggle between available locales
  Future<void> toggleLocale() async {
    final currentIndex = AppLocale.values.indexOf(state.appLocale);
    final nextIndex = (currentIndex + 1) % AppLocale.values.length;
    await setLocale(AppLocale.values[nextIndex]);
  }

  /// Get all available locales
  List<AppLocale> get availableLocales => AppLocale.values;

  /// Check if a locale is currently selected
  bool isSelected(AppLocale locale) => state.appLocale == locale;
}
