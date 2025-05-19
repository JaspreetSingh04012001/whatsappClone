import 'package:flutter/material.dart';
import 'package:whatsappclone/Styles/icons.dart';
import 'package:whatsappclone/screens/home_screen.dart';
import 'package:whatsappclone/widget/internalHomeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(key: homeScreenKey,)),
      );
    });
    return Scaffold(body: Center(child: Image.asset(AppIcons.appIcon())));
  }
}
