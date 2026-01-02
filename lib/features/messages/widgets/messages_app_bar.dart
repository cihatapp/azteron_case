import 'package:flutter/material.dart';

class MessagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessagesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      title: Row(
        children: [
          Icon(
            Icons.favorite,
            color: theme.colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            'Messages',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // More options - not implemented for this demo
          },
        ),
      ],
    );
  }
}
