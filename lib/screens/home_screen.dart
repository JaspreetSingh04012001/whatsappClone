import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Styles/icons.dart';
import 'package:whatsappclone/home/controller/homeController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(
      initialIndex: Get.find<Homecontroller>().selectedScreenIndex,
      length: Get.find<Homecontroller>().internalScreens.length,
      vsync: this,
    );
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller,
          onTap: (index) {
            Get.find<Homecontroller>().updateScreenIndex(index);
          },
          dividerColor: Colors.transparent,

          tabs: [
            Tab(icon: Image.asset(AppIcons.communityIcon(), height: 30)),
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
        ),
      ),
      body: GetBuilder<Homecontroller>(
        builder: (homecontroller) {
          return homecontroller.getInternalScreen();
        },
      ),
    );
  }
}
