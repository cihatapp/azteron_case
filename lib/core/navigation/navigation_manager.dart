import 'package:auto_route/auto_route.dart';
import 'package:azteron_case/core/navigation/app_router.dart';
import 'package:azteron_case/features/messages/data/models/conversation.dart';
import 'package:flutter/material.dart';

/// Navigation route enum for type-safe navigation
enum NavigationRoute { messages, chatDetail }

/// Extension to get route paths
extension NavigationRouteExtension on NavigationRoute {
  String get path {
    switch (this) {
      case NavigationRoute.messages:
        return '/';
      case NavigationRoute.chatDetail:
        return '/chat/:conversationId';
    }
  }

  /// Get PageRouteInfo for routes without parameters
  PageRouteInfo get route {
    switch (this) {
      case NavigationRoute.messages:
        return const MessagesRoute();
      case NavigationRoute.chatDetail:
        throw ArgumentError(
          'ChatDetailRoute requires Conversation parameter. '
          'Use pushChatDetail(conversation) instead.',
        );
    }
  }
}

/// Singleton NavigationManager with lazy initialization
class NavigationManager {
  /// Factory constructor - Singleton pattern
  factory NavigationManager() => _instance ??= NavigationManager._internal();

  NavigationManager._internal();

  static NavigationManager? _instance;

  late final AppRouter _router = AppRouter();

  /// Get the router instance
  AppRouter get router => _router;

  /// Get router config for MaterialApp.router
  RouterConfig<UrlState> get config => _router.config();

  /// Navigate to a route (for routes without parameters)
  Future<T?> push<T extends Object?>(NavigationRoute route) {
    return _router.push<T>(route.route);
  }

  /// Navigate to chat detail with conversation data
  Future<T?> pushChatDetail<T extends Object?>(Conversation conversation) {
    return _router.push<T>(
      ChatDetailRoute(
        conversationId: conversation.id,
        conversation: conversation,
      ),
    );
  }

  /// Replace current route
  Future<T?> replace<T extends Object?>(NavigationRoute route) {
    return _router.replace<T>(route.route);
  }

  /// Replace with chat detail
  Future<T?> replaceChatDetail<T extends Object?>(Conversation conversation) {
    return _router.replace<T>(
      ChatDetailRoute(
        conversationId: conversation.id,
        conversation: conversation,
      ),
    );
  }

  /// Replace all routes
  Future<void> replaceAll(List<PageRouteInfo> routes) {
    return _router.replaceAll(routes);
  }

  /// Pop current route
  Future<bool> pop<T extends Object?>([T? result]) {
    return _router.maybePop<T>(result);
  }

  /// Pop until predicate
  void popUntil(bool Function(Route<dynamic>) predicate) {
    _router.popUntil(predicate);
  }

  /// Pop to root (messages)
  void popToRoot() {
    _router.popUntilRoot();
  }

  /// Get current route name
  String? get currentRouteName => _router.current.name;

  /// Check if can pop
  bool get canPop => _router.canPop();

  /// Get navigator key for context access
  GlobalKey<NavigatorState> get navigatorKey => _router.navigatorKey;

  /// Reset instance (useful for testing)
  @visibleForTesting
  static void resetInstance() {
    _instance = null;
  }
}
