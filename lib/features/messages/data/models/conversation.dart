import 'package:azteron_case/features/messages/data/models/user.dart';
import 'package:equatable/equatable.dart';

/// Represents a conversation in the messages list.
class Conversation extends Equatable {
  const Conversation({
    required this.id,
    required this.user,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
  });

  /// Unique identifier for the conversation.
  final String id;

  /// The other user in the conversation.
  final User user;

  /// The last message preview text.
  final String lastMessage;

  /// When the last message was sent.
  final DateTime lastMessageTime;

  /// Number of unread messages.
  final int unreadCount;

  /// Whether there are unread messages.
  bool get hasUnread => unreadCount > 0;

  /// Get time difference info for localized formatting.
  ({int minutes, int hours, int days}) get timeDiff {
    final now = DateTime.now();
    final diff = now.difference(lastMessageTime);
    return (
      minutes: diff.inMinutes,
      hours: diff.inHours,
      days: diff.inDays,
    );
  }

  @override
  List<Object?> get props => [
        id,
        user,
        lastMessage,
        lastMessageTime,
        unreadCount,
      ];
}
