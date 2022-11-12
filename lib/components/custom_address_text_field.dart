import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../modules/where_to_deliver/controllers/Where_to_controller.dart';

class CustomAddressTextField extends StatelessWidget {
  const CustomAddressTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
         decoration:InputDecoration(
          hintText: hintText.toString().tr,
          label: Text(labelText.tr),
          labelStyle: TextStyle(color: mainColor),

          fillColor: Colors.white,
          filled: true,

          isDense: true,
          // Added this
          contentPadding: EdgeInsets.all(13.w),
          hintStyle: TextStyle(color: mainColor),
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
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: mainColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),)
    );
  }
}
