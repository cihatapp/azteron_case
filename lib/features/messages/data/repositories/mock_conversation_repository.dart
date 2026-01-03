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
          name: 'Zeynep Yılmaz',
          avatarUrl: 'https://i.pravatar.cc/150?img=1',
          isOnline: true,
        ),
        lastMessage: 'Tamam, yarın görüşürüz o zaman!',
        lastMessageTime: now.subtract(const Duration(minutes: 13)),
        unreadCount: 2,
      ),
      Conversation(
        id: '2',
        user: const User(
          id: 'u2',
          name: 'Ahmet Kaya',
          avatarUrl: 'https://i.pravatar.cc/150?img=3',
          isOnline: true,
        ),
        lastMessage: 'Bilgi için teşekkürler!',
        lastMessageTime: now.subtract(const Duration(minutes: 26)),
      ),
      Conversation(
        id: '3',
        user: const User(
          id: 'u3',
          name: 'Elif Demir',
          avatarUrl: 'https://i.pravatar.cc/150?img=5',
        ),
        lastMessage: 'Yeni tasarımları gördün mü?',
        lastMessageTime: now.subtract(const Duration(minutes: 45)),
        unreadCount: 1,
      ),
      Conversation(
        id: '4',
        user: const User(
          id: 'u4',
          name: 'Mehmet Öztürk',
          avatarUrl: 'https://i.pravatar.cc/150?img=7',
          isOnline: true,
        ),
        lastMessage: 'Bakıp döneceğim sana.',
        lastMessageTime: now.subtract(const Duration(hours: 2)),
      ),
      Conversation(
        id: '5',
        user: const User(
          id: 'u5',
          name: 'Ayşe Çelik',
          avatarUrl: 'https://i.pravatar.cc/150?img=9',
        ),
        lastMessage: 'Sunumda harika iş çıkardın!',
        lastMessageTime: now.subtract(const Duration(hours: 5)),
      ),
      Conversation(
        id: '6',
        user: const User(
          id: 'u6',
          name: 'Burak Şahin',
          avatarUrl: 'https://i.pravatar.cc/150?img=11',
        ),
        lastMessage: 'Toplantıyı erteleyebilir miyiz?',
        lastMessageTime: now.subtract(const Duration(days: 1)),
        unreadCount: 3,
      ),
      Conversation(
        id: '7',
        user: const User(
          id: 'u7',
          name: 'Selin Arslan',
          avatarUrl: 'https://i.pravatar.cc/150?img=20',
          isOnline: true,
        ),
        lastMessage: 'Projeyi bitirdim, inceleyebilirsin.',
        lastMessageTime: now.subtract(const Duration(days: 1, hours: 3)),
      ),
      Conversation(
        id: '8',
        user: const User(
          id: 'u8',
          name: 'Emre Koç',
          avatarUrl: 'https://i.pravatar.cc/150?img=12',
        ),
        lastMessage: 'Bu hafta sonu müsait misin?',
        lastMessageTime: now.subtract(const Duration(days: 2)),
        unreadCount: 1,
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
