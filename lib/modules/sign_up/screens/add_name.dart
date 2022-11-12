// import 'dart:core';
//
// import 'package:arrows/constants/colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../components/custom_address_text_field.dart';
// import '../../../components/custom_cart_button.dart';
// import '../controllers/signup_controller.dart';
//
// class AddNameScreen extends StatelessWidget {
//   SignUpController signUpController=Get.put(SignUpController());
//
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:[
//           // Padding(
//           //   padding: EdgeInsets.only(
//           //       right: 10.w, top: 10.h, bottom: 10.h),
//           //   child: CustomAddressTextField(
//           //     textEditingController: signUpController.userNameTextEditingController.text,
//           //     hintText: txtname.toString(),
//           //     labelText: txtname.toString(),
//           //   ),
//           // ),
//
//
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter User Name';
//               }
//               return null;
//             },
//             onChanged: (newValue) {
//               signUpController.userNameTextEditingController =
//                   newValue;
//             },
//             decoration: InputDecoration(
//               hintText: "user_name".tr,
//
//               isDense: true, // Added this
//               contentPadding: EdgeInsets.all(13.w),
//               hintStyle: TextStyle(color: mainColor,fontSize: 14.sp),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.red,
//                 ),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: mainColor,
//                 ),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: mainColor,
//                 ),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: mainColor,
//                 ),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           // TextFormField(
//           //   validator: (value) {
//           //     if (value == null || value.isEmpty) {
//           //       return 'Please enter Password';
//           //     }
//           //     return null;
//           //   },
//           //   onChanged: (newValue) {
//           //     signUpController.passwordTextEditingController =
//           //         newValue;
//           //   },
//           //   decoration: InputDecoration(
//           //     hintText: "password".tr,
//           //     isDense: true, // Added this
//           //     contentPadding: EdgeInsets.all(13.w),
//           //     hintStyle: TextStyle(color: mainColor,fontSize: 14.sp),
//           //     border: OutlineInputBorder(
//           //       borderSide: BorderSide(
//           //         color: Colors.red,
//           //       ),
//           //       borderRadius: BorderRadius.circular(8.r),
//           //     ),
//           //     focusedBorder: OutlineInputBorder(
//           //       borderSide: BorderSide(
//           //         color: mainColor,
//           //       ),
//           //       borderRadius: BorderRadius.circular(8.r),
//           //     ),
//           //     enabledBorder: OutlineInputBorder(
//           //       borderSide: BorderSide(
//           //         color: mainColor,
//           //       ),
//           //       borderRadius: BorderRadius.circular(8.r),
//           //     ),
//           //     disabledBorder: OutlineInputBorder(
//           //       borderSide: BorderSide(
//           //         color: mainColor,
//           //       ),
//           //       borderRadius: BorderRadius.circular(8.r),
//           //     ),
//           //   ),
//           // ),
//           // SizedBox(
//           //   height: 40.h,
//           // ),
//          CustomCartButton(  onPressed: () async {
//         // if (signUpController.formKey.currentState!.validate()) {
//          await signUpController.sendVerificationCode();
//
//      // }
//      },
//            textColor: kPrimaryColor,
//            text: 'Submit', isCart: false, color: mainColor,),
//         ]
//       )
//     );
//   }
// }
// // openDialog({context, txtname, errortext,textEdintingController , onPressed}) {
// //   showDialog(
// //       context: context,
// //       builder: (context) => StatefulBuilder(
// //         builder: (context, setState) => AlertDialog(
// //           title: Text('Enter Your name here'),
// //           content: Padding(
// //             padding: EdgeInsets.only(
// //                 right: 10.w, top: 10.h, bottom: 10.h),
// //             child: CustomAddressTextField(
// //               textEditingController: textEdintingController,
// //               hintText: txtname,
// //               labelText: txtname,
// //             ),
// //           ),
// //
// //
// //           // TextField(
// //           //   controller: txtname,
// //           //   onTap: () {
// //           //     setState(() {});
// //           //   },
// //           //   onChanged: (value) {
// //           //     setState(() {});
// //           //   },
// //           //   decoration: InputDecoration(
// //           //     hintText: 'Enter Name',
// //           //     errorText: errortext,
// //           //   ),
// //           // ),
// //           actions: [
// //             TextButton(
// //               onPressed:onPressed,
// //               child: const Text('Submit'),
// //             ),
// //           ],
// //         ),
// //       ));
// // }
