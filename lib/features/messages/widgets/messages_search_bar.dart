import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:azteron_case/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagesSearchBar extends StatelessWidget {
  const MessagesSearchBar({
    required this.onChanged,
    super.key,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: context.l10n.searchMessages,
          hintStyle: context.appStyles.searchPlaceholder,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16, right: 12),
            child: SvgPicture.asset(
              context.appAssets.searchIcon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.appColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 52,
            minHeight: 48,
          ),
          filled: true,
          fillColor: context.appColors.searchFieldBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: context.colorScheme.primary.withValues(alpha: 0.3),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 14,
          ),
        ),
        style: AppTextStyles.searchPlaceholder(context.appColors.textPrimary),
      ),
    );
  }
}
