import 'dart:async';

import 'package:azteron_case/core/navigation/navigation_manager.dart';
import 'package:azteron_case/features/messages/cubit/messages_cubit.dart';
import 'package:azteron_case/features/messages/widgets/conversation_tile.dart';
import 'package:azteron_case/features/messages/widgets/messages_app_bar.dart';
import 'package:azteron_case/features/messages/widgets/messages_bottom_nav.dart';
import 'package:azteron_case/features/messages/widgets/messages_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MessagesAppBar(),
      body: Column(
        children: [
          MessagesSearchBar(
            onChanged: (query) {
              context.read<MessagesCubit>().search(query);
            },
          ),
          Expanded(
            child: BlocBuilder<MessagesCubit, MessagesState>(
              builder: (context, state) {
                switch (state.status) {
                  case MessagesStatus.initial:
                  case MessagesStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case MessagesStatus.failure:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, size: 48),
                          const SizedBox(height: 16),
                          const Text('Failed to load messages'),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              unawaited(
                                context
                                    .read<MessagesCubit>()
                                    .loadConversations(),
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  case MessagesStatus.success:
                    final conversations = state.displayConversations;

                    if (conversations.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 64,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              state.searchQuery.isNotEmpty
                                  ? 'No results found'
                                  : 'No messages yet',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.5),
                                  ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: conversations.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        indent: 80,
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withValues(alpha: 0.2),
                      ),
                      itemBuilder: (context, index) {
                        final conversation = conversations[index];
                        return ConversationTile(
                          conversation: conversation,
                          onTap: () {
                            unawaited(
                              NavigationManager()
                                  .pushChatDetail(conversation),
                            );
                          },
                        );
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MessagesBottomNav(),
    );
  }
}
