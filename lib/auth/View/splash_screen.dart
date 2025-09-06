import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Styles/icons.dart';
import 'package:whatsappclone/auth/Controller/authController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Authcontroller>().checkUserIsLoggedIn();
    return Scaffold(body: Center(child: Image.asset(AppIcons.appIcon())));
  }
}
