part of 'chat_detail_cubit.dart';

enum ChatDetailStatus { initial, loading, success, failure }

class ChatDetailState extends Equatable {
  const ChatDetailState({
    this.status = ChatDetailStatus.initial,
    this.messages = const [],
    this.isSending = false,
  });

  final ChatDetailStatus status;
  final List<Message> messages;
  final bool isSending;

  ChatDetailState copyWith({
    ChatDetailStatus? status,
    List<Message>? messages,
    bool? isSending,
  }) {
    return ChatDetailState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
    );
  }

  @override
  List<Object?> get props => [status, messages, isSending];
}
