import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:whatsappclone/Data/Repositoy/chatRepository.dart';
import 'package:whatsappclone/Styles/theme.dart';
import 'package:whatsappclone/chat/chatController.dart';
import 'package:whatsappclone/home/controller/homeController.dart';
import 'package:whatsappclone/screens/splash_screen.dart';

void main() {
  Get.lazyPut(() => Homecontroller(), fenix: true);
 // Get.lazyPut(() => ChatController(chatRepo: Chatrepository()), fenix: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme(context),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          darkTheme: darkTheme(context),
        );
      },
    );
  }
}
