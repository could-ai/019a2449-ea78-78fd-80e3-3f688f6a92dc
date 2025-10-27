import 'package:couldai_user_app/models/message_model.dart';

class ChatModel {
  final String id;
  final String name;
  final String avatarUrl;
  final List<Message> messages;

  ChatModel({required this.id, required this.name, required this.avatarUrl, required this.messages});
}

// Mock data based on the provided React code
// Using 'user' as the senderId for the current user, and contact's id for the other person.
List<ChatModel> mockChats = [
  ChatModel(
    id: "1",
    name: "AHP Connect",
    avatarUrl: "https://i.pravatar.cc/150?u=jane-doe",
    messages: [
      Message(senderId: "1", text: "Can't wait!", timestamp: DateTime.now().subtract(const Duration(minutes: 7))),
      Message(senderId: "user", text: "Me neither!", timestamp: DateTime.now().subtract(const Duration(minutes: 6))),
      Message(senderId: "1", text: "Great! See you then.", timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
      Message(senderId: "user", text: "Yes, absolutely!", timestamp: DateTime.now().subtract(const Duration(minutes: 9))),
      Message(senderId: "1", text: "Hey, are we still on for tomorrow?", timestamp: DateTime.now().subtract(const Duration(minutes: 10))),
    ],
  ),
  ChatModel(
    id: "2",
    name: "John Smith",
    avatarUrl: "https://i.pravatar.cc/150?u=john-smith",
    messages: [
      Message(senderId: "2", text: "Available", timestamp: DateTime.now().subtract(const Duration(hours: 1))),
    ],
  ),
  ChatModel(
    id: "3",
    name: "AHP Support",
    avatarUrl: "https://i.pravatar.cc/150?u=emily-white",
    messages: [
      Message(senderId: "user", text: "Can you send me the project file?", timestamp: DateTime.now().subtract(const Duration(hours: 2))),
      Message(senderId: "3", text: "Sure, sending it over now.", timestamp: DateTime.now().subtract(const Duration(hours: 1))),
    ],
  ),
  ChatModel(
    id: "g1",
    name: "React Developers",
    avatarUrl: "https://i.pravatar.cc/150?u=group-react",
    messages: [
      Message(senderId: "2", text: "Hey everyone, standup in 5!", timestamp: DateTime.now().subtract(const Duration(minutes: 15))),
      Message(senderId: "3", text: "On my way!", timestamp: DateTime.now().subtract(const Duration(minutes: 14))),
      Message(senderId: "user", text: "👍", timestamp: DateTime.now().subtract(const Duration(minutes: 14))),
    ],
  ),
   ChatModel(
    id: "b1",
    name: "Project Team",
    avatarUrl: "https://i.pravatar.cc/150?u=project-team",
    messages: [
       Message(senderId: "user", text: "Don't forget the deadline tomorrow!", timestamp: DateTime.now().subtract(const Duration(days: 1))),
    ],
  ),
];
