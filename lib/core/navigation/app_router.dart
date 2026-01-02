import 'package:auto_route/auto_route.dart';
import 'package:azteron_case/features/chat_detail/view/chat_detail_page.dart';
import 'package:azteron_case/features/messages/data/models/conversation.dart';
import 'package:azteron_case/features/messages/view/messages_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: MessagesRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/chat/:conversationId',
          page: ChatDetailRoute.page,
        ),
      ];
}
