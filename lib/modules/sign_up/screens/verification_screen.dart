import 'package:arrows/components/loading_spinner.dart';
import 'package:arrows/components/pin_code_field.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/sign_up/controllers/signup_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../components/custom_cart_button.dart';
import '../../../constants/more_info_constants.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50.h,
                ) ,

                Image.asset(
                  "assets/images/check-mark.png",

                  width: 180.w,
                  height: 180.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: PinCodeField(
                    textEditingController:
                    signUpController.pinTextEditingController,
                  ),
                ),
                CustomCartButton(
                    isCart: false,
                    color:mainColor,
                    textColor:kPrimaryColor,
                    text: "confirm_user".tr,
                    onPressed: () async {
                      try{
                        showLoaderDialog(context);
                        await signUpController.verifyCode();
                      }on FirebaseException catch(error){
                        if(error == 'FIRAuthErrorCodeNetworkError'){
                          Get.defaultDialog(content: Text('Network Connection error '),);
                        }else{
                          Get.back();
                          Get.defaultDialog(content: Text('wrong_code'.tr), title: 'error'.tr);
                        }
                      }
                    }),
               k.sizedBoxH,
                CustomCartButton(
                  isCart: false,
                    color:mainColor,
                    textColor:kPrimaryColor,
                    text: "resend_code".tr,
                    onPressed: () async {
                      showLoaderDialog(context);
                      await signUpController.sendVerificationCode();

                    }),
                // SizedBox(
                //   width: 300.w,
                //   height: 40.h,
                //   child: OutlinedButton(
                //       onPressed: () async {
                //
                //         showLoaderDialog(context);
                //         await signUpController.sendVerificationCode();
                //       },
                //       style: OutlinedButton.styleFrom(
                //           backgroundColor: mainColor),
                //       child: Text(
                //         "resend_code".tr,
                //         style: TextStyle(
                //             color: kPrimaryColor, fontWeight: FontWeight.w600,fontSize: 14.sp),
                //       )),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
