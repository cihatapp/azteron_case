import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:azteron_case/core/l10n/state/locale_cubit.dart';
import 'package:azteron_case/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      titleSpacing: 16,
      title: Row(
        children: [
          // Heart logo in pink circular container (Figma design)
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                context.appAssets.heartLogo,
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(
                  context.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Page title using theme
          Text(
            context.l10n.messagesTitle,
            style: context.appStyles.pageTitle,
          ),
        ],
      ),
      actions: const [
        // Language switcher button
        _LanguageSwitcher(),
        SizedBox(width: 8),
        // Animated theme switcher button
        _AnimatedThemeSwitcher(),
        SizedBox(width: 16),
      ],
    );
  }
}

/// Animated theme switcher with smooth icon transitions.
class _AnimatedThemeSwitcher extends StatelessWidget {
  const _AnimatedThemeSwitcher();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = context.read<ThemeCubit>().isDarkMode(context);

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.appColors.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(context),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                key: ValueKey(isDark),
                color: context.colorScheme.primary,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Language switcher button showing current locale code.
class _LanguageSwitcher extends StatelessWidget {
  const _LanguageSwitcher();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.appColors.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => context.read<LocaleCubit>().toggleLocale(),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.3),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  state.appLocale.shortName,
                  key: ValueKey(state.appLocale),
                  style: TextStyle(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
