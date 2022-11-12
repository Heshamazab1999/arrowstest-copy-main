
import 'package:arrows/components/arrows_app_bar.dart';
import 'package:arrows/components/loading_spinner.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/bottom_nav_bar/screens/bottom_nav_bar_screen.dart';
import 'package:arrows/modules/cart/controllers/cart_controller.dart';
import 'package:arrows/modules/cart/models/copoun_response_model.dart';
import 'package:arrows/modules/cart/models/coupon_used_model.dart';
import 'package:arrows/modules/cart/services/coupon_used_body.dart';
import 'package:arrows/modules/cart/services/coupon_used_service.dart';
import 'package:arrows/modules/payment/payment_screens/payment_screen.dart';
import 'package:arrows/modules/sub_categories/controllers/sub_categories_controller.dart';
import 'package:arrows/modules/where_to_deliver/controllers/Where_to_controller.dart';
import 'package:arrows/shared_object/posted_order.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as dio;
import 'package:arrows/modules/payment/payment_controllers/payment_controller.dart';

import '../../../components/custom_radio_button.dart';

class ReceiptScreen extends StatelessWidget {
  dynamic selectedAreaPrice=0.0;
  ReceiptScreen({Key? key, required this.selectedAreaPrice}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  final WhereToController whereToController = Get.find();
  final PaymentController paymentController = Get.put(PaymentController());
  // CouponUsedModel couponUsedModel = CouponUsedModel();

  Future<void> usedCoupon(BuildContext context) async {
    CouponUsedBody couponUsedBody = await CouponUsedBody(
      couponCode: cartController.discountCodeTextController.text,
      phoneNumber: CacheHelper.loginShared!.phone,
    );
    dio.Response? response;
    response = await CouponUsedService.registerCouponUsed(couponUsedBody);
  }

  @override
  Widget build(BuildContext context) {
    final landScape = MediaQuery.of(context).orientation == Orientation.landscape;
    cartController.discountValue.value = 0.0;
    cartController.isPercentage.value = false;
    cartController.getRestaurantFees();
    print(cartController.totalPrice.value);
    return Scaffold(
      // backgroundColor: Colors.green,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
    child: CustomAppBar(context)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // SizedBox(
                //   width: double.infinity,
                // ),
                // Container(
                //   color: Colors.grey,
                //   child: Container(
                //     width: double.infinity,
                //     height: !landScape ?  50.h : 180.h,
                //     color: Colors.grey.withOpacity(0.4),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Center(
                //           child: Text(
                //             "confirm".tr,
                //             style: TextStyle(fontSize: 20.sp),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 25.h,
                // ),
                Container(
                  height: !landScape ? 315.h : 1100.h,
                  margin: EdgeInsets.only(top: 10.h,right: 10.w,left: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(
                        color: mainColor,
                        width: 3,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Container(
                    width:double.infinity,
                    color: mainColor,
                    child:Center(child: Text('receipt'.tr.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),))),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                                color:Colors.white,),
                          child: Padding(
                            padding: EdgeInsets.only(top:15.h,right: 15.w,left: 15.w),
                            child: Column(
                              children: [
                                /*********priceRow******/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'price'.tr,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    (cartController.fees.value!.tax != 'null' &&
                                            cartController.fees.value!.tax != null)
                                        ? Text(
                                            '${((cartController.totalPrice.value / (((double.parse(cartController.fees.value!.tax.toString())) / 100) + 1))).toStringAsFixed(2)}    ',
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        : Text('${cartController.totalPrice}'),
                                  ],
                                ),
                                /*********discountRow******/

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'discount'.tr,
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        Obx(() {
                                          return (cartController.isPercentage.value)
                                              ? Text(
                                            '( % ${cartController.discountResponse.data == null ? 0 : cartController.discountResponse.data!.value!.toString()} )',
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                              : SizedBox();
                                        }),
                                      ],
                                    ),
                                    GetBuilder<CartController>(
                                        builder: (cartController) {
                                          return Text(
                                            '${cartController.discountResponse.data == null ? 0 : cartController.discountValue.value.toString()} -  ',
                                            style: TextStyle(
                                                fontSize: 14.sp, color: Colors.red),
                                          );
                                        }),
                                  ],
                                ),
                                /*********FeesRow******/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cartController.fees.value!.tax != 'null'
                                          ? '${'tax'.tr} ( % ${cartController.fees.value!.tax})'
                                          : '(${'tax'.tr} % 0)',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    (cartController.fees.value!.tax != 'null' ||
                                            cartController.fees.value!.tax != null)
                                        ? Text(
                                            '${(cartController.totalPrice.value - //33.75

                                                (cartController.totalPrice.value - (((cartController.fees.value!.tax != 'null' ? (cartController.totalPrice.value *double.parse(cartController.fees.value!.tax.toString())) : 0.0) / 100)      )))
                                                .toStringAsFixed(2)
                                              // (cartController.totalPrice.value / (((cartController.fees.value!.tax != 'null' ? (double.parse(cartController.fees.value!.tax.toString())) : 0.0) / 100) + 1)))
                                              //   .toStringAsFixed(2)
                                             } + ',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.green), )
                                        : const Text('+ 0'),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  endIndent: 5.w,
                                  indent: 5.w,
                                ),
                                /********TotalRow******/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'total'.tr,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    Obx(() {
                                      return Text(
                                        '${((double.parse(cartController.totalPrice.value.toStringAsFixed(2))) - cartController.discountValue.value).toStringAsFixed(2)}    ',
                                        style: TextStyle(fontSize: 14.sp),
                                      );
                                    }),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                /********deliveryRow******/

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'delivery'.tr,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    whereToController.showPickUpBranches == true
                                        ? const Text('0')
                                        : Text(
                                            '${(selectedAreaPrice)} + ',
                                            // '${( whereToController.selectedAreaPrice)} + ',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.green),
                                          ),
                                  ],
                                ),
                                /*******service_feeRow******/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cartController.fees.value!.feesValue != 'null'
                                          ? '${'service_fee'.tr} ( % ${cartController.fees.value!.feesValue})'
                                          : ' (الخدمة % 0.0)',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    Text(
                                      '${(cartController.totalPrice.value * ((cartController.fees.value!.feesValue != 'null' ? double.parse(cartController.fees.value!.feesValue.toString()) : 0.0) / 100)).toStringAsFixed(2)} +  ',
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.green),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  endIndent: 5.w,
                                  indent: 5.w,
                                ),
                                /*******total_sumRow******/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'total_sum'.tr,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    Obx(() {
                                      return Text(
                                        '${(cartController.totalPrice.value + (whereToController.showPickUpBranches == true ? 0.0 : (double.parse(whereToController.selectedAreaPrice.toString()))) + (cartController.totalPrice.value * (cartController.fees.value!.feesValue != 'null' ? (double.parse(cartController.fees.value!.feesValue.toString()) / 100) : 0.0)) - cartController.discountValue.value).toStringAsFixed(2)} ',
                                        style: TextStyle(fontSize: 14.sp),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.all(15.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Align(
                //         alignment: Alignment.centerRight,
                //         child: SizedBox(
                //           width: 270.w,
                //           child: TextField(
                //             keyboardType: TextInputType.text,
                //             controller:
                //                 cartController.discountCodeTextController,
                //             decoration: InputDecoration(
                //               border: OutlineInputBorder(
                //                   borderSide: BorderSide(color: Colors.grey)),
                //               enabledBorder: OutlineInputBorder(
                //                 borderSide: BorderSide(color: mainColor),
                //               ),
                //               focusedBorder: OutlineInputBorder(
                //                 borderSide: BorderSide(color: mainColor),
                //               ),
                //               contentPadding: EdgeInsets.all(8.r),
                //               hintText: "voucher_code".tr,
                //               hintStyle: TextStyle(fontSize: 14.sp),
                //             ),
                //           ),
                //         ),
                //       ),
                //       TextButton(
                //         onPressed: () async {
                //           print(cartController.totalPrice);
                //           showLoaderDialog(context);
                //           await cartController.getDiscount();
                //           if (cartController.discountResponse.data?.type ==
                //               "نسبة") {
                //             cartController.discountValue.value = (double.parse(
                //                     cartController.discountResponse.data!.value
                //                         .toString())) /
                //                 100 *
                //                 (cartController.totalPrice.value);
                //             cartController.isPercentage.value = true;
                //           } else {
                //             cartController.discountValue.value = double.parse(
                //                 cartController.discountResponse.data!.value
                //                     .toString());
                //             cartController.isPercentage.value = false;
                //           }
                //           cartController.update();
                //         },
                //         style: TextButton.styleFrom(
                //           backgroundColor: kPrimaryColor,
                //         ),
                //         child: Text(
                //           "done".tr,
                //           style:
                //               TextStyle(color: Colors.white, fontSize: 12.sp),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 5.h,
                // ),

                Container(
                  margin: EdgeInsets.only(left:10.w,right: 10.w,top: 10.h),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 3,
                      )),
                  child:Column(
                    children: [
                      Obx(
                         () {
                          return Card(child:
                          RadioListTile(activeColor: kPrimaryColor,value:1, groupValue: whereToController.selectedPaymentType.value, onChanged: (newValue){
                            whereToController.selectedPaymentType.value = newValue as int;
                          },title: Row(
                            children: [
                              Image.asset('assets/icons/money.png',width: 25.r,height: 25.r,),
                              SizedBox(width: 10.w,),
                              Text("الدفع عند الاستلام"),
                            ],
                          ),),color: mainColor,);
                        }
                      ),
                      Obx(
                         () {
                          return Card(child: RadioListTile(activeColor: kPrimaryColor,value:2, groupValue: whereToController.selectedPaymentType.value, onChanged: (newValue){
                            whereToController.selectedPaymentType.value = newValue as int;

                          },title: Row(
                            children: [
                              Image.asset('assets/icons/debit_card.png',width: 25.r,height: 25.r,),
                              SizedBox(width: 10.w,),
                              Text("الدفع باستخدام البطاقة"),
                            ],
                          ),),color: mainColor,);
                        }
                      ),
                    ],
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(left:10.w,right: 10.w,top: 10.h),
                //     decoration: BoxDecoration(
                //       color: mainColor,
                //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //         border: Border.all(
                //           color: kPrimaryColor,
                //           width: 3,
                //         )),
                //   child:CustomRadioButton(
                //     controller: SubCategoriesController(),
                //     value: 'null',
                //     onChanged: (v) {  },
                //     textOfTheRadio: 'cash_payment'.tr,
                //     isPayment:true,
                //     image: 'assets/icons/money.png',
                //     isDrinks: false,)
                // ),
                // Container(
                //     margin: EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //         color: mainColor,
                //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //         border: Border.all(
                //           color: kPrimaryColor,
                //           width: 3,
                //         )),
                //     child:CustomRadioButton(
                //       controller: SubCategoriesController(),
                //       value: whereToController.selectTypeRadioButton.value,
                //       onChanged: (v) {
                //         whereToController.selectTypeRadioButton(v);
                //
                //         print(v);
                //       },
                //       textOfTheRadio: '${'${'credit_card_payment'.tr}'}',
                //       isPayment:true,
                //       image: 'assets/icons/debit_card.png',
                //       isDrinks: false,)
                // ),
                // Container(
                //     margin: EdgeInsets.only(left:10.w,right: 10.w,bottom: 10.h),
                //     decoration: BoxDecoration(
                //         color: mainColor,
                //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //         border: Border.all(
                //           color: kPrimaryColor,
                //           width: 3,
                //         )),
                //     child:CustomRadioButton(
                //       controller: SubCategoriesController(),
                //       value: 'null',
                //       onChanged: (v) {  },
                //       textOfTheRadio: '${'${'wallet_balance'.tr} 0${'not_enough'.tr} '}',
                //       isPayment:true,
                //       image: 'assets/icons/wallet.png',
                //       isDrinks: false,)
                // ),
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: TextFormField(
                    controller: cartController.messageTextController,
                    maxLines: 2,
                    style: TextStyle(color: mainColor),
                    decoration: InputDecoration(
                      hintText: 'leave_a_comment'.tr,
                      hintStyle: TextStyle(fontSize: 14.sp,color: mainColor),
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
                          color: mainColor,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: mainColor,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding:  EdgeInsets.all(8.w),
                //   child: Column(
                //     children: [
                //       Obx(
                //          () {
                //           return Card(child: RadioListTile(activeColor: kPrimaryColor,value:1, groupValue: whereToController.selectedPaymentType.value, onChanged: (newValue){
                //             whereToController.selectedPaymentType.value = newValue as int;
                //           },title: Row(
                //             children: [
                //               Image.asset('assets/icons/money.png',width: 25.r,height: 25.r,),
                //               SizedBox(width: 10.w,),
                //               Text("الدفع عند الاستلام"),
                //             ],
                //           ),));
                //         }
                //       ),
                //       Obx(
                //          () {
                //           return Card(child: RadioListTile(activeColor: kPrimaryColor,value:2, groupValue: whereToController.selectedPaymentType.value, onChanged: (newValue){
                //             whereToController.selectedPaymentType.value = newValue as int;
                //
                //           },title: Row(
                //             children: [
                //               Image.asset('assets/icons/debit_card.png',width: 25.r,height: 25.r,),
                //               SizedBox(width: 10.w,),
                //               Text("الدفع باستخدام البطاقة"),
                //             ],
                //           ),));
                //         }
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  width: 300.w,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: mainColor),
                    onPressed: () async {
                        if (cartController.discountResponse.status == true) {
                          await usedCoupon(context).then((value) {
                            // cartController.discountValue.value = 0.0;
                            cartController.cartItemList.clear();
                            cartController.cartItemList2.clear();

                          });
                        }
                        whereToController.addOrderToFirebase();
                      // Get.to(PaymentScreen(paymentToken: '',));
                    },
                    child: Text(
                      "confirm".tr,
                      style: TextStyle(color: kPrimaryColor, fontSize: 14.sp),
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }Widget CustomAppBar(context){
    return Container(
      // width: 300,
      color: mainColor,
      padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.end,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Text('Add Promo code if you have',style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600),),
         GetBuilder<CartController>(
           init: CartController(),
               builder:(cartController)=> Row(mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 250.w,
                height: 50.h,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller:
                  cartController.discountCodeTextController,
                  decoration: InputDecoration(filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    contentPadding: EdgeInsets.all(8.r),
                    hintText: "voucher_code".tr,
                    hintStyle: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ),
              Container(
                width: 100.w,
                height: 50.h,
                margin: EdgeInsets.only(left: 10.w,right: 10.w),
                child:  TextButton(   onPressed: () async {
              print('cartController.totalPrice ${cartController.totalPrice}');
              // showLoaderDialog(context);
              if(cartController.discountResponse.status==true)
               {
                    await cartController.getDiscount();
                    print('&&&&&&&cartController.getDiscount()${cartController.getDiscount()}');

                    if (cartController.discountResponse.data?.type == "نسبة") { //test1,//test4
                    cartController.discountValue.value = (double.parse(
                    cartController.discountResponse.data!.value
                        .toString())) / 100 * (cartController.totalPrice.value);
                    cartController.isPercentage.value = true;



                    // Get.snackbar('Error', 'this coupon is already used',
                    //     snackPosition: SnackPosition.TOP,
                    //     backgroundColor: kPrimaryColor,
                    //     duration: Duration(seconds: 2),
                    //     dismissDirection: DismissDirection.startToEnd,
                    //     barBlur: 10,
                    //     colorText: mainColor);
                    print('nesba${ cartController.discountValue.value}');
                    print('totalPrice after discount ${cartController.totalPrice}');

                    }
                    else
                    { //test3 ,//test2 ,test
                cartController.discountValue.value = double.parse(cartController.discountResponse.data!.value
                  .toString());
              cartController.isPercentage.value = false;
              print('XXX${ cartController.discountValue.value}');//XXX50.0
              print('XXX${ cartController.discountValue.value}');//XXX50.0
              print('XXX${ cartController.discountResponse.data?.type}');//XXX50.0
                print('totalPrice after discount ${cartController.totalPrice}');

              }
              }
              else{
                Get.snackbar('Error', 'This cupon is already used',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: kPrimaryColor,
                    duration: Duration(seconds: 2),
                    dismissDirection: DismissDirection.startToEnd,
                    barBlur: 10,
                    colorText: mainColor);
              }
              cartController.update();

              },
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: Text(
                    "dsnsnnnone".tr,
                    style:
                    TextStyle(color: Colors.white, fontSize: 16.sp, ),
                  ),
                ),
              ),
            ],),)


        ],),
    );
  }
}

class PointsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0;
    double y = size.height;
    double increment = size.width / 20;

    while (x < size.width) {
      x += increment;
      y = (y == size.height) ? size.height * .98 : size.height;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
