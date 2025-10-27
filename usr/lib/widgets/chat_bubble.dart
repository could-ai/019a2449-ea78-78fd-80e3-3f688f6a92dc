import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/message_model.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isMe ? theme.colorScheme.primary : theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
            bottomLeft: isMe ? const Radius.circular(20.0) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: isMe ? theme.colorScheme.onPrimary : theme.colorScheme.onSecondaryContainer,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              DateFormat.jm().format(message.timestamp),
              style: TextStyle(
                color: isMe
                    ? theme.colorScheme.onPrimary.withOpacity(0.7)
                    : theme.colorScheme.onSecondaryContainer.withOpacity(0.7),
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
