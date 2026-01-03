import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

/// A circular badge displaying unread message count.
///
/// Returns an empty widget if count is 0 or negative.
class UnreadBadge extends StatelessWidget {
  const UnreadBadge({
    required this.count,
    super.key,
    this.size = 20,
  });

  /// The number of unread messages to display.
  final int count;

  /// The size (diameter) of the badge.
  final double size;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    final displayText = count > 99 ? '99+' : count.toString();

    return Container(
      height: size,
      constraints: BoxConstraints(minWidth: size),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Center(
        child: Text(
          displayText,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
