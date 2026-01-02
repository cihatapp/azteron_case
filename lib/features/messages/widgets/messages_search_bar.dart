import 'package:azteron_case/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class MessagesSearchBar extends StatelessWidget {
  const MessagesSearchBar({
    required this.onChanged,
    super.key,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: context.l10n.searchMessages,
          hintStyle: TextStyle(
            color: context.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: context.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          filled: true,
          fillColor: context.colorScheme.surfaceContainerHighest,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
