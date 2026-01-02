import 'package:flutter/material.dart';

/// Online indicator color
const Color _onlineColor = Color(0xFF4CAF50);

/// Offline indicator color
const Color _offlineColor = Color(0xFF9E9E9E);

/// A circular avatar with an online/offline status indicator.
///
/// The status indicator is positioned at the bottom-right of the avatar.
class AvatarWithStatus extends StatelessWidget {
  const AvatarWithStatus({
    required this.imageUrl,
    required this.isOnline,
    super.key,
    this.radius = 24,
    this.statusSize = 12,
  });

  /// URL of the avatar image. Can be a network or asset URL.
  final String imageUrl;

  /// Whether the user is currently online.
  final bool isOnline;

  /// Radius of the avatar circle.
  final double radius;

  /// Size of the status indicator dot.
  final double statusSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2 + 4,
      height: radius * 2 + 4,
      child: Stack(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            onBackgroundImageError: (exception, stackTrace) {},
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: statusSize,
              height: statusSize,
              decoration: BoxDecoration(
                color: isOnline ? _onlineColor : _offlineColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
