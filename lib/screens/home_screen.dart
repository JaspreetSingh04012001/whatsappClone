import 'package:flutter/material.dart';
import 'package:whatsappclone/Styles/icons.dart';
import 'package:whatsappclone/screens/calls_screen.dart';
import 'package:whatsappclone/screens/chats_screen.dart';
import 'package:whatsappclone/screens/community_screens.dart';
import 'package:whatsappclone/screens/status_screen.dart';
import 'package:whatsappclone/utils/deviceInfo.dart';
import 'package:whatsappclone/widget/internalHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
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
  void updateTitle() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var tabBar =
        Deviceinfo.getDeviceType(context) == "WEB"
            ? Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedScreenIndex = 0;
                    });
                  },
                  child: Tab(
                    icon: Image.asset(AppIcons.communityIcon(), height: 30),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedScreenIndex = 1;
                    });
                  },
                  child: Tab(text: 'Chats'),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedScreenIndex = 2;
                    });
                  },
                  child: Tab(text: 'Status'),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedScreenIndex = 3;
                    });
                  },
                  child: Tab(text: 'Calls'),
                ),
              ],
            )
            : TabBar(
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
            );
    return Scaffold(

      appBar: AppBar(
        bottom:
            Deviceinfo.getDeviceType(context) == "WEB"
                ? null
                : (tabBar as TabBar),
        title: Text("WhatsApp"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.pageview_sharp),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.pageview_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.pageview_sharp)),
        ],
      ),
      body:
          Deviceinfo.getDeviceType(context) == "WEB"
              ? Row(
                children: [
                  SizedBox(width: 80, height: double.infinity, child: tabBar),
                  Container(
                    width: 400,
                    height: double.infinity,
                    color: Colors.red,
                    child: internalScreens[selectedScreenIndex],
                  ),
                  Expanded(child: Internalhomescreen ?? Container()),
                ],
              )
              : internalScreens[selectedScreenIndex],
    );
  }
}
