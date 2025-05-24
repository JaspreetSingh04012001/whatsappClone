import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whatsappclone/Styles/theme.dart';
import 'package:whatsappclone/chat/Model/chat_tile_user.dart';
import 'package:whatsappclone/chat/chatController.dart';
import 'package:whatsappclone/chat/view/chat_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
      ),
      body: GetBuilder<ChatController>(
        builder: (chatController) {
          if(chatController.isChatLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(chatController.users == null  ){
            return Center(child: Text("No chat started yet"),);
          }
          if(chatController.users!.isEmpty  ){
            return Center(child: Text("No chat started yet"),);
          }
          return ListView.separated(
            itemCount: chatController.users!.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              ChatTileUser user = chatController.users![index];
              return ListTile(
                onTap: () {
                  Get.to(ChatScreen(userChatTile: user));
                },
                leading: CircleAvatar(
                  foregroundImage:
                      user.profilePicture == null
                          ? null
                          : NetworkImage(user.profilePicture.toString()),
                ),
                title: Text(user.username),
                subtitle: Text(user.lastMessage),
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat.jms().format(user.lastMessageTime)),

                      (user.unReadMessageCount == null)
                          ? Icon(Icons.airplane_ticket, size: 18)
                          : Container(
                            decoration: BoxDecoration(
                              color: lightWhatsAppTeal,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              child: Text("${user.unReadMessageCount}"),
                            ),
                          ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
