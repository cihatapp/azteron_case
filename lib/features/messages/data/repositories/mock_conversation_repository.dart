import 'package:azteron_case/features/messages/data/models/conversation.dart';
import 'package:azteron_case/features/messages/data/models/user.dart';

/// Mock repository for conversations
class MockConversationRepository {
  /// Get all conversations (simulates API call)
  Future<List<Conversation>> getConversations() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final now = DateTime.now();

    return [
      Conversation(
        id: '1',
        user: const User(
          id: 'u1',
          name: 'Jennifer Wilson',
          avatarUrl: 'https://i.pravatar.cc/150?img=1',
          isOnline: true,
        ),
        lastMessage: 'Sounds good! See you tomorrow then.',
        lastMessageTime: now.subtract(const Duration(minutes: 13)),
        unreadCount: 2,
      ),
      Conversation(
        id: '2',
        user: const User(
          id: 'u2',
          name: 'Michael Brown',
          avatarUrl: 'https://i.pravatar.cc/150?img=3',
          isOnline: true,
        ),
        lastMessage: 'Thanks for the update!',
        lastMessageTime: now.subtract(const Duration(minutes: 26)),
      ),
      Conversation(
        id: '3',
        user: const User(
          id: 'u3',
          name: 'Sarah Martinez',
          avatarUrl: 'https://i.pravatar.cc/150?img=5',
        ),
        lastMessage: 'Did you see the new designs?',
        lastMessageTime: now.subtract(const Duration(minutes: 45)),
        unreadCount: 1,
      ),
      Conversation(
        id: '4',
        user: const User(
          id: 'u4',
          name: 'David Lee',
          avatarUrl: 'https://i.pravatar.cc/150?img=7',
          isOnline: true,
        ),
        lastMessage: "I'll check and get back to you.",
        lastMessageTime: now.subtract(const Duration(hours: 2)),
      ),
      Conversation(
        id: '5',
        user: const User(
          id: 'u5',
          name: 'Emily Chen',
          avatarUrl: 'https://i.pravatar.cc/150?img=9',
        ),
        lastMessage: 'Great job on the presentation!',
        lastMessageTime: now.subtract(const Duration(hours: 5)),
      ),
      Conversation(
        id: '6',
        user: const User(
          id: 'u6',
          name: 'James Taylor',
          avatarUrl: 'https://i.pravatar.cc/150?img=11',
        ),
        lastMessage: 'Can we reschedule the meeting?',
        lastMessageTime: now.subtract(const Duration(days: 1)),
        unreadCount: 3,
      ),
    ];
  }

  /// Search conversations by user name
  Future<List<Conversation>> searchConversations(String query) async {
    final conversations = await getConversations();

    if (query.isEmpty) return conversations;

    return conversations
        .where(
          (c) => c.user.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
