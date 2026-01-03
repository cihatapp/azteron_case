import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:azteron_case/core/widgets/avatar_with_status.dart';
import 'package:azteron_case/features/messages/data/models/conversation.dart';
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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar with status indicator
            AvatarWithStatus(
              imageUrl: conversation.user.avatarUrl,
              isOnline: conversation.user.isOnline,
              radius: 28,
              statusSize: 14,
            ),
            const SizedBox(width: 12),
            // Name and message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name using theme
                  Text(
                    conversation.user.name,
                    style: context.appStyles.conversationName,
                  ),
                  const SizedBox(height: 2),
                  // Message using theme
                  Text(
                    conversation.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.appStyles.conversationMessage,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Time and badge
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Time using theme
                Text(
                  _formatTime(context),
                  style: context.appStyles.timeText,
                ),
                if (conversation.hasUnread) ...[
                  const SizedBox(height: 6),
                  _UnreadBadge(count: conversation.unreadCount),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Unread badge - Figma: 18x18, Poppins Medium, 12px, white
class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final displayText = count > 9 ? '9+' : count.toString();
    final fontSize = count > 9 ? 9.0 : 12.0;

    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          displayText,
          style: context.appStyles.badgeText.copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
