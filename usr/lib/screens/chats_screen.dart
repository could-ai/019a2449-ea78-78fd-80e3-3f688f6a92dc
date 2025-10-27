import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/chat_model.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: mockChats.length,
      itemBuilder: (context, index) {
        final chat = mockChats[index];
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
            chat.message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            chat.time,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          onTap: () {
            // Placeholder for navigating to a chat conversation
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
