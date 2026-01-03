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
    switch (conversationId) {
      case '1': // Zeynep Yılmaz
        return _zeynepMessages(today);
      case '2': // Ahmet Kaya
        return _ahmetMessages(today);
      case '3': // Elif Demir
        return _elifMessages(today);
      default:
        return _defaultMessages(today);
    }
  }

  List<Message> _zeynepMessages(DateTime today) {
    return [
      Message(
        id: 'm1',
        content: 'Selam! Nasılsın?',
        timestamp: today.add(const Duration(hours: 9)),
        isSentByMe: false,
      ),
      Message(
        id: 'm2',
        content: 'İyiyim, teşekkür ederim! Sen nasılsın?',
        timestamp: today.add(const Duration(hours: 9, minutes: 5)),
        isSentByMe: true,
      ),
      Message(
        id: 'm3',
        content: 'Ben de iyiyim. Yakında buluşmayı düşünüyordum.',
        timestamp: today.add(const Duration(hours: 9, minutes: 10)),
        isSentByMe: false,
      ),
      Message(
        id: 'm4',
        content: 'Harika bir fikir! Sana ne zaman uygun?',
        timestamp: today.add(const Duration(hours: 9, minutes: 15)),
        isSentByMe: true,
      ),
      Message(
        id: 'm5',
        content: 'Yarın öğleden sonra 2 gibi olur mu?',
        timestamp: today.add(const Duration(hours: 10)),
        isSentByMe: false,
      ),
      Message(
        id: 'm6',
        content: 'Mükemmel! Bana uyar.',
        timestamp: today.add(const Duration(hours: 10, minutes: 5)),
        isSentByMe: true,
      ),
      Message(
        id: 'm7',
        content: 'Tamam, yarın görüşürüz o zaman!',
        timestamp: today.add(const Duration(hours: 10, minutes: 10)),
        isSentByMe: false,
      ),
    ];
  }

  List<Message> _ahmetMessages(DateTime today) {
    return [
      Message(
        id: 'm1',
        content: 'Merhaba, toplantı notlarını gönderebilir misin?',
        timestamp: today.add(const Duration(hours: 11)),
        isSentByMe: false,
      ),
      Message(
        id: 'm2',
        content: 'Tabii, hemen gönderiyorum.',
        timestamp: today.add(const Duration(hours: 11, minutes: 2)),
        isSentByMe: true,
      ),
      Message(
        id: 'm3',
        content: 'Ayrıca proje güncellemesi hakkında konuşmamız lazım.',
        timestamp: today.add(const Duration(hours: 11, minutes: 5)),
        isSentByMe: true,
      ),
      Message(
        id: 'm4',
        content: 'Tamam, yarınki toplantıda detaylı konuşuruz.',
        timestamp: today.add(const Duration(hours: 11, minutes: 10)),
        isSentByMe: false,
      ),
      Message(
        id: 'm5',
        content: 'Bilgi için teşekkürler!',
        timestamp: today.add(const Duration(hours: 11, minutes: 15)),
        isSentByMe: false,
      ),
    ];
  }

  List<Message> _elifMessages(DateTime today) {
    return [
      Message(
        id: 'm1',
        content: 'Yeni UI tasarımlarını bitirdim.',
        timestamp: today.add(const Duration(hours: 14)),
        isSentByMe: false,
      ),
      Message(
        id: 'm2',
        content: 'Harika! Figma linkini paylaşır mısın?',
        timestamp: today.add(const Duration(hours: 14, minutes: 3)),
        isSentByMe: true,
      ),
      Message(
        id: 'm3',
        content: 'Tabii, işte burada: figma.com/design/xyz',
        timestamp: today.add(const Duration(hours: 14, minutes: 5)),
        isSentByMe: false,
      ),
      Message(
        id: 'm4',
        content: 'Çok güzel olmuş! Renk paleti tam istediğimiz gibi.',
        timestamp: today.add(const Duration(hours: 14, minutes: 20)),
        isSentByMe: true,
      ),
      Message(
        id: 'm5',
        content: 'Yeni tasarımları gördün mü?',
        timestamp: today.add(const Duration(hours: 15)),
        isSentByMe: false,
      ),
    ];
  }

  List<Message> _defaultMessages(DateTime today) {
    return [
      Message(
        id: 'm1',
        content: 'Merhaba!',
        timestamp: today.add(const Duration(hours: 9)),
        isSentByMe: false,
      ),
      Message(
        id: 'm2',
        content: 'Merhaba, nasıl yardımcı olabilirim?',
        timestamp: today.add(const Duration(hours: 9, minutes: 5)),
        isSentByMe: true,
      ),
      Message(
        id: 'm3',
        content: 'Geçen hafta konuştuğumuz konu hakkında bilgi almak istiyorum.',
        timestamp: today.add(const Duration(hours: 9, minutes: 10)),
        isSentByMe: false,
      ),
      Message(
        id: 'm4',
        content: 'Tabii, detayları paylaşayım.',
        timestamp: today.add(const Duration(hours: 9, minutes: 15)),
        isSentByMe: true,
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
