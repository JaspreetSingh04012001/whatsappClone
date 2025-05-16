import 'package:flutter/material.dart';
import 'package:whatsappclone/Data/Model/chat_tile_user.dart';
import 'package:whatsappclone/Data/Model/message.dart';
import 'package:whatsappclone/Styles/icons.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userChatTile});
  final ChatTileUser userChatTile;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      isSeen: true,
      messageSendBy: "you",
      messageTime: DateTime.now(),
      value: "Pagal h kya",
    ),
  ];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              child: CircleAvatar(
                foregroundImage: widget.userChatTile.profilePicture == null
                    ? null
                    : NetworkImage(
                        widget.userChatTile.profilePicture.toString(),
                      ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.userChatTile.username),
                Text(
                  widget.userChatTile.isOnline
                      ? "Online"
                      : "Last seen at 5:03 pm",
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  bool isMymessage = messages[index].messageSendBy == "you";
                  return Row(
                    mainAxisAlignment: isMymessage
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color:
                              isMymessage ? Colors.grey.shade500 : Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 22,
                          ),
                          child: Text(messages[index].value.toString()),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          inputField(),
        ],
      ),
    );
  }
 Widget inputField() {
  return SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset(AppIcons.plusIcon(), height: 35),
            onPressed: () {},
          ),
          Expanded(
            child: SizedBox(
              height: 45.0,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Image.asset(AppIcons.stickerIcon(), height: 30),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(AppIcons.cameraIcon(), height: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(AppIcons.micIcon(), height: 30),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
}