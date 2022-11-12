import 'dart:async';

import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/constants/more_info_constants.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/MainBranches/controllers/main_branches_controller.dart';
import 'package:arrows/modules/bottom_nav_bar/screens/bottom_nav_bar_screen.dart';
import 'package:arrows/modules/home/screens/closed_now_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/loading_spinner.dart';

class BranchesScreen extends StatefulWidget {
  BranchesScreen({Key? key}) : super(key: key);

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  final MainBranchesController mainBranchesController =
      Get.put(MainBranchesController());
  bool? isOpened;

  @override
  Widget build(BuildContext context) {
    final landScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar:AppBar(
        actions: [
        Padding(
        padding: const EdgeInsets.all(8.0),
    child: Container(
    padding: EdgeInsets.only(left: 10.0, right: 10.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: mainColor,
    border: Border.all()),
    child: new Theme(
    data: Theme.of(context).copyWith(
    canvasColor: mainColor,
    ),
    child:DropdownButton(
              dropdownColor: mainColor,
              icon: Icon(Icons.language),
              iconSize: 25,
              underline: SizedBox(),
              items: [
                DropdownMenuItem(
                  child: Text('en'.tr.toUpperCase()),
                  value: 'en',
                ),
                DropdownMenuItem(
                  child: Text('ar'.tr.toUpperCase()),
                  value: 'ar',
                ),
              ],
              value: mainBranchesController.selectedValue,
              onChanged: (value) {
                mainBranchesController.switchFunc(value);
                Get.updateLocale(Locale(mainBranchesController.selectedValue));
                if (mainBranchesController.selectedValue == 'ar') {
                  CacheHelper.saveDataToSharedPrefrence("localeIsArabic", true);
                } else {
                  CacheHelper.saveDataToSharedPrefrence(
                      "localeIsArabic", false);
                }
              }),))),
          SizedBox(width: 25),
        ],
      ),
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: kSecondaryColor,
                      backgroundImage: AssetImage(k.restLogo),
                      radius: 40.r,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'please_choose_branch'.tr,
                      style: TextStyle(color: mainColor, fontSize: 20.sp),
                    ),
                  ],
                ),
                Obx(
                  () => ListView.builder(
                      itemCount: mainBranchesController.firebaseBranches.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final translateName =
                            CacheHelper.getDataToSharedPrefrence(
                                "localeIsArabic"); //true

                        return index != 0
                            ? Button(
                          height: 70,fontSize: 25.sp,
                                size: !landScape
                                    ? ScreenUtil.defaultSize.width - 50.w
                                    : ScreenUtil.defaultSize.width,
                                text: translateName
                                    ? mainBranchesController
                                                .firebaseBranches[index].name_ar
                                                .toString() !=
                                            ''
                                        ? mainBranchesController
                                            .firebaseBranches[index].name_ar
                                            .toString()
                                        : ''
                                    : mainBranchesController
                                                .firebaseBranches[index].name_en
                                                .toString() !=
                                            ''
                                        ? mainBranchesController
                                            .firebaseBranches[index].name_en
                                            .toString()
                                        : '',
                                isFramed: false,
                                onPressed: () async {

                                  await CacheHelper.saveDataToSharedPrefrence(
                                      'restaurantBranchName',
                                      translateName
                                          ? mainBranchesController
                                              .firebaseBranches[index].name_ar
                                              .toString()
                                          : mainBranchesController
                                              .firebaseBranches[index].name_en
                                              .toString());
                                  print(CacheHelper.getDataToSharedPrefrence(
                                      'restaurantBranchName'));
                                  await CacheHelper.saveDataToSharedPrefrence('restaurantBranchID',
                                      mainBranchesController
                                          .firebaseBranches[index].id);
                                  await DioHelper.init(
                                      mainBranchesController
                                              .firebaseBranches[index].dataBase
                                              .toString()  ,
                                      translateName
                                          ? mainBranchesController
                                                  .firebaseBranches[index]
                                                  .name_ar
                                                  .toString()

                                          : mainBranchesController
                                                  .firebaseBranches[index]
                                                  .name_en
                                                  .toString() );
                                  // isOpened = await FirebaseDatabase.instance
                                  //     .reference()
                                  //     .child('availability')
                                  //     .child(CacheHelper.getDataToSharedPrefrence(
                                  //     'restaurantBranchName'))
                                  //     .once()
                                  //     .then((value) {
                                  //       print(value);
                                  //   return (value.value);
                                  // });
                                  await CacheHelper.saveDataToSharedPrefrence(
                                      'restaurantBranchID',mainBranchesController
                                      .firebaseBranches[index].id);
                                  await CacheHelper.saveDataToSharedPrefrence(
                                      'restaurantBranchAddress',translateName?mainBranchesController
                                      .firebaseBranches[index].address_ar:mainBranchesController
                                      .firebaseBranches[index].address_en);
                             await CacheHelper.saveDataToSharedPrefrence(
                                      'restaurantBranchLat',mainBranchesController
                                      .firebaseBranches[index].lat );
                             await CacheHelper.saveDataToSharedPrefrence(
                                      'restaurantBranchLng',mainBranchesController
                                      .firebaseBranches[index].lng );

                                  isOpened = mainBranchesController
                                      .firebaseBranches[index].available;

                                  isOpened == true
                                      ? {
                                          showLoaderDialog(context),
                                          // Get.off(BottomNavBarScreen())
                                          Get.to(BottomNavBarScreen())
                                        }
                                      : Get.to(ClosedNowScreen());
                                },
                              )
                            : Container();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Get.defaultDialog(
//     title: 'sorry'.tr,
//     content: Text('please_choose_branch'.tr));
