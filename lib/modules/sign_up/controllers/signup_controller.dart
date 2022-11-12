import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/bottom_nav_bar/screens/bottom_nav_bar_screen.dart';
import 'package:arrows/modules/sign_up/models/user_model.dart' as user;
import 'package:arrows/modules/sign_up/screens/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //
  TextEditingController phoneTextEditingController = TextEditingController();
  String? userNameTextEditingController;
  String? passwordTextEditingController;
  TextEditingController pinTextEditingController = TextEditingController();
  String? fullPhoneNumber;

  //form key
  final formKey = GlobalKey<FormState>();

  //code
  String? verification;

  Future<void> sendVerificationCode() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: fullPhoneNumber ?? "",
      verificationCompleted: (PhoneAuthCredential phoneAuthCredentials) async {
        await FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredentials)
            .then((value) {
          if (value.user != null) {
            print("user verified");
          }
          else
          {
            print('failed');
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.back();
        Get.defaultDialog(
            content: Text(" حاول مدره اخري") ,title: 'تعذر الإتصال بالإنترنت'
        );
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verification = verificationId;
        Get.back();
        Get.to(() => VerificationScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verification = verificationId;
      },
      timeout: Duration(minutes: 1),
    );
  }

  Future<void> verifyCode() async {
    var users = await user.User(
        name: userNameTextEditingController,
        phone: fullPhoneNumber,
        password: passwordTextEditingController,
        userDeviceToken:await CacheHelper.getDataToSharedPrefrence("deviceToken"),
        points: '0',
        // id:FirebaseAuth.instance.currentUser!.uid,
        id:CacheHelper.getDataToSharedPrefrence("userID"));

    PhoneAuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: verification ?? "",
        smsCode: pinTextEditingController.text);
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      if (value.user != null) {
        Get.back();
        CacheHelper.saveDataToSharedPrefrence("user", users.toJson());
        CacheHelper.loginShared = users;
        FirebaseDatabase.instance
            .reference()
            .child("Users")
            .child(FirebaseAuth.instance.currentUser!.uid)
            // .child(CacheHelper.loginShared!.phone.toString())
            .set(users.toJson());
        CacheHelper.saveDataToSharedPrefrence("userID", FirebaseAuth.instance.currentUser!.uid);
        CacheHelper.saveDataToSharedPrefrence("userName", users.name.toString());
        Get.offAll(() => BottomNavBarScreen());
      }
    });
  }
}
