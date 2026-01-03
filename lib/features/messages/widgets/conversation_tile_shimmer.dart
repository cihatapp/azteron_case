import 'package:azteron_case/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

/// Shimmer placeholder for a conversation tile.
class ConversationTileShimmer extends StatelessWidget {
  const ConversationTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar placeholder
            const ShimmerCircle(size: 52),
            const SizedBox(width: 12),
            // Content placeholder
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name placeholder
                  const ShimmerBox(width: 120, height: 16),
                  const SizedBox(height: 8),
                  // Message preview placeholder
                  ShimmerBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Time and badge placeholder
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShimmerBox(width: 48, height: 12),
                SizedBox(height: 8),
                ShimmerCircle(size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// A list of conversation tile shimmers for loading state.
class ConversationListShimmer extends StatelessWidget {
  const ConversationListShimmer({
    super.key,
    this.itemCount = 8,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: 80,
      ),
      itemBuilder: (context, index) => const ConversationTileShimmer(),
    );
  }
}
