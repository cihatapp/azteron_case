import 'package:azteron_case/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A wrapper widget that applies shimmer effect to its child.
class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Shimmer.fromColors(
      baseColor: isDark
          ? context.colorScheme.surfaceContainerHighest
          : Colors.grey.shade300,
      highlightColor: isDark
          ? context.colorScheme.surfaceContainerHigh
          : Colors.grey.shade100,
      child: child,
    );
  }
}

/// A simple shimmer box placeholder.
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    required this.width,
    required this.height,
    super.key,
    this.borderRadius = 8,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

/// A circular shimmer placeholder.
class ShimmerCircle extends StatelessWidget {
  const ShimmerCircle({
    required this.size,
    super.key,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
