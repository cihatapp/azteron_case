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

  /// Format time for display (e.g., "13 min", "26 min").
  String get formattedTime {
    final now = DateTime.now();
    final diff = now.difference(lastMessageTime);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''}';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else {
      return '${diff.inDays} days';
    }
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
