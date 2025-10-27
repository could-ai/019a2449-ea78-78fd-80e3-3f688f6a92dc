import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/chat_model.dart';
import 'package:couldai_user_app/screens/conversation_screen.dart';
import 'package:intl/intl.dart';


class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sort chats by the timestamp of the most recent message
    mockChats.sort((a, b) {
      final aLastMessage = a.messages.isNotEmpty ? a.messages.first.timestamp : DateTime(1970);
      final bLastMessage = b.messages.isNotEmpty ? b.messages.first.timestamp : DateTime(1970);
      return bLastMessage.compareTo(aLastMessage);
    });

    return ListView.separated(
      itemCount: mockChats.length,
      itemBuilder: (context, index) {
        final chat = mockChats[index];
        final lastMessage = chat.messages.isNotEmpty ? chat.messages.first : null;

        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(chat.avatarUrl),
          ),
          title: Text(
            chat.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            lastMessage?.text ?? "No messages yet",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            lastMessage != null ? DateFormat.jm().format(lastMessage.timestamp) : "",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ConversationScreen(chat: chat),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 0,
        indent: 88,
      ),
    );
  }
}
