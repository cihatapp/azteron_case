import 'package:azteron_case/features/chat_detail/data/models/message.dart';
import 'package:azteron_case/features/chat_detail/data/repositories/mock_message_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit({
    required this.conversationId,
    MockMessageRepository? repository,
  })  : _repository = repository ?? MockMessageRepository(),
        super(const ChatDetailState());

  final String conversationId;
  final MockMessageRepository _repository;

  /// Load messages for this conversation
  Future<void> loadMessages() async {
    emit(state.copyWith(status: ChatDetailStatus.loading));

    try {
      final messages = await _repository.getMessages(conversationId);
      emit(
        state.copyWith(
          status: ChatDetailStatus.success,
          messages: messages,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ChatDetailStatus.failure));
    }
  }

  /// Send a new message
  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    emit(state.copyWith(isSending: true));

    try {
      final message = await _repository.sendMessage(
        conversationId: conversationId,
        content: content.trim(),
      );

      emit(
        state.copyWith(
          messages: [...state.messages, message],
          isSending: false,
        ),
      );
    } on Exception {
      emit(state.copyWith(isSending: false));
    }
  }
}
