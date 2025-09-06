import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsappclone/auth/Model/User.dart';
import 'package:whatsappclone/auth/Repository/authRepository.dart';
import 'package:whatsappclone/auth/View/OtpScreen.dart';
import 'package:whatsappclone/auth/View/PhoneNumber.dart';
import 'package:whatsappclone/auth/View/readyProfile.dart';
import 'package:whatsappclone/auth/View/splash_screen.dart';
import 'package:whatsappclone/home/home.dart';
// import 'package:whatsappclone/screens/home_screen.dart';

class Authcontroller extends GetxController {
  String tempPhoneNumber = "";
  User myUser = User();
  Authrepository authrepository;
  Authcontroller({required this.authrepository, required this.box});
  GetStorage box;
  late bool isUserLoggedIn;
  @override
  void onInit() {
    isUserLoggedIn = box.read("isUserLoggedIn") ?? false;

    // TODO: implement onInit
    super.onInit();
  }

  checkUserIsLoggedIn() async {
    await Future.delayed(Duration(seconds: 2));
    if (isUserLoggedIn) {
      Get.offAll(Home());
    } else {
      Get.to(() => PhoneNumber());
    }
  }

  uploadProfilePicture(XFile pic) {
    myUser.setProfilePictureXfile(pic);
    update();
  }

  setUserName(String userName) {
    myUser.setusername(userName);
    update();
    //authrepository.setUserName(userName);
  }

  readyProfile() {
    box.write("isUserLoggedIn", true);
    Get.offAll(Home());
    // Get.to(() => Home());
  }

  logOut() {
    box.write("isUserLoggedIn", false);
    Get.offAll(SplashScreen());
  }

  signInWithPhoneNumber(String number) {
    String message = authrepository.signInWithPhoneNumber(phoneNumber: number);

    if (message == "Otp is sent ") {
      tempPhoneNumber = number;
      Get.to(OtpScreen());
    }
  }

  resndOTP() {
    authrepository.signInWithPhoneNumber(phoneNumber: tempPhoneNumber);
  }

  submitOtp(verificationCode) async {
    bool authPassed = await authrepository.submitOtp(verificationCode);
    if (authPassed) {
      myUser.setPhoneNumber(tempPhoneNumber);
      box.write("isUserLoggedIn", true);
      Get.to(ReadyProfile());
    } else {
      Get.dialog(AlertDialog(title: Text("Wrong Otp")));
    }
  }


  updateUserProfilePicture() {}
  updateUserName() {}
  updateUserStatus() {}
  updateUserAbout() {}
  updateUserPhoneNumber() {}
//  updateUserEmail() {}
 // updateUserPassword() {}

dataBackUp(){}
deleteUserAccount(){}
deleteChat(){}




}
