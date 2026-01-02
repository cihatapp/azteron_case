import 'package:azteron_case/core/extension/context_extension.dart';
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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => NavigationManager().pop(),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (user.isOnline)
                  Text(
                    context.l10n.online,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.green,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.phone_outlined),
          onPressed: () {
            // Voice call - not implemented for this demo
          },
        ),
        IconButton(
          icon: const Icon(Icons.videocam_outlined),
          onPressed: () {
            // Video call - not implemented for this demo
          },
        ),
      ],
    );
  }
}
