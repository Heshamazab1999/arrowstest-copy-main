import 'package:arrows/constants/colors.dart';
import 'package:arrows/constants/more_info_constants.dart';
import 'package:arrows/helpers/map_launch_helper.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/cart/controllers/cart_controller.dart';
import 'package:arrows/modules/more_info/controllers/more_info_controller.dart';
import 'package:arrows/modules/sign_up/controllers/signup_controller.dart';
import 'package:arrows/modules/where_to_deliver/controllers/Where_to_controller.dart';
import 'package:arrows/shared_object/firebase_order_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MoreInfoScreen extends StatefulWidget {
  MoreInfoScreen({Key? key}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  final WhereToController whereToController = Get.put(WhereToController());

  final MoreInfoController moreInfoController = Get.put(MoreInfoController());

  final CartController cartController = Get.put(CartController());

  final SignUpController signUpController = Get.put(SignUpController());

  bool isArabic = true;

  Order? order;

  // RxBool isArabic = false.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: kSecondaryColor,
                      backgroundImage: AssetImage(k.restLogo),
                      radius: 50.r,
                    ),
                    Text(
                      k.restName,
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Obx(() {
                return (whereToController.branches.length == 1)
                    ? SizedBox()
                    : Text(
                        "branches".tr,
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      );
              }),
              Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: whereToController.branches.length,
                    itemBuilder: (context, index) {
                      if (whereToController.branches.length == 1) {
                        print("empty");
                        return const SizedBox();
                      } else {
                        if (index == 0) {
                          return const SizedBox();
                        } else {
                          return InkWell(
                            onTap: () {
                              MapUtils.openMap(
                                  double.parse(
                                      whereToController.branches[index].lat ??
                                          ""),
                                  double.parse(
                                      whereToController.branches[index].lng ??
                                          ""));
                            },
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_sharp,
                                      size: 30.r,
                                      color: kPrimaryColor,
                                    ),
                                    SizedBox(
                                      width:
                                          ScreenUtil.defaultSize.width - 50.w,
                                      child: Text(
                                        whereToController.branches[index].name
                                            .toString(),
                                        style: TextStyle(fontSize: 12.sp),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    });
              }),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return (moreInfoController.restaurantPhoneNumbers.isEmpty)
                    ? const SizedBox()
                    : Text(
                        "contact_us".tr,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      );
              }),
              Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: moreInfoController.restaurantPhoneNumbers.length,
                    itemBuilder: (context, index) {
                      return (moreInfoController
                                  .restaurantPhoneNumbers[index] !=
                              'null')
                          ? InkWell(
                              onTap: () {
                                MapUtils.makePhoneCall(moreInfoController
                                    .restaurantPhoneNumbers[index]
                                    .toString());
                              },
                              child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 30.r,
                                        color: kPrimaryColor,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        moreInfoController
                                            .restaurantPhoneNumbers[index]
                                            .toString(),
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox();
                    });
              }),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "socials".tr,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  MapUtils.launchInBrowser(moreInfoController
                      .restaurantMoreInfo!.facebook
                      .toString());
                },
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  color: mainColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.facebook_sharp,
                          size: 30.r,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Facebook".toString(),
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  MapUtils.launchInBrowser(moreInfoController
                      .restaurantMoreInfo!.instagram
                      .toString());
                },
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  color: mainColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Row(
                      children: [
                        Image.asset("assets/images/instagram.svg",
                            width: 30.w, height: 30.w),
                        // FaIcon(FontAwesomeIcons.instagram,
                        //     size: 30.r, color: Color(0xFF405DE6)),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Instagram",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  MapUtils.launchInBrowser(moreInfoController
                      .restaurantMoreInfo!.website
                      .toString());
                },
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  color: mainColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FaIcon(FontAwesomeIcons.globe,
                            size: 30.r, color: Colors.blue),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          k.restWebSite,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (CacheHelper.getDataToSharedPrefrence(
                              "localeIsArabic") ==
                          true) {
                        Get.updateLocale(const Locale("en"));
                        await CacheHelper.saveDataToSharedPrefrence(
                            "localeIsArabic", false);
                      }
                    },
                    child: Text(
                      'English',
                      style: TextStyle(
                          fontSize: 20,
                          color: (CacheHelper.getDataToSharedPrefrence(
                                      "localeIsArabic") ==
                                  true)
                              ? kPrimaryColor
                              : Colors.grey),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () async {
                        if (CacheHelper.getDataToSharedPrefrence(
                                "localeIsArabic") ==
                            false) {
                          Get.updateLocale(const Locale("ar"));
                          await CacheHelper.saveDataToSharedPrefrence(
                              "localeIsArabic", true);
                        }

                        // Get.reset();
                        // categoriesController.getCategories();
                      },
                      child: Text(
                        'Arabic',
                        style: TextStyle(
                            fontSize: 20,
                            color: !(CacheHelper.getDataToSharedPrefrence(
                                        "localeIsArabic") ==
                                    true)
                                ? kPrimaryColor
                                : Colors.grey),
                      )),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(kSecondaryColor),
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    ),
                    onPressed: () {
                      if (CacheHelper.loginShared == null) {
                        Get.defaultDialog(
                            title: 'error'.tr, content: Text('no_account'.tr));
                      } else {
                        Get.defaultDialog(
                          title: 'delete_account_alert'.tr,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    await FirebaseDatabase.instance
                                        .reference()
                                        .child('Cart')
                                        .child(CacheHelper
                                            .getDataToSharedPrefrence(
                                                'restaurantBranchName'))
                                        .child(CacheHelper.loginShared!.phone
                                            .toString())
                                        .remove()
                                        .then((_) async {
                                      await FirebaseDatabase.instance
                                          .reference()
                                          .child('Orders')
                                          .child(CacheHelper
                                              .getDataToSharedPrefrence(
                                                  'restaurantBranchName'))
                                          .child(CacheHelper.loginShared!.phone
                                              .toString())
                                          .remove()
                                          .then((_) async {
                                        await FirebaseDatabase.instance
                                            .reference()
                                            .child('User_Orders')
                                            .child(CacheHelper
                                                .getDataToSharedPrefrence(
                                                    'restaurantBranchName'))
                                            .child(CacheHelper
                                                .loginShared!.phone
                                                .toString())
                                            .remove()
                                            .then((_) async {
                                          await FirebaseDatabase.instance
                                              .reference()
                                              .child('Users')
                                              .child(CacheHelper
                                                  .loginShared!.phone
                                                  .toString())
                                              .remove()
                                              .then((_) async {
                                            await CacheHelper
                                                .saveDataToSharedPrefrence(
                                                    "user", null);
                                            setState(() {
                                              CacheHelper.loginShared = null;
                                              cartController.cartItemList2
                                                  .clear();
                                              cartController.cartItemList.clear();
                                              order != null
                                                  ? order!.list_of_product
                                                      .clear()
                                                  : null;
                                              signUpController.fullPhoneNumber =
                                                  '';
                                              signUpController
                                                  .pinTextEditingController
                                                  .clear();
                                              signUpController
                                                  .phoneTextEditingController
                                                  .clear();
                                            });
                                          });
                                        });
                                      });
                                    });
                                    Get.back();
                                    Get.snackbar('', 'deletion_successful'.tr);
                                  },
                                  child: Text(
                                    'yes'.tr,
                                    style: TextStyle(color: kPrimaryColor),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'no'.tr,
                                    style: TextStyle(color: kPrimaryColor),
                                  )),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      'delete_account'.tr,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
