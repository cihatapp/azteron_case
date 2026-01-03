import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
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
          // Heart logo from assets
          SvgPicture.asset(
            context.appAssets.heartLogo,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 12),
          // Page title using theme
          Text(
            context.l10n.messagesTitle,
            style: context.appStyles.pageTitle,
          ),
        ],
      ),
      actions: [
        // Menu button with three dots
        Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            border: Border.all(color: context.appColors.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(
              Icons.more_vert,
              color: context.colorScheme.primary,
              size: 20,
            ),
            onPressed: () {
              // Show menu
            },
          ),
        ),
      ],
    );
  }
}
