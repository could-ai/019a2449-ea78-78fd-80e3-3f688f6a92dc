class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({required this.name, required this.message, required this.time, required this.avatarUrl});
}

// Mock data based on the provided React code
List<ChatModel> mockChats = [
  ChatModel(
    name: "AHP Connect",
    message: "Hey, are we still on for tomorrow?",
    time: "4:30 PM",
    avatarUrl: "https://i.pravatar.cc/150?u=jane-doe",
  ),
  ChatModel(
    name: "John Smith",
    message: "Available",
    time: "3:21 PM",
    avatarUrl: "https://i.pravatar.cc/150?u=john-smith",
  ),
  ChatModel(
    name: "AHP Support",
    message: "Sure, sending it over now.",
    time: "1:05 PM",
    avatarUrl: "https://i.pravatar.cc/150?u=emily-white",
  ),
  ChatModel(
    name: "React Developers",
    message: "Hey everyone, standup in 5!",
    time: "12:15 PM",
    avatarUrl: "https://i.pravatar.cc/150?u=group-react",
  ),
   ChatModel(
    name: "Project Team",
    message: "Don't forget the deadline tomorrow!",
    time: "Yesterday",
    avatarUrl: "https://i.pravatar.cc/150?u=project-team",
  ),
];
