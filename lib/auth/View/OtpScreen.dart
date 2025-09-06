// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsappclone/auth/Controller/authController.dart';

class OtpScreen extends StatelessWidget {
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Pinput(
              length: 6,
              controller: pinController,
            ).paddingOnly(bottom: 10),
            ElevatedButton(
              onPressed: () {
                if (pinController.text.length == 6) {
                  Get.find<Authcontroller>().submitOtp(pinController.text);
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
