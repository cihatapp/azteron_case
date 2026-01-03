import 'package:flutter/material.dart';

/// A widget that dismisses the keyboard when tapping outside of text fields.
///
/// Wrap your Scaffold or main content with this widget to enable
/// tap-to-dismiss keyboard behavior throughout the screen.
class UnfocusOnTap extends StatelessWidget {
  const UnfocusOnTap({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
