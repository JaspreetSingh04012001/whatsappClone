import 'package:whatsappclone/chat/Model/chat_tile_user.dart';

class Chatrepository {
  Future<List<ChatTileUser>?> getChats() async {
    // API
    await Future.delayed(Duration(seconds: 2));
    return null;
    return [
      ChatTileUser(
        lastMessage: "Chhhll bhag",
        isOnline: true,
        lastMessageTime: DateTime.now(),
        username: "jass",
      ),
      ChatTileUser(
        lastMessage: "Hi how are you",
        isOnline: true,
        lastMessageTime: DateTime.now(),
        username: "Raman",
      ),
      ChatTileUser(
        lastMessage: "College nee aana kya",
        isOnline: true,
        lastMessageTime: DateTime.now(),
        username: "Pooja",
      ),
    ];
  }
}
