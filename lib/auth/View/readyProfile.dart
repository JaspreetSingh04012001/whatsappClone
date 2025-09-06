import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsappclone/auth/Controller/authController.dart';

class ReadyProfile extends StatelessWidget {
  ReadyProfile({super.key});
  final ImagePicker picker = ImagePicker();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Data")),
      body: Center(
        child: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<Authcontroller>(
                  builder: (authcontroller) {
                    return InkWell(
                      onTap: () {
                        picker.pickImage(source: ImageSource.gallery).then((
                          pickedImage,
                        ) {
                          if (pickedImage != null) {
                            authcontroller.uploadProfilePicture(pickedImage);
                          }
                        });
                      },
                      child: CircleAvatar(
                        radius: 200,
                        foregroundColor: Colors.amber,
                        child:
                            authcontroller.myUser.userprofilePictureXfile !=
                                    null
                                ? kIsWeb
                                    ? Image.network(
                                      authcontroller
                                          .myUser
                                          .userprofilePictureXfile!
                                          .path,
                                    )
                                    : Image.file(
                                      File(
                                        authcontroller
                                            .myUser
                                            .userprofilePictureXfile!
                                            .path,
                                      ),
                                    )
                                : Container(),
                      ),
                    );
                  },
                ),
                TextField(
                  controller: controller,
                  onChanged: (value) {
                    Get.find<Authcontroller>().setUserName(controller.text);
                  },
                ),
                GetBuilder<Authcontroller>(
                  builder: (authcontroller) {
                    return authcontroller.myUser.username != null &&
                            authcontroller.myUser.userprofilePictureXfile !=
                                null
                        ? ElevatedButton(
                          onPressed: () {
                            authcontroller.readyProfile();
                          },
                          child: Text("Submit"),
                        )
                        : Container(
                          
                        );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
