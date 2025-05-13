import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsappclone/Data/Model/chat_tile_user.dart';
import 'package:whatsappclone/Styles/theme.dart';
import 'package:whatsappclone/screens/chat_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatTileUser> users = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            users.add(
              ChatTileUser(
                isOnline: true,
                lastMessage: "this is something new",
                lastMessageTime: DateTime.now(),
                username: "pagal",
                profilePicture:
                    "https://randomuser.me/api/portraits/women/${users.length}.jpg",
              ),
            );
          });
        },
        child: Icon(Icons.message),
      ),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ChatScreen(userChatTile: users[index]);
                  },
                ),
              );
            },
            leading: CircleAvatar(
              foregroundImage:
                  users[index].profilePicture == null
                      ? null
                      : NetworkImage(users[index].profilePicture.toString()),
            ),
            title: Text(users[index].username),
            subtitle: Text(users[index].lastMessage),
            trailing: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat.jms().format(users[index].lastMessageTime)),

                  (users[index].unReadMessageCount == null)
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
                          child: Text("${users[index].unReadMessageCount}"),
                        ),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
