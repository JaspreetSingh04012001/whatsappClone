import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/auth/Controller/authController.dart';
import 'package:whatsappclone/screens/home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        double width = Get.width;
        // if (width >= 1024) {
        // } else {}
        return Container(
         
          child:  HomeScreen()
          ,
        );
      },
    );
  }
}

