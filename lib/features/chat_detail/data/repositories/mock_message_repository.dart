import 'package:azteron_case/features/chat_detail/data/models/message.dart';

/// Mock repository for chat messages
class MockMessageRepository {
  /// Get messages for a conversation (simulates API call)
  Future<List<Message>> getMessages(String conversationId) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Return different messages based on conversation
    return [
      Message(
        id: 'm1',
        content: 'Hey! How are you doing?',
        timestamp: today.add(const Duration(hours: 9)),
        isSentByMe: false,
      ),
      Message(
        id: 'm2',
        content: "I'm doing great, thanks for asking! How about you?",
        timestamp: today.add(const Duration(hours: 9, minutes: 5)),
        isSentByMe: true,
      ),
      Message(
        id: 'm3',
        content: 'Pretty good! I was thinking about catching up soon.',
        timestamp: today.add(const Duration(hours: 9, minutes: 10)),
        isSentByMe: false,
      ),
      Message(
        id: 'm4',
        content: 'That sounds like a great idea! When works for you?',
        timestamp: today.add(const Duration(hours: 9, minutes: 15)),
        isSentByMe: true,
      ),
      Message(
        id: 'm5',
        content: 'How about tomorrow around 2pm?',
        timestamp: today.add(const Duration(hours: 10)),
        isSentByMe: false,
      ),
      Message(
        id: 'm6',
        content: 'Perfect! That works for me.',
        timestamp: today.add(const Duration(hours: 10, minutes: 5)),
        isSentByMe: true,
      ),
      Message(
        id: 'm7',
        content: 'Sounds good! See you tomorrow then.',
        timestamp: today.add(const Duration(hours: 10, minutes: 10)),
        isSentByMe: false,
      ),
    ];
  }

  /// Send a new message
  Future<Message> sendMessage({
    required String conversationId,
    required String content,
  }) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 200));

    return Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      timestamp: DateTime.now(),
      isSentByMe: true,
    );
  }
}
