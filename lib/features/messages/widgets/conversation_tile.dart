import 'package:azteron_case/core/extension/context_extension.dart';
import 'package:azteron_case/features/messages/data/models/conversation.dart';
import 'package:azteron_case/features/widgets/avatar_with_status.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    required this.conversation,
    required this.onTap,
    super.key,
  });

  final Conversation conversation;
  final VoidCallback onTap;

  String _formatTime(BuildContext context) {
    final l10n = context.l10n;
    final diff = conversation.timeDiff;

    if (diff.minutes < 60) {
      return l10n.minutesAgo(diff.minutes);
    } else if (diff.hours < 24) {
      return diff.hours > 1
          ? l10n.hoursAgoPlural(diff.hours)
          : l10n.hoursAgo(diff.hours);
    } else if (diff.days == 1) {
      return l10n.yesterday;
    } else {
      return l10n.daysAgo(diff.days);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: AvatarWithStatus(
        imageUrl: conversation.user.avatarUrl,
        isOnline: conversation.user.isOnline,
      ),
      title: Text(
        conversation.user.name,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight:
              conversation.hasUnread ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      subtitle: Text(
        conversation.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.bodyMedium?.copyWith(
          color: conversation.hasUnread
              ? context.colorScheme.onSurface
              : context.colorScheme.onSurface.withValues(alpha: 0.6),
          fontWeight:
              conversation.hasUnread ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            _formatTime(context),
            style: context.textTheme.bodySmall?.copyWith(
              color: conversation.hasUnread
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          if (conversation.hasUnread) ...[
            const SizedBox(height: 4),
            _UnreadBadge(count: conversation.unreadCount),
          ],
        ],
      ),
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count.toString(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
