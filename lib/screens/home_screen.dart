import 'package:flutter/material.dart';
import 'package:whatsappclone/Styles/icons.dart';
import 'package:whatsappclone/screens/calls_screen.dart';
import 'package:whatsappclone/screens/chats_screen.dart';
import 'package:whatsappclone/screens/community_screens.dart';
import 'package:whatsappclone/screens/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  List<Widget> internalScreens = [
    CommunityScreens(),
    ChatsScreen(),
    StatusScreen(),
    CallsScreen(),
  ];

  late int selectedScreenIndex;
  @override
  void initState() {
    selectedScreenIndex = 0;
    controller = TabController(
      initialIndex: selectedScreenIndex,
      length: internalScreens.length,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          onTap: (index) {
            setState(() {
              selectedScreenIndex = index;
            });
          },
          dividerColor: Colors.transparent,
          controller: controller,
          tabs: [
            Tab(icon: Image.asset(AppIcons.communityIcon(), height: 30)),
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
        ),
        title: Text("WhatsApp"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.pageview_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.pageview_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.pageview_sharp)),
        ],
      ),
      body: internalScreens[selectedScreenIndex],
    );
  }
}
