import 'package:azteron_case/core/extension/context_extension.dart';
import 'package:azteron_case/core/theme/dark/color_scheme_dark.dart';
import 'package:azteron_case/core/theme/light/color_scheme_light.dart';
import 'package:azteron_case/features/chat_detail/data/models/message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    super.key,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final isSent = message.isSentByMe;

    // Get theme-appropriate bubble colors
    final Color bubbleColor;
    final Color textColor;

    if (isDark) {
      final colors = ColorSchemeDark();
      bubbleColor = isSent ? colors.sentBubble : colors.receivedBubble;
      textColor = isSent ? colors.sentBubbleText : colors.receivedBubbleText;
    } else {
      final colors = ColorSchemeLight();
      bubbleColor = isSent ? colors.sentBubble : colors.receivedBubble;
      textColor = isSent ? colors.sentBubbleText : colors.receivedBubbleText;
    }

    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: context.screenWidth * 0.75,
        ),
        margin: EdgeInsets.only(
          left: isSent ? 48 : 16,
          right: isSent ? 16 : 48,
          top: 4,
          bottom: 4,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: bubbleColor,
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
            Text(
              message.content,
              style: context.textTheme.bodyMedium?.copyWith(
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.formattedTime,
              style: context.textTheme.bodySmall?.copyWith(
                color: textColor.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
