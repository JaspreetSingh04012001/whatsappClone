import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whatsappclone/auth/Controller/authController.dart';

class AuthSuccess extends StatelessWidget {
  const AuthSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.find<Authcontroller>();
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome ${authcontroller.myUser.username} \n Your Phone number is ${authcontroller.myUser.phoneNumber} ",
        ),
      ),
    );
  }
}
