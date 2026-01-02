// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ChatDetailPage]
class ChatDetailRoute extends PageRouteInfo<ChatDetailRouteArgs> {
  ChatDetailRoute({
    required String conversationId,
    required Conversation conversation,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ChatDetailRoute.name,
         args: ChatDetailRouteArgs(
           conversationId: conversationId,
           conversation: conversation,
           key: key,
         ),
         rawPathParams: {'conversationId': conversationId},
         initialChildren: children,
       );

  static const String name = 'ChatDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatDetailRouteArgs>();
      return ChatDetailPage(
        conversationId: args.conversationId,
        conversation: args.conversation,
        key: args.key,
      );
    },
  );
}

class ChatDetailRouteArgs {
  const ChatDetailRouteArgs({
    required this.conversationId,
    required this.conversation,
    this.key,
  });

  final String conversationId;

  final Conversation conversation;

  final Key? key;

  @override
  String toString() {
    return 'ChatDetailRouteArgs{conversationId: $conversationId, conversation: $conversation, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatDetailRouteArgs) return false;
    return conversationId == other.conversationId &&
        conversation == other.conversation &&
        key == other.key;
  }

  @override
  int get hashCode =>
      conversationId.hashCode ^ conversation.hashCode ^ key.hashCode;
}

/// generated route for
/// [MessagesPage]
class MessagesRoute extends PageRouteInfo<void> {
  const MessagesRoute({List<PageRouteInfo>? children})
    : super(MessagesRoute.name, initialChildren: children);

  static const String name = 'MessagesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MessagesPage();
    },
  );
}
