import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Data/Repositoy/chatRepository.dart';
import 'package:whatsappclone/chat/chatController.dart';
import 'package:whatsappclone/chat/view/chats_screen.dart';
import 'package:whatsappclone/screens/calls_screen.dart';
import 'package:whatsappclone/screens/community_screens.dart';
import 'package:whatsappclone/screens/status_screen.dart';

class Homecontroller extends GetxController {
  List<Widget> internalScreens = [
    CommunityScreens(),
    ChatsScreen(),
    StatusScreen(),
    CallsScreen(),
  ];
  var selectedScreenIndex = 0;

  updateScreenIndex(int index) {
    if (index == 1) {
      Get.put(ChatController(chatRepo: Chatrepository()), permanent: true);
    }
    selectedScreenIndex = index;
    update();
  }

  Widget getInternalScreen() {
    return internalScreens[selectedScreenIndex];
  }

chatDelete(){
  
}

}
