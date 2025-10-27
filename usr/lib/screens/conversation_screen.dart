import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/chat_model.dart';
import 'package:couldai_user_app/models/message_model.dart';
import 'package:couldai_user_app/widgets/chat_bubble.dart';
import 'package:couldai_user_app/widgets/chat_input.dart';

class ConversationScreen extends StatefulWidget {
  final ChatModel chat;

  const ConversationScreen({super.key, required this.chat});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    // Create a mutable copy of the messages
    _messages = List<Message>.from(widget.chat.messages);
    // Sort messages by timestamp, oldest first
    _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  void _handleSendMessage(String text) {
    if (text.trim().isEmpty) return;

    final newMessage = Message(
      senderId: 'user', // Assuming 'user' is the ID for the current user
      text: text.trim(),
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(newMessage);
    });

    // Simulate a reply after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        final replyMessage = Message(
          senderId: widget.chat.id,
          text: "Thanks for your message! This is an automated reply.",
          timestamp: DateTime.now(),
        );
        setState(() {
          _messages.add(replyMessage);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.chat.avatarUrl),
            ),
          ],
        ),
        title: Text(widget.chat.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Placeholder for video call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Placeholder for audio call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Placeholder for more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false, // To show messages from the bottom up
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message.senderId == 'user';
                return ChatBubble(
                  message: message,
                  isMe: isMe,
                );
              },
            ),
          ),
          ChatInput(
            onSendMessage: _handleSendMessage,
          ),
        ],
      ),
    );
  }
}
