import 'package:arrows/components/loading_spinner.dart';
import 'package:arrows/components/phone_number_field.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/sign_up/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../components/custom_address_text_field.dart';
import '../../../components/custom_cart_button.dart';
import '../../../constants/more_info_constants.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.put(SignUpController());

// final scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Form(
              key: signUpController.formKey,
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    // Image.asset(
                    //   "assets/images/add-user.png",
                    SvgPicture.asset(
                      "assets/images/login.svg",
                      width: 200.w,
                      height: 400.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    PhoneNumberField(
                      controller: signUpController.phoneTextEditingController,
                    ), SizedBox(
                      height: 10.h,
                    ),

                Container(
                  width: 348.w,
                  child:  TextFormField(
                    style: TextStyle(color: kPrimaryColor),


                    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter User Name';
                        }
                        return null;
                      },
                      onChanged: (newValue) {
                        signUpController.userNameTextEditingController =
                            newValue;
                      },
                      decoration:

                      InputDecoration(
                        hintText: "user_name".tr,
                        filled: true,
                        fillColor: Colors.white,

                        isDense: true,
                        // Added this
                        contentPadding: EdgeInsets.all(13.w),
                        hintStyle: TextStyle(color: mainColor, fontSize: 14.sp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainColor,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // TextFormField(
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter Password';
                    //     }
                    //     return null;
                    //   },
                    //   onChanged: (newValue) {
                    //     signUpController.passwordTextEditingController =
                    //         newValue;
                    //   },
                    //   decoration: InputDecoration(
                    //     hintText: "password".tr,
                    //     isDense: true, // Added this
                    //     contentPadding: EdgeInsets.all(13.w),
                    //     hintStyle: TextStyle(color: mainColor,fontSize: 14.sp),
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.red,
                    //       ),
                    //       borderRadius: BorderRadius.circular(8.r),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: mainColor,
                    //       ),
                    //       borderRadius: BorderRadius.circular(8.r),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: mainColor,
                    //       ),
                    //       borderRadius: BorderRadius.circular(8.r),
                    //     ),
                    //     disabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: mainColor,
                    //       ),
                    //       borderRadius: BorderRadius.circular(8.r),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 40.h,
                    // ),
                    CustomCartButton(
                        isCart: false,
                        color: mainColor,
                        textColor: kPrimaryColor,
                        text: "register_user".tr,
                        onPressed: () async {
                          if (signUpController.formKey.currentState!
                              .validate()) {
                            showLoaderDialog(context);
                            await signUpController.sendVerificationCode();
                          }
                        }),
                  ],
                ),
              )),
        ),
      )),
    );
  }
}
