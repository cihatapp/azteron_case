part of 'messages_cubit.dart';

enum MessagesStatus { initial, loading, success, failure }

class MessagesState extends Equatable {
  const MessagesState({
    this.status = MessagesStatus.initial,
    this.conversations = const [],
    this.filteredConversations = const [],
    this.searchQuery = '',
    this.errorMessage,
  });

  final MessagesStatus status;
  final List<Conversation> conversations;
  final List<Conversation> filteredConversations;
  final String searchQuery;

  /// Error message for BlocListener to show SnackBar
  final String? errorMessage;

  /// Get display list (filtered if searching, otherwise all)
  List<Conversation> get displayConversations =>
      searchQuery.isEmpty ? conversations : filteredConversations;

  MessagesState copyWith({
    MessagesStatus? status,
    List<Conversation>? conversations,
    List<Conversation>? filteredConversations,
    String? searchQuery,
    String? errorMessage,
  }) {
    return MessagesState(
      status: status ?? this.status,
      conversations: conversations ?? this.conversations,
      filteredConversations:
          filteredConversations ?? this.filteredConversations,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage,
    );
  }

  /// Clear the error message after it's been handled
  MessagesState clearError() {
    return MessagesState(
      status: status,
      conversations: conversations,
      filteredConversations: filteredConversations,
      searchQuery: searchQuery,
    );
  }

  @override
  List<Object?> get props => [
        status,
        conversations,
        filteredConversations,
        searchQuery,
        errorMessage,
      ];
}
