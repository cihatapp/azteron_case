import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:azteron_case/features/chat_detail/bloc/chat_detail_cubit.dart';
import 'package:azteron_case/features/chat_detail/view/chat_detail_view.dart';
import 'package:azteron_case/features/messages/data/models/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({
    @PathParam('conversationId') required this.conversationId,
    required this.conversation,
    super.key,
  });

  final String conversationId;
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = ChatDetailCubit(conversationId: conversationId);
        unawaited(cubit.loadMessages());
        return cubit;
      },
      child: ChatDetailView(conversation: conversation),
    );
  }
}
