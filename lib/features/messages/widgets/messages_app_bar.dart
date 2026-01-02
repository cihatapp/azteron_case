import 'dart:async';

import 'package:azteron_case/core/extension/context_extension.dart';
import 'package:azteron_case/core/locale/locale_cubit.dart';
import 'package:azteron_case/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessagesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      title: Row(
        children: [
          Icon(
            Icons.favorite,
            color: context.colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            context.l10n.messagesTitle,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: const [
        _AnimatedLocaleSwitcher(),
        _AnimatedThemeSwitcher(),
        SizedBox(width: 8),
      ],
    );
  }
}

/// Animated language/locale switcher button
class _AnimatedLocaleSwitcher extends StatelessWidget {
  const _AnimatedLocaleSwitcher();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => unawaited(context.read<LocaleCubit>().toggleLocale()),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer
                    .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.5),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Row(
                  key: ValueKey(state.appLocale),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.language_rounded,
                      size: 16,
                      color: context.colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      state.appLocale.shortName,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Animated theme switcher button with rotation animation
class _AnimatedThemeSwitcher extends StatefulWidget {
  const _AnimatedThemeSwitcher();

  @override
  State<_AnimatedThemeSwitcher> createState() => _AnimatedThemeSwitcherState();
}

class _AnimatedThemeSwitcherState extends State<_AnimatedThemeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1, end: 0.8), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onTap(BuildContext context) async {
    unawaited(_controller.forward(from: 0));
    await context.read<ThemeCubit>().toggleTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == AppThemeMode.dark;

        return IconButton(
          onPressed: () => _onTap(context),
          icon: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Transform.rotate(
                  angle: _rotationAnimation.value * 3.14159,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Icon(
                      isDark
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                      key: ValueKey(isDark),
                      color: isDark
                          ? context.colorScheme.primary
                          : Colors.amber.shade600,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
