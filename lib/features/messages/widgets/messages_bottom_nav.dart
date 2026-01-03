import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class MessagesBottomNav extends StatelessWidget {
  const MessagesBottomNav({
    this.currentIndex = 2,
    super.key,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: context.colorScheme.primary,
      unselectedItemColor: context.colorScheme.onSurface.withValues(alpha: 0.5),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore_outlined),
          activeIcon: const Icon(Icons.explore),
          label: context.l10n.explore,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.chat_bubble_outline),
          activeIcon: const Icon(Icons.chat_bubble),
          label: context.l10n.messagesTitle,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications_outlined),
          activeIcon: const Icon(Icons.notifications),
          label: context.l10n.notifications,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline),
          activeIcon: const Icon(Icons.person),
          label: context.l10n.profile,
        ),
      ],
      onTap: (index) {
        // Navigation not implemented for this demo
      },
    );
  }
}
