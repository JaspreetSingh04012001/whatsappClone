import 'package:get/get.dart';
import 'package:whatsappclone/Data/Repositoy/chatRepository.dart';
import 'package:whatsappclone/chat/Model/chat_tile_user.dart';

class ChatController extends GetxController {
  Chatrepository chatRepo;
  ChatController({required this.chatRepo});

  bool isChatLoading = true;
  List<ChatTileUser>? users;
  @override
  onInit() {
    getChats();
  }

  getChats() {
    chatRepo.getChats().then((chats) {
      isChatLoading = false;
      users = chats;
      update();
    });
  }

chatDelete(){}
chatMute(){}
chatPin(){}
chatArchieve(){}
selectAllChat(){}
chatLock(){}
chatFavourite(){}
addChatBroadcast(){}
addchatList(){}
chatBlock(){}
chatMarkAsRead(){}
chatMarkAsUnread(){}
chatViewContact(){}









  /*
Newuser = users.add(
  ChatTileUser(
    isOnline: true,
    lastMessage: "this is something new",
    lastMessageTime: DateTime.now(),
    username: "pagal",
    profilePicture:
        "https://randomuser.me/api/portraits/women/${users.length}.jpg",
  ),
);

 */
}
