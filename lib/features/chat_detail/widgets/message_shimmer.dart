import 'package:azteron_case/core/extension/context_extension.dart';
import 'package:azteron_case/features/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

/// Shimmer placeholder for a message bubble.
class MessageBubbleShimmer extends StatelessWidget {
  const MessageBubbleShimmer({
    required this.isSent,
    super.key,
  });

  final bool isSent;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: ShimmerLoading(
        child: Container(
          margin: EdgeInsets.only(
            left: isSent ? 80 : 16,
            right: isSent ? 16 : 80,
            top: 4,
            bottom: 4,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: Radius.circular(isSent ? 18 : 4),
              bottomRight: Radius.circular(isSent ? 4 : 18),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShimmerBox(
                width: isSent ? 140 : 180,
                height: 16,
                borderRadius: 4,
              ),
              const SizedBox(height: 6),
              const ShimmerBox(width: 40, height: 10, borderRadius: 4),
            ],
          ),
        ),
      ),
    );
  }
}

/// A list of message shimmer placeholders for loading state.
class MessageListShimmer extends StatelessWidget {
  const MessageListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a realistic chat pattern
    final messages = [
      false, // received
      false, // received
      true, // sent
      false, // received
      true, // sent
      true, // sent
      false, // received
      true, // sent
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: messages.length + 1, // +1 for date separator
      itemBuilder: (context, index) {
        if (index == 0) {
          return const _DateSeparatorShimmer();
        }
        return MessageBubbleShimmer(isSent: messages[index - 1]);
      },
    );
  }
}

class _DateSeparatorShimmer extends StatelessWidget {
  const _DateSeparatorShimmer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ShimmerLoading(
          child: Container(
            width: 80,
            height: 28,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
