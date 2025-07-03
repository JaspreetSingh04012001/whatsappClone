import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:whatsappclone/auth/Controller/authController.dart';

class PhoneNumber extends StatelessWidget {
  PhoneNumber({super.key});
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Enter Your Fuckin Phone number"),
          TextField(
            controller: textEditingController,
            onChanged: (value) {},
          ).paddingSymmetric(vertical: 10, horizontal: 10),
          ElevatedButton(
            onPressed: () {
              if (textEditingController.text.length > 9) {
                Get.find<Authcontroller>().signInWithPhoneNumber(
                  "+91${textEditingController.text}",
                );
              }
            },
            child: Text("Send Otp"),
          ),
        ],
      ),
    );
  }
}
