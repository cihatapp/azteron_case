import 'package:azteron_case/core/extensions/context_extension.dart';
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
    final isSent = message.isSentByMe;
    final colors = context.appColors;

    // Use theme colors for bubble and text
    final bubbleColor = isSent ? colors.sentBubble : colors.receivedBubble;
    final textColor = isSent ? colors.sentBubbleText : colors.receivedBubbleText;

    return Padding(
      padding: EdgeInsets.only(
        left: isSent ? 60 : 16,
        right: isSent ? 16 : 60,
        top: 4,
        bottom: 4,
      ),
      child: Column(
        crossAxisAlignment:
            isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Message bubble
          Container(
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * 0.75,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isSent ? 20 : 4),
                bottomRight: Radius.circular(isSent ? 4 : 20),
              ),
            ),
            child: Text(
              message.content,
              style: context.appStyles.messageText.copyWith(color: textColor),
            ),
          ),
          // Time outside bubble - using theme
          Padding(
            padding: EdgeInsets.only(
              top: 6,
              left: isSent ? 0 : 4,
              right: isSent ? 4 : 0,
            ),
            child: Text(
              message.formattedTime,
              style: context.appStyles.messageTime,
            ),
          ),
        ],
      ),
    );
  }
}
