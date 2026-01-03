import 'package:azteron_case/features/messages/data/models/conversation.dart';
import 'package:azteron_case/features/messages/data/repositories/mock_conversation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit({
    MockConversationRepository? repository,
  })  : _repository = repository ?? MockConversationRepository(),
        super(const MessagesState());

  final MockConversationRepository _repository;

  /// Load all conversations
  Future<void> loadConversations() async {
    emit(state.copyWith(status: MessagesStatus.loading));

    try {
      final conversations = await _repository.getConversations();
      emit(
        state.copyWith(
          status: MessagesStatus.success,
          conversations: conversations,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: MessagesStatus.failure));
    }
  }

  /// Search conversations by user name
  void search(String query) {
    final filtered = state.conversations
        .where(
          (c) => c.user.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    emit(
      state.copyWith(
        searchQuery: query,
        filteredConversations: filtered,
      ),
    );
  }

  /// Clear search
  void clearSearch() {
    emit(
      state.copyWith(
        searchQuery: '',
        filteredConversations: [],
      ),
    );
  }
}
