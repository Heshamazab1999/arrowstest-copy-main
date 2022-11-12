import 'package:arrows/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final landScape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        autovalidateMode: AutovalidateMode.always,
        validator: (_) {},
        boxShadows: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.black12,
            spreadRadius: 2.r,
            blurRadius: 5.r,
          )
        ],
        autoDisposeControllers: false,
        keyboardType: TextInputType.number,
        cursorColor: kPrimaryColor,
        appContext: context,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        pinTheme: PinTheme(
          activeColor: kPrimaryColor,
          inactiveColor: kPrimaryColor,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(18.r),
          fieldHeight: !landScape ? 50.h : 120.h,
          fieldWidth: !landScape?  50.w : 40.w,
          activeFillColor: Colors.white,
          disabledColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          selectedColor: kPrimaryColor,
        ),
        animationDuration: Duration(milliseconds: 300),
        //backgroundColor: Colors.blue.shade50,
        enableActiveFill: true,
        //errorAnimationController: errorController,
        controller: textEditingController,

        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          // signController.pin = value;
        },

        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
