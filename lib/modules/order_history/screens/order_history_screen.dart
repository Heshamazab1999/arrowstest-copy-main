import 'package:arrows/constants/colors.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/order_history/controllers/order_history_controller.dart';
import 'package:arrows/modules/order_history/screens/order_details_screen.dart';
import 'package:arrows/shared_object/order_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({Key? key}) : super(key: key);
  final OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
 orderHistoryController.geHistoryData();
    orderHistoryController.dbRef == null
        ? orderHistoryController.hide.value = true
        : orderHistoryController.hide.value = false;
    return SingleChildScrollView(
      child: (CacheHelper.loginShared == null)
          ? Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 300.h,
                ),
                Center(
                    child: Text(
                  "no_orders".tr,
                  style: TextStyle(fontSize: 20.sp,color: mainColor),
                )),
              ],
            )
          : Obx(() {
              return (orderHistoryController.hide.value)
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 300.h,
                        ),
                        Center(
                            child: Text(
                          "no_orders".tr,
                          style: TextStyle(fontSize: 20.sp),
                        )),
                      ],
                    )
                  : FutureBuilder(
                      future: orderHistoryController.geHistoryData(),
                      builder: (context, snapshot) {
                        return FirebaseAnimatedList(
                          reverse: true,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            query: orderHistoryController.dbRef,
                            itemBuilder: (
                              BuildContext context,
                              DataSnapshot snapshot,
                              Animation<double> animation,
                              int index,
                            ) {
                              if (!snapshot.exists) {
                                // cartController.x.value = false;
                                return Center(
                                  child: Text(' no_orders'.tr),
                                );
                              } else {
                                final json =
                                    snapshot.value as Map<dynamic, dynamic>;
                                Order order = Order.fromJson(json);
                                return Card(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "order_time".tr,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            snapshot.value["order_id"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "total_price".tr,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            double.parse(snapshot
                                                    .value["total_price"])
                                                .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "order_status".tr,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            snapshot.value["order_status"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                snapshot.value["order_status"]
                                                                .toString() !=
                                                            "تم أرسال طلبك" &&
                                                        snapshot.value[
                                                                    "order_status"]
                                                                .toString() !=
                                                            "قبول الطلب"
                                                    ? SizedBox()
                                                    : TextButton(
                                                        onPressed: () async {
                                                          FirebaseDatabase
                                                              .instance
                                                              .reference()
                                                              .child("Orders")
                                                              .child(order
                                                                  .orderId
                                                                  .toString())
                                                              .remove();

                                                          FirebaseDatabase
                                                              .instance
                                                              .reference()
                                                              .child(
                                                                  "User_Orders")
                                                              .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
                                                              .child(CacheHelper
                                                                  .loginShared!
                                                                  .phone
                                                                  .toString())
                                                              .child(order
                                                                  .orderId
                                                                  .toString())
                                                              .remove();
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              HexColor(
                                                                  "#FFB82C"),
                                                        ),
                                                        child: FittedBox(
                                                          child: Text(
                                                            "cancel".tr,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    14.sp),
                                                          ),
                                                        ),
                                                      ),
                                                TextButton(
                                                  onPressed: () async {
                                                    Get.to(() =>
                                                        OrderDetailsScreen(
                                                          order: order,
                                                        ));
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                  ),
                                                  child: FittedBox(
                                                    child: Text(
                                                      "order_details".tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            });
                      });
            }),
    );
  }
}
