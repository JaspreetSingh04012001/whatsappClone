class ChatTileUser {
  bool isOnline;
  bool lastMessageRead;
  String? profilePicture;
  String lastMessage;
  String username;
  int? unReadMessageCount;
  DateTime lastMessageTime = DateTime.now();

  ChatTileUser({
    required this.isOnline,
    this.lastMessageRead = false,
    required this.lastMessage,
    required this.lastMessageTime,
    this.profilePicture,
    this.unReadMessageCount,
    required this.username,
  });
}
