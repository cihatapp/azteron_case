import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:azteron_case/core/navigation/navigation_manager.dart';
import 'package:azteron_case/features/messages/data/models/user.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    required this.user,
    super.key,
  });

  final User user;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      leadingWidth: 72,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Center(
          child: _BorderedIconButton(
            icon: Icons.arrow_back_ios_new,
            iconColor: context.colorScheme.primary,
            onPressed: () => NavigationManager().pop(),
          ),
        ),
      ),
      titleSpacing: 8,
      title: Row(
        children: [
          // User name and online status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name - using theme
                Text(
                  user.name,
                  style: context.appStyles.chatTitle,
                ),
                if (user.isOnline) ...[
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: context.appColors.onlineIndicator,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        context.l10n.online,
                        style: context.appStyles.onlineStatus,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      actions: [
        // Call button with border
        _BorderedIconButton(
          icon: Icons.phone_outlined,
          iconColor: context.colorScheme.primary,
          onPressed: () {
            // Voice call - not implemented for this demo
          },
        ),
        const SizedBox(width: 8),
        // Video button with border
        _BorderedIconButton(
          icon: Icons.videocam_outlined,
          iconColor: context.colorScheme.primary,
          onPressed: () {
            // Video call - not implemented for this demo
          },
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

/// Bordered icon button matching Figma design
class _BorderedIconButton extends StatelessWidget {
  const _BorderedIconButton({
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });

  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(11),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
