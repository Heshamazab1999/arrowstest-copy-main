import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArrowBottomNavBar extends StatelessWidget {
  final BottomNavBarController bottomNavBarController;

  const ArrowBottomNavBar({
    Key? key,
    required this.bottomNavBarController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: mainColor,
              icon: Icon(
                Icons.home,
                color: kPrimaryColor,
              ),
              label: "home".tr),
          BottomNavigationBarItem(
              backgroundColor: mainColor,
              icon: Icon(
                Icons.menu_book,
                color: kPrimaryColor,
              ),
              label: "menu".tr),
          BottomNavigationBarItem(
              backgroundColor: mainColor,
              icon: Icon(
                Icons.shopping_cart,
                color: kPrimaryColor,
              ),
              label: "cart".tr),
          BottomNavigationBarItem(
              backgroundColor: mainColor,
              icon: Icon(Icons.airport_shuttle, color: kPrimaryColor),
              label: "track_order".tr),
          BottomNavigationBarItem(
              backgroundColor: mainColor,
              icon: Icon(
                Icons.more_horiz,
                color: kPrimaryColor,
              ),
              label: "more_info".tr),
        ],
        currentIndex: bottomNavBarController.currentIndex.value,
        iconSize: 30.r,
        selectedFontSize: 15.sp,

        backgroundColor: mainColor,
        // unselectedFontSize: 12.sp,

        onTap: (index) {
          bottomNavBarController.changeTabIndex(index);
        },
      );
    });
  }
}
