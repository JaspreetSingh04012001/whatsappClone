import 'package:image_picker/image_picker.dart';

class User {
  String? phoneNumber;
  String? userprofilePicture;
  String? username;
  XFile? userprofilePictureXfile;
  User({this.username, this.phoneNumber, this.userprofilePicture});

  setPhoneNumber(String number) {
    phoneNumber = number;
  }
  setusername(String name) {
    username = name;
  }

  setProfilePictureXfile(XFile pic) {
    userprofilePictureXfile = pic;
  }
}
