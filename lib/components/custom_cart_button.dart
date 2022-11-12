import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class CustomCartButton extends StatelessWidget {
  String  ?text ;
  VoidCallback  ?onPressed ;
  Color color;
  Color textColor;
  bool isCart;
    CustomCartButton({
   required this.text,
   required this.onPressed,
   required this.textColor,
   required this.color,
  required this.isCart,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50.w,
        child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 text!.tr,
                  style: TextStyle(color: textColor),
                ),
               isCart? Icon(
                  Icons.shopping_cart_outlined,
                  color: textColor,
                ):SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}