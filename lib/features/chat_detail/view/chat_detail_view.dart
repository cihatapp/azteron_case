import 'dart:async';

import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:azteron_case/features/chat_detail/bloc/chat_detail_cubit.dart';
import 'package:azteron_case/features/chat_detail/data/models/message.dart';
import 'package:azteron_case/features/chat_detail/widgets/chat_app_bar.dart';
import 'package:azteron_case/features/chat_detail/widgets/date_separator.dart';
import 'package:azteron_case/features/chat_detail/widgets/message_bubble.dart';
import 'package:azteron_case/features/chat_detail/widgets/message_input_field.dart';
import 'package:azteron_case/features/chat_detail/widgets/message_shimmer.dart';
import 'package:azteron_case/features/messages/data/models/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailView extends StatelessWidget {
  const ChatDetailView({
    required this.conversation,
    super.key,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatDetailCubit, ChatDetailState>(
      listenWhen: (previous, current) =>
          previous.lastEvent != current.lastEvent ||
          (previous.errorMessage != current.errorMessage &&
              current.errorMessage != null),
      listener: (context, state) {
        // Handle side-effects based on events
        switch (state.lastEvent) {
          case ChatDetailEvent.messageSent:
            // Haptic feedback on successful send
            unawaited(HapticFeedback.lightImpact());
          case ChatDetailEvent.sendFailed:
            // Show error SnackBar when message fails to send
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.failedToSendMessage),
                backgroundColor: context.colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.read<ChatDetailCubit>().clearError();
          case ChatDetailEvent.none:
            break;
        }

        // Handle load failure separately
        if (state.status == ChatDetailStatus.failure &&
            state.errorMessage != null &&
            state.lastEvent == ChatDetailEvent.none) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.failedToLoadMessages),
              backgroundColor: context.colorScheme.error,
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: context.l10n.retry,
                textColor: context.colorScheme.onError,
                onPressed: () {
                  unawaited(context.read<ChatDetailCubit>().loadMessages());
                },
              ),
            ),
          );
          context.read<ChatDetailCubit>().clearError();
        }
      },
      child: Scaffold(
        appBar: ChatAppBar(user: conversation.user),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatDetailCubit, ChatDetailState>(
                builder: (context, state) {
                switch (state.status) {
                  case ChatDetailStatus.initial:
                  case ChatDetailStatus.loading:
                    return const MessageListShimmer();
                  case ChatDetailStatus.failure:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, size: 48),
                          const SizedBox(height: 16),
                          Text(context.l10n.failedToLoadMessages),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              unawaited(
                                context.read<ChatDetailCubit>().loadMessages(),
                              );
                            },
                            child: Text(context.l10n.retry),
                          ),
                        ],
                      ),
                    );
                  case ChatDetailStatus.success:
                    if (state.messages.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 64,
                              color: context.colorScheme.onSurface
                                  .withValues(alpha: 0.3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              context.l10n.noMessagesStartConversation,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colorScheme.onSurface
                                    .withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return _MessagesList(messages: state.messages);
                }
              },
            ),
          ),
          BlocBuilder<ChatDetailCubit, ChatDetailState>(
            buildWhen: (prev, curr) => prev.isSending != curr.isSending,
            builder: (context, state) {
              return MessageInputField(
                isLoading: state.isSending,
                onSend: (content) {
                  unawaited(
                    context.read<ChatDetailCubit>().sendMessage(content),
                  );
                },
              );
            },
          ),
          ],
        ),
      ),
    );
  }
}

class _MessagesList extends StatefulWidget {
  const _MessagesList({required this.messages});

  final List<Message> messages;

  @override
  State<_MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<_MessagesList> {
  final _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant _MessagesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Scroll to bottom when new messages arrive
    if (widget.messages.length > oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          unawaited(
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstMessage = widget.messages.first;

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.messages.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return DateSeparator(date: firstMessage.timestamp);
        }
        return MessageBubble(message: widget.messages[index - 1]);
      },
    );
  }
}
