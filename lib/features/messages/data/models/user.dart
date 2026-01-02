import 'package:equatable/equatable.dart';

/// Represents a user in the messaging app.
class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isOnline = false,
  });

  /// Unique identifier for the user.
  final String id;

  /// Display name of the user.
  final String name;

  /// URL of the user's avatar image.
  final String avatarUrl;

  /// Whether the user is currently online.
  final bool isOnline;

  @override
  List<Object?> get props => [id, name, avatarUrl, isOnline];
}
