import 'dart:async';

import 'package:azteron_case/core/l10n/gen/app_localizations.dart';
import 'package:azteron_case/core/navigation/navigation_manager.dart';
import 'package:azteron_case/core/theme/dark/dark_theme.dart';
import 'package:azteron_case/core/theme/light/light_theme.dart';
import 'package:azteron_case/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The root widget of the application.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = ThemeCubit();
        unawaited(cubit.init());
        return cubit;
      },
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Azteron Messages',
          theme: LightTheme().theme,
          darkTheme: DarkTheme().theme,
          themeMode: state.flutterThemeMode,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: NavigationManager().config,
        );
      },
    );
  }
}
