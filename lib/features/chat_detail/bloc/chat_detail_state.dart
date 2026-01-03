part of 'chat_detail_cubit.dart';

enum ChatDetailStatus { initial, loading, success, failure }

/// Represents different side-effect events that should trigger once
enum ChatDetailEvent {
  /// No event pending
  none,

  /// Message was sent successfully - can trigger haptic feedback
  messageSent,

  /// Message failed to send
  sendFailed,
}

class ChatDetailState extends Equatable {
  const ChatDetailState({
    this.status = ChatDetailStatus.initial,
    this.messages = const [],
    this.isSending = false,
    this.errorMessage,
    this.lastEvent = ChatDetailEvent.none,
  });

  final ChatDetailStatus status;
  final List<Message> messages;
  final bool isSending;

  /// Error message for BlocListener to show SnackBar
  final String? errorMessage;

  /// Last event that occurred - for BlocListener side-effects
  final ChatDetailEvent lastEvent;

  ChatDetailState copyWith({
    ChatDetailStatus? status,
    List<Message>? messages,
    bool? isSending,
    String? errorMessage,
    ChatDetailEvent? lastEvent,
  }) {
    return ChatDetailState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
      errorMessage: errorMessage,
      lastEvent: lastEvent ?? ChatDetailEvent.none,
    );
  }

  /// Clear the error message after it's been handled
  ChatDetailState clearError() {
    return ChatDetailState(
      status: status,
      messages: messages,
      isSending: isSending,
    );
  }

  @override
  List<Object?> get props => [
        status,
        messages,
        isSending,
        errorMessage,
        lastEvent,
      ];
}
