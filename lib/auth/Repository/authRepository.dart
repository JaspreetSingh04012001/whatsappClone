import 'package:firebase_auth/firebase_auth.dart';

class Authrepository {
  var auth = FirebaseAuth.instance;
  var result;
  String otp = "123456";
  String signInWithPhoneNumber({required String phoneNumber}) {
    try {
      //    await auth.verifyPhoneNumber(
      //   phoneNumber: phoneNumber,
      //   verificationCompleted: (phoneAuthCredential) {},
      //   verificationFailed: (error) {},
      //   codeAutoRetrievalTimeout: (verificationId) {},
      //   codeSent: (verificationId, forceResendingToken) {},
      // );
    } catch (e) {
      return "OTP sent failed";
    }

    return "Otp is sent ";
  }

  Future<bool> submitOtp(String verificationCode) async {
    return verificationCode == otp;

    // UserCredential userCredential = await (result as ConfirmationResult)
    //     .confirm(verificationCode);
    // return userCredential.user != null;
  }
  uploadProfilePicture(){
    
  }
  setUserName(String userName){
    
  }


}
