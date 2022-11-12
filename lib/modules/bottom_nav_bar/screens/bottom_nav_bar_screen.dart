import 'package:arrows/components/arrows_app_bar.dart';
import 'package:arrows/components/arrows_bottom_nav_bar.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:arrows/modules/cart/controllers/cart_controller.dart';
import 'package:arrows/modules/cart/screens/cart_screen.dart';
import 'package:arrows/modules/home/screens/home_screen.dart';
import 'package:arrows/modules/main_category/screens/main_categories_screen.dart';
import 'package:arrows/modules/more_info/screens/more_info_screen.dart';
import 'package:arrows/modules/order_history/screens/order_history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arrows/constants/more_info_constants.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({Key? key}) : super(key: key);

  static BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());
  final CartController cartController = Get.put(CartController());

  final List _bodyScreens = [
    HomeScreen(),
    MainCategoryScreen(),
    CartScreen(),
    OrderHistoryScreen(),
    MoreInfoScreen(),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: bottomNavBarController.scaffoldKey,
      appBar: AppBar(
        // title: Text(bottomNavBarController.currentIndex.value .tr,style: TextStyle(color:kPrimaryColor,)),
        actions:[ Image.asset(
          k.restLogo,
          height: 60.h,
          width: 80,
          fit: BoxFit.contain,
        ),]

      ),
          // onMenuPressed: () {
          //   bottomNavBarController.scaffoldKey.currentState!.openDrawer();
          // },

      body: Obx(() {
        return _bodyScreens[bottomNavBarController.currentIndex.value];
      }),
      bottomNavigationBar: ArrowBottomNavBar(
        bottomNavBarController: bottomNavBarController,
      ),
    );
  }
}
