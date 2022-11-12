import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';

class CustomMainScreenCard extends StatelessWidget {
  final String  label;
  final String  image;
  final VoidCallback  onTap;
  const CustomMainScreenCard({
    Key? key,
    required this.label,
    required this.image,
    required this.onTap,
    required this.bottomNavBarController,
  }) : super(key: key);

  final BottomNavBarController bottomNavBarController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Card(
        color: mainColor,
        borderOnForeground: true,
        elevation: 5,
        shadowColor: kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Container(
          width: 140.w,
          height: 170.w,
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            children: [
              Expanded(
                child:  Image.asset(
                  image,
                  width: 250.w,
                  fit: BoxFit.cover,
                ),
              ),
              FittedBox(
                child: Text(
                  label,

                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
