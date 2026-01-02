import 'package:equatable/equatable.dart';

/// Represents a single message in a chat.
class Message extends Equatable {
  const Message({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.isSentByMe,
  });

  /// Unique identifier for the message.
  final String id;

  /// The text content of the message.
  final String content;

  /// When the message was sent.
  final DateTime timestamp;

  /// Whether this message was sent by the current user.
  final bool isSentByMe;

  /// Format timestamp for bubble display (e.g., "2:55 PM").
  String get formattedTime {
    final hour = timestamp.hour > 12 ? timestamp.hour - 12 : timestamp.hour;
    final displayHour = hour == 0 ? 12 : hour;
    final period = timestamp.hour >= 12 ? 'PM' : 'AM';
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '$displayHour:$minute $period';
  }

  @override
  List<Object?> get props => [id, content, timestamp, isSentByMe];
}
