// import 'package:arrows/constants/colors.dart';
// import 'package:arrows/helpers/shared_prefrences.dart';
// import 'package:arrows/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
// import 'package:arrows/modules/cart/controllers/cart_controller.dart';
// import 'package:arrows/modules/sub_categories/controllers/sub_categories_controller.dart';
// import 'package:arrows/modules/sub_categories/models/firebase_product_model.dart';
// import 'package:arrows/modules/where_to_deliver/screens/where_to_deliver_screem.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../../product_details2/model/ProductDetailsModel.dart';
// import '../../sign_up/models/user_model.dart';
// import '../models/new_cart_model.dart';
//
// class CartScreen extends StatefulWidget {
//   CartScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   final CartController cartController = Get.put(CartController());
//
//   final BottomNavBarController bottomNavBarController =
//       Get.put(BottomNavBarController());
//   SubCategoriesController subCategoriesController = SubCategoriesController();
//
//   String replaceFarsiNumber(String input) {
//     const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
//     const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
//
//     for (int i = 0; i < farsi.length; i++) {
//       input = input.replaceAll(farsi[i], english[i]);
//     }
//
//     return input;
//   }
//
//   final items = <NewCartModel2>[];
//
//   @override
//   Widget build(BuildContext context) {
//     final translateName =
//         CacheHelper.getDataToSharedPrefrence("localeIsArabic");
//     final landScape =
//         MediaQuery.of(context).orientation == Orientation.landscape;
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Future.delayed(const Duration(seconds: 1), () {
//         cartController.update();
//       });
//       print("Car updated");
//     });
//
//     print(cartController.hide.value);
//     cartController.getCartData();
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(10.w),
//             child: Column(
//               children: [
//                 (CacheHelper.loginShared == null)
//                     ? Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           SizedBox(
//                             height: 300.h,
//                           ),
//                           Center(
//                               child: Text(
//                             "no_products_cart".tr,
//                             style: TextStyle(fontSize: 20.sp, color: mainColor),
//                           )),
//                         ],
//                       )
//                     : GetX<CartController>(builder: (cartController) {
//                         return cartController.hide.value
//                             ? Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   SizedBox(
//                                     height: 300.h,
//                                   ),
//                                   Center(
//                                     child: Text(
//                                       "no_products_cart".tr,
//                                       style: TextStyle(
//                                           fontSize: 20.sp, color: mainColor),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             : Column(
//                                 children: [
//                                   SizedBox(
//                                       child: FutureBuilder(
//                                           future: cartController.getCartData(),
//                                           builder: (context, snapshot) {
//                                             cartController.totalPrice.value =
//                                                 0.0;
//                                             if (snapshot.connectionState ==
//                                                 ConnectionState.waiting)
//                                               return CircularProgressIndicator(
//                                                 color: kPrimaryColor,
//                                               );
//                                             /*********************************************this is our list******************************************************/
//
//                                             return Column(
//                                               children: [
//                                                 FirebaseAnimatedList(
//                                                     query: cartController.dbRef,
//                                                     // itemCount: cartController.cartItemList.length,
//                                                     shrinkWrap: true,
//                                                     physics:
//                                                         BouncingScrollPhysics(),
//                                                     // padding: EdgeInsets.only(bottom: 100),
//                                                     itemBuilder: (
//                                                       BuildContext context,
//                                                       DataSnapshot snapshot,
//                                                       Animation<double>
//                                                           animation,
//                                                       int index,
//                                                     ) {
//                                                       if (index == 0) {
//                                                         cartController
//                                                             .totalPrice
//                                                             .value = 0.0;
//                                                       }
//                                                       cartController.totalPrice
//                                                           .value = cartController
//                                                               .totalPrice
//                                                               .value + ((double.parse(snapshot.value["total_price"]))) ;
//                                                           // *
//
//                                                                // (double.parse(snapshot.value["quantity"])));
//                                                       //
//                                                       // if (!snapshot.exists) {
//                                                       //    return SizedBox();
//                                                       // } else {
//                                                         if (index == 0) {
//                                                           cartController
//                                                               .cartItemList = [];
//                                                         }
//                                                         if (index == 0) {
//                                                           cartController
//                                                               .cartItemList2 = [];
//                                                         }
//                                                       //   final json =
//                                                       //       snapshot.value
//                                                       //           as Map<dynamic,
//                                                       //               dynamic>;
//                                                       //   Product message =
//                                                       //       Product.fromJson(
//                                                       //           json);
//                                                       //   cartController
//                                                       //       .cartItemList
//                                                       //       .add(message);
//                                                       //   return SizeTransition(
//                                                       //     sizeFactor: animation,
//                                                       //     child: Stack(
//                                                       //       children: [
//                                                       //         Card(
//                                                       //           elevation: 5,
//                                                       //           color: Colors.white,
//                                                       //           shadowColor: Colors.white,
//                                                       //           shape: RoundedRectangleBorder(
//                                                       //               side: BorderSide(
//                                                       //                   color: mainColor, width: 4),
//                                                       //               borderRadius:
//                                                       //               BorderRadius.circular(15)),
//                                                       //           child:
//                                                       //           Row(
//                                                       //             mainAxisAlignment:
//                                                       //             MainAxisAlignment.end,
//                                                       //             children: [
//                                                       //               Expanded(
//                                                       //                 child:
//                                                       //                Row(
//                                                       //               children: [
//                                                       //                 ClipRRect(
//                                                       //                   borderRadius: BorderRadius.only(
//                                                       //                       topLeft: Radius.circular(5),
//                                                       //                       bottomLeft:
//                                                       //                       Radius.circular(15)),
//                                                       //                   child: CachedNetworkImage(
//                                                       //                     height: 120.h,
//                                                       //                     width: 150.w,
//                                                       //                     imageUrl:
//                                                       //                         snapshot.value['photo'],
//                                                       //                     fit: BoxFit
//                                                       //                         .cover,
//                                                       //                         errorWidget: (context,
//                                                       //                             url,
//                                                       //                             error) =>
//                                                       //                         Icon(
//                                                       //                       Icons.image_not_supported_sharp, size: 60,
//                                                       //                       color:
//                                                       //                           kPrimaryColor.withOpacity(0.6),
//                                                       //                     ),
//                                                       //                   ),
//                                                       //                 ),
//                                                       //                 Text('${snapshot.value['totalPrice']}'),
//                                                       //               Column(
//                                                       //                     crossAxisAlignment:
//                                                       //                         CrossAxisAlignment.start,
//                                                       //                     mainAxisAlignment:
//                                                       //                         MainAxisAlignment.start,
//                                                       //                     // mainAxisSize:
//                                                       //                     //     MainAxisSize.max,
//                                                       //                     children: [
//                                                       //
//                                                       //                             Container(
//                                                       //                               // width:MediaQuery.of(context).size.width,
//                                                       //                               color:mainColor,
//                                                       //                               height:30,
//                                                       //                               child: Text(
//                                                       //                           snapshot.value['name'] ?? "",
//                                                       //                           style: TextStyle(
//                                                       //                               fontWeight: FontWeight.w900,
//                                                       //                               fontSize: 13.sp,
//                                                       //                               overflow: TextOverflow.visible,
//                                                       //                           ),
//                                                       //
//                                                       //                       ),
//                                                       //                             ),
//                                                       //
//                                                       //                       getSizeText(snapshot),
//                                                       //                       SizedBox(
//                                                       //                         height:
//                                                       //                             9.h,
//                                                       //                         child: Text('${snapshot.value['quantity']}',style: TextStyle(color: Colors.black),),
//                                                       //                       ),
//                                                       //                       // getGeneralContentText(snapshot),
//                                                       //                       // Text(
//                                                       //                       //   (double.parse(snapshot.value.children.toList()[index].child('price').value) * int.parse(snapshot.value['quantity'])).toStringAsFixed(2),
//                                                       //                       //   style:
//                                                       //                       //       TextStyle(fontSize: 12.sp),
//                                                       //                       // ),
//                                                       //         //
//                                                       //         //             //adds
//                                                       //                       getGeneralAdditionsText(
//                                                       //                           snapshot),
//                                                       //
//                                                       //                       getAddDrinkText(
//                                                       //                           snapshot),
//                                                       //                       Row(
//                                                       //                         children: [
//                                                       //                           OutlinedButton(
//                                                       //                             onPressed: () async {
//                                                       //                               String newNumber = (int.parse(snapshot.value['quantity']) + 1).toString();
//                                                       //                               print(newNumber);
//                                                       //                            var x=   await FirebaseDatabase.instance.reference().child("Cart").
//                                                       //                             child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'));
//                                                       //                              x.
//                                                       //                              child("quantity").set(newNumber);
//                                                       //                               cartController.quantity.value= (int.parse(snapshot.value['quantity']) + 1).toInt();
//                                                       //                               print(cartController.cartItemList[index]);
//                                                       //
//                                                       //                               cartController.update();
//                                                       //
//                                                       //                               print(x);
//                                                       //                             },
//                                                       //                             child: Icon(
//                                                       //                               Icons.add,
//                                                       //                               color: HexColor("#89181E"),
//                                                       //                             ),
//                                                       //                             style: OutlinedButton.styleFrom(shape: CircleBorder(), side: BorderSide(color: HexColor("#89181E"))),
//                                                       //                           ),
//                                                       //                           Text('',
//                                                       //                             // snapshot.value['quantity'],
//                                                       //                             style: TextStyle(color: HexColor("#89181E"), fontSize: 16.sp, fontWeight: FontWeight.bold),
//                                                       //                           ),
//                                                       //                           OutlinedButton(
//                                                       //                             onPressed: () async {
//                                                       //                               if ((int.parse(snapshot.value['quantity']) > 1)) {
//                                                       //                                 String newNumber = (int.parse(snapshot.value['quantity']) - 1).toString();
//                                                       //                                 print("&&&&&&&&${newNumber}");
//                                                       //                                 await FirebaseDatabase.instance.reference().child("Cart").child(CacheHelper.loginShared!.phone.toString()).child(snapshot.value.id).child("quantity").set(newNumber);
//                                                       //                                 cartController.quantity.value = (int.parse(snapshot.value['quantity']) - 1).toInt();
//                                                       //                                 cartController.update();
//                                                       //                               }
//                                                       //                             },
//                                                       //                             child: Icon(
//                                                       //                               Icons.remove,
//                                                       //                               color: HexColor("#89181E"),
//                                                       //                             ),
//                                                       //                             style: OutlinedButton.styleFrom(
//                                                       //                               shape: CircleBorder(),
//                                                       //                               side: BorderSide(color: HexColor("#89181E")),
//                                                       //                             ),
//                                                       //                           ),
//                                                       //                         ],
//                                                       //                       ),
//                                                       //                     ],
//                                                       //                   ),
//                                                       //
//                                                       //               ],
//                                                       //             ),)],),),
//                                                       //         Padding(
//                                                       //           padding:
//                                                       //               const EdgeInsets
//                                                       //                       .all(
//                                                       //                   5.0),
//                                                       //           child: Align(
//                                                       //             alignment:
//                                                       //                 Alignment
//                                                       //                     .topLeft,
//                                                       //             child:
//                                                       //                 IconButton(
//                                                       //               icon: Icon(
//                                                       //                 Icons
//                                                       //                     .delete,
//                                                       //                 size:
//                                                       //                 !landScape ? 22.r : 50.r,
//                                                       //               ),
//                                                       //               onPressed:
//                                                       //                   () async {
//                                                       //                 setState(
//                                                       //                     () {
//                                                       //                   cartController
//                                                       //                       .totalPrice
//                                                       //                       .value -= ((double.parse(
//                                                       //                           snapshot.value["totalPrice"])) *
//                                                       //                       (double.parse(snapshot.value["quantity"])));
//                                                       //                 });
//                                                       //                 cartController
//                                                       //                     .update();
//                                                       //                 await FirebaseDatabase
//                                                       //                     .instance
//                                                       //                     .reference()
//                                                       //                     .child(
//                                                       //                     'Cart').child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
//                                                       //                     // .child(CacheHelper
//                                                       //                     //     .loginShared!
//                                                       //                     //     .phone
//                                                       //                     //     .toString())
//                                                       //                     .child(snapshot.value[
//                                                       //                         'id'])
//                                                       //                     .remove()
//                                                       //                     .then((_) => cartController
//                                                       //                         .getCartData())
//                                                       //                     .then((_) =>
//                                                       //                         cartController.update());
//                                                       //               },
//                                                       //               color: Colors
//                                                       //                   .red,
//                                                       //             ),
//                                                       //           ),
//                                                       //         ),
//                                                       //       ],
//                                                       //     ),
//                                                       //   );
//                                                       // }
//
//                                                       return Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   bottom: 18.0),
//                                                           child: Directionality(
//                                                             textDirection:
//                                                                 translateName
//                                                                     ? TextDirection
//                                                                         .ltr
//                                                                     : TextDirection
//                                                                         .rtl,
//                                                             child: Card(
//                                                               elevation: 5,
//                                                               color: mainColor,
//                                                               shadowColor:
//                                                                   mainColor,
//                                                               shape: RoundedRectangleBorder(
//                                                                   side: BorderSide(
//                                                                       color:
//                                                                           mainColor,
//                                                                       width: 3),
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               15)),
//                                                               child: Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .start,
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Expanded(
//                                                                     child:
//                                                                         Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .center,
//                                                                       mainAxisAlignment:
//                                                                           MainAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         Text(
//                                                                           "${snapshot.value['name']}"
//                                                                               .toUpperCase(),
//                                                                           style:
//                                                                               TextStyle(fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                         Directionality(
//                                                                           textDirection: translateName
//                                                                               ? TextDirection.ltr
//                                                                               : TextDirection.rtl,
//                                                                           child:
//                                                                               Stack(
//                                                                             children: [
//                                                                               Container(
//                                                                                 // height: 80.h,
//
//                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: translateName ? BorderRadius.only(bottomRight: Radius.circular(15)) : BorderRadius.only(bottomLeft: Radius.circular(15))),
//                                                                                 child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
//                                                                                   CartIngrediantRow(
//                                                                                       textKey: 'price'.tr,
//                                                                                       widget: Text(
//                                                                                         '${snapshot.value['price']}',
//                                                                                         style: TextStyle(fontSize: 12),
//                                                                                       )),
//
//                                                                                   Divider(
//                                                                                     thickness: .7,
//                                                                                     height: 2,
//                                                                                     color: Colors.grey,
//                                                                                   ),
//                                                                                   // CartIngrediantRow(
//                                                                                   //     textKey: 'order_content'.tr,
//                                                                                   //     widget: Column(children: [
//                                                                                   //       ...List.generate( getGeneralContentText(snapshot).length, (index) {
//                                                                                   //         return getGeneralContentText(snapshot);
//                                                                                   //       }),
//                                                                                   //     ])),
//                                                                                   CartIngrediantRow(
//                                                                                     textKey: 'order_content'.tr,
//                                                                                     widget: getGeneralContentText(snapshot),
//                                                                                   ),
//
//                                                                                   Divider(
//                                                                                     thickness: .7,
//                                                                                     height: 2,
//                                                                                     color: Colors.grey,
//                                                                                   ),
//                                                                                   CartIngrediantRow(
//                                                                                     textKey: 'pick_size'.tr,
//                                                                                     widget: Text(
//                                                                                       '${snapshot.value['sizes']}'.tr,
//                                                                                       style: TextStyle(fontSize: 12),
//                                                                                     ),
//                                                                                   ),
//                                                                                   // getSizeText(snapshot),
//                                                                                   Divider(
//                                                                                     thickness: .7,
//                                                                                     height: 2,
//                                                                                     color: Colors.grey,
//                                                                                   ),
//                                                                                   // getOther_additional(snapshot),
//                                                                                   CartIngrediantRow(
//                                                                                     textKey: 'extras'.tr,
//                                                                                     widget: getOther_additional(snapshot),
//                                                                                     // Text('${snapshot.value['other_additional']}'.tr,style: TextStyle(fontSize: 12),),
//                                                                                   ),
//                                                                                   Divider(
//                                                                                     thickness: .7,
//                                                                                     height: 2,
//                                                                                     color: Colors.grey,
//                                                                                   ),
//                                                                                   CartIngrediantRow(
//                                                                                     textKey: 'total'.tr,
//                                                                                     widget: Row(
//                                                                                       children: [
//                                                                                     // Text(
//                                                                                         //   (double.parse(snapshot.value.children.toList()[index]
//                                                                                         //       .child(snapshot.value['price']).value) *
//                                                                                         //       int.parse(snapshot.value['quantity'])).toStringAsFixed(2),
//                                                                                         //   style:
//                                                                                         //       TextStyle(fontSize: 12.sp),
//                                                                                         // ),
//                                                                                         Text(
//                                                                                           '${snapshot.value['total_price']}'.tr,
//                                                                                           style: TextStyle(fontSize: 12),
//                                                                                         ),
//                                                                                         Text(
//                                                                                           'coin_jordan'.tr,
//                                                                                           style: TextStyle(fontSize: 12),
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ),
//                                                                                   Divider(
//                                                                                     thickness: .7,
//                                                                                     height: 2,
//                                                                                     color: Colors.grey,
//                                                                                   ),
//                                                                                   GetBuilder<CartController>(builder: (cartController) {
//                                                                                     return CartIngrediantRow(
//                                                                                       textKey: 'quantity'.tr,
//                                                                                       widget: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                                                         children: [
//                                                                                           CircleAvatar(
//                                                                                             backgroundColor: mainColor,
//                                                                                             radius: 13,
//                                                                                             child: IconButton(
//                                                                                                 onPressed: () async {
//                                                                                                   // var limit = CacheHelper.getDataToSharedPrefrence('limit');
//                                                                                                   // var limit =subCategoriesController.products[snapshot.key!!].availability;
//                                                                                                   // if (int.parse(snapshot.value['quantity']) < limit!) {
//                                                                                                     String newNumber = (int.parse(snapshot.value['quantity']) + 1).toString();
//                                                                                                     print(newNumber);
//                                                                                                     await FirebaseDatabase.instance.reference().child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
//                                                                                                         .child(CacheHelper.getDataToSharedPrefrence('userID')).child(snapshot.key!).child('quantity').set(newNumber);
//
//                                                                                                     cartController.quantity.value = (int.parse(snapshot.value['quantity']) + 1).toInt();
//                                                                                                     cartController.totalPrice.value += ((double.parse(snapshot.value['total_price'])) *
//                                                                                                                           (double.parse(snapshot.value["quantity"])));
//                                                                                                     cartController.update();
//
//                                                                                                   // } else {
//                                                                                                   //   Get.snackbar('sorry'.tr, 'there_is_no_sufficient_quantity'.tr, snackPosition: SnackPosition.TOP, backgroundColor: kPrimaryColor, duration: Duration(seconds: 2), dismissDirection: DismissDirection.startToEnd, barBlur: 10, colorText: mainColor);
//                                                                                                   // }
//                                                                                                 },
//                                                                                                 icon: Icon(
//                                                                                                   Icons.add,
//                                                                                                   size: 13,
//                                                                                                   color: Colors.white,
//                                                                                                 )),
//                                                                                           ),
//                                                                                           SizedBox(
//                                                                                             width: 15,
//                                                                                           ),
//                                                                                           SizedBox(
//                                                                                             child: Text('${snapshot.value['quantity']}'.tr),
//                                                                                           ),
//                                                                                           SizedBox(
//                                                                                             width: 15,
//                                                                                           ),
//
//                                                                                              CircleAvatar(
//                                                                                             backgroundColor: mainColor,
//                                                                                             radius: 13,
//                                                                                             child: IconButton(
//                                                                                               onPressed: () async {
//                                                                                                 if ((int.parse(snapshot.value['quantity']) > 1)) {
//                                                                                                   String newNumber = (int.parse(snapshot.value['quantity']) - 1).toString();
//                                                                                                   print(newNumber);
//                                                                                                   await FirebaseDatabase.instance.reference().child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
//                                                                                                       .child(CacheHelper.getDataToSharedPrefrence('userID')).child(snapshot.key!).child('quantity').set(newNumber);
//
//                                                                                                   cartController.quantity.value = (int.parse(snapshot.value['quantity']) - 1).toInt();
//
//                                                                                                   cartController.cartItemList2[index].quantity = (int.parse(snapshot.value['number']) - 1).toString();
//
//                                                                                                   /********it's not working****/
//                                                                                                   final  newTotalPrice = (double.parse(snapshot.value["total_price"]));
//
//                                                                                                    await FirebaseDatabase.instance.reference().child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
//                                                                                                       .child(CacheHelper.getDataToSharedPrefrence('userID')).child(snapshot.key!).child('total_price').set(newTotalPrice);
//
//                                                                                                   cartController.update();
//                                                                                                 }
//                                                                                               },
//                                                                                               icon: Icon(
//                                                                                                 Icons.minimize,
//                                                                                                 size: 13,
//                                                                                                 color: Colors.white,
//                                                                                               ),
//                                                                                             ),
//                                                                                           )
//
//                                                                                         ],
//                                                                                       ),
//                                                                                     );
//                                                                                   }),
//                                                                                   Divider(
//                                                                                     thickness: .7,
//                                                                                     height: 2,
//                                                                                     color: Colors.grey,
//                                                                                   ),
//                                                                                 ]),
//                                                                               ),
//                                                                               Positioned(
//                                                                                 top: 0,
//                                                                                 // right:translateName? 3:0,
//                                                                                 // left:translateName? 3:0,
//                                                                                 child: CircleAvatar(
//                                                                                     radius: 19,
//                                                                                     backgroundColor: mainColor,
//                                                                                     child: CircleAvatar(
//                                                                                       backgroundColor: Colors.white,
//                                                                                       radius: 18,
//                                                                                       child: IconButton(
//                                                                                         icon: Icon(
//                                                                                           Icons.delete,
//                                                                                           size: !landScape ? 22.r : 50.r,
//                                                                                         ),
//                                                                                         onPressed: () async {
//                                                                                           setState(
//                                                                                                   () {
//                                                                                                     cartController.hide.value? cartController.totalPrice.value=0.0:
//                                                                                           cartController.totalPrice.value -= ((double.parse(snapshot.value["total_price"])) * (double.parse(snapshot.value["quantity"])));
//
//
//                                                                                           });
//                                                                                           cartController.update();
//                                                                                           await FirebaseDatabase.instance
//                                                                                               .reference()
//                                                                                               .child("Cart")
//                                                                                               .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
//                                                                                               .child(CacheHelper.getDataToSharedPrefrence('userID'))
//                                                                                               // .child(CacheHelper
//                                                                                               //     .loginShared!
//                                                                                               //     .phone
//                                                                                               //     .toString())
//                                                                                               // .child(CacheHelper.getDataToSharedPrefrence('dateOfTheOrder'))
//
//                                                                                               .child(snapshot.key!)
//                                                                                               .remove()
//                                                                                               .then((_) => cartController.getCartData())
//                                                                                               .then((_) => cartController.update());
//                                                                                         },
//                                                                                         color: Colors.red,
//                                                                                       ),
//                                                                                       // IconButton(
//                                                                                       //   onPressed: () {},
//                                                                                       //   icon: Icon(
//                                                                                       //     Icons.delete,
//                                                                                       //     color: Colors.red,
//                                                                                       //     size: 23,
//                                                                                       //   ),
//                                                                                       // ),
//                                                                                     )),
//                                                                               )
//                                                                             ],
//                                                                           ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                   Column(
//                                                                     children: [
//                                                                       ClipRRect(
//                                                                         borderRadius: BorderRadius.only(
//                                                                             topLeft:
//                                                                                 Radius.circular(15),
//                                                                             bottomLeft: Radius.circular(15)),
//                                                                         child:
//                                                                             CachedNetworkImage(
//                                                                           height:
//                                                                               120.h,
//                                                                           width:
//                                                                               150.w,
//                                                                           imageUrl:
//                                                                               snapshot.value['photo'] ?? "",
//                                                                           fit: BoxFit
//                                                                               .cover,
//                                                                           errorWidget: (context, url, error) =>
//                                                                               Icon(
//                                                                             Icons.image_not_supported_sharp,
//                                                                             size:
//                                                                                 60,
//                                                                             color:
//                                                                                 kPrimaryColor.withOpacity(0.6),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                       Container(
//                                                                         // width: MediaQuery.of(context).size.width,
//                                                                         // height: MediaQuery.of(context).size.height,
//                                                                         // color:Colors.white,
//                                                                         child: Text(
//                                                                             'No Massages'),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ));
//                                                     }
//                                                     )
//                                               ],
//                                             );
//                                           })),
//                                   /**********************************************************total***********************************************************/
//
//                                   Column(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(8.r),
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(4.r),
//                                           color: mainColor,
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: [
//                                                 Text("${'total'.tr} : ",
//                                                     style: TextStyle(
//                                                         fontSize: 14.sp,
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                                 GetBuilder<CartController>(
//                                                     builder: (cartController) {
//                                                   return Text(
//                                                       cartController
//                                                           .totalPrice.value
//                                                           .toStringAsFixed(2),
//                                                       style: TextStyle(
//                                                           fontSize: 25.sp,
//                                                           color: Colors.red,
//                                                           fontWeight:
//                                                               FontWeight.bold));
//                                                 }),
//                                               ],
//                                             ),
//                                             Text(
//                                               "(${'with_tax'.tr})",
//                                               style: TextStyle(
//                                                   fontSize: 14.sp,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 30.h,
//                                       ),
//                                       /**********************************************the End********************************************************/
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           SizedBox(
//                                             width: 150.w,
//                                             height: !landScape ? 50.h : 100.h,
//                                             child: TextButton(
//                                               onPressed: () {
//                                                 bottomNavBarController
//                                                     .currentIndex.value = 1;
//                                               },
//                                               style: TextButton.styleFrom(
//                                                 backgroundColor: mainColor,
//                                               ),
//                                               child: FittedBox(
//                                                 child: Text(
//                                                   "continue_shopping".tr,
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 16.sp),
//                                                 ),
//                                               ),
//                                             ),
//                                           ), // afterBuild(),
//
//                                           SizedBox(
//                                             width: 150.w,
//                                             height: !landScape ? 50.h : 100.h,
//                                             child: TextButton(
//                                               onPressed: () {
//                                                 Get.to(() =>
//                                                     WhereToDeliverScreen());
//                                               },
//                                               style: TextButton.styleFrom(
//                                                 backgroundColor: mainColor,
//                                               ),
//                                               child: FittedBox(
//                                                 child: Text(
//                                                   "proceed_check_out".tr,
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 16.sp),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                       }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// //Text(snapshot.value["total_price"].toString()),
//
//   Widget getSizeText(snapshot) {
//     if (snapshot.value['sizes'] != null) {
//       for (var size in snapshot.value['sizes'] ?? '') {
//         if (size["is_need"] == true) {
//           return Text(
//             size["size"] ?? "",
//             style: TextStyle(fontSize: 12.sp),
//           );
//         }
//       }
//     }
//     return SizedBox();
//   }
//
//   Widget getGeneralAdditionsText(dynamic snapshot) {
//     List generalAdds = [];
//     if (snapshot.value['addsList'] != null) {
//       for (var gAdds in snapshot.value['addsList'] ?? []) {
//         if (gAdds["is_need"] == true) {
//           generalAdds.add(gAdds["adds"]);
//         }
//       }
//       return Text(
//         generalAdds.toString().replaceAll("[", "").replaceAll("]", ""),
//         style: TextStyle(fontSize: 12.sp),
//       );
//     }
//     return SizedBox();
//   }
//
//   Widget getOther_additional(dynamic snapshot) {
//     List generalAdds = [];
//     if (snapshot.value['other_additional'] != null) {
//       for (var gAdds in snapshot.value['other_additional'] ?? []) {
//         // if (gAdds["is_need"] == true) {
//         generalAdds.add(gAdds["name"]);
//         // }
//       }
//       return Text(
//         generalAdds.toString().replaceAll("[", "").replaceAll("]", ""),
//         style: TextStyle(fontSize: 12.sp, color: Colors.black),
//       );
//     }
//     return SizedBox();
//   }
//
//   Widget getGeneralContentText(dynamic snapshot) {
//     List<Widget> contentAds = [];
//     if (snapshot.value['components'] != null) {
//       for (var gAdds in snapshot.value['components'] ?? []) {
//         // if (gAdds["need"] == true) {
//         contentAds.add(Text(
//           gAdds["name"],
//           style: TextStyle(fontSize: 12.sp),
//         ));
//         contentAds.add(Text(" ,"));
//         // }
//       }
//       return Container(
//         width: 170.w,
//         child: Wrap(
//           children: contentAds,
//         ),
//       );
//     }
//     return SizedBox();
//   }
//
//   Widget getAddDrinkText(dynamic snapshot) {
//     List drinkAds = [];
//     if (snapshot.value['list_of_drinks'] != null) {
//       for (var gAdds in snapshot.value['list_of_drinks'] ?? []) {
//         if (gAdds["is_need"] == true) {
//           drinkAds.add(gAdds["name"]);
//         }
//       }
//       return Text(
//         drinkAds.toString().replaceAll("[", "").replaceAll("]", ""),
//         style: TextStyle(fontSize: 12.sp),
//       );
//     }
//     return SizedBox();
//   }
// }
//
// class CartIngrediantRow extends StatelessWidget {
//   Widget? widget;
//   String? textKey;
//
//   CartIngrediantRow({Key? key, this.textKey, this.widget}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0, left: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           widget!,
//           SizedBox(
//             width: 1,
//           ),
//           Text(
//             ': $textKey',
//             style: TextStyle(
//                 color: kPrimaryColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14.sp),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:arrows/constants/colors.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:arrows/modules/cart/controllers/cart_controller.dart';
import 'package:arrows/modules/sub_categories/controllers/sub_categories_controller.dart';
import 'package:arrows/modules/sub_categories/models/firebase_product_model.dart';
import 'package:arrows/modules/where_to_deliver/screens/where_to_deliver_screem.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../product_details2/model/ProductDetailsModel.dart';
import '../../sign_up/models/user_model.dart';
import '../models/new_cart_model.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());

  final BottomNavBarController bottomNavBarController =
  Get.put(BottomNavBarController());
  SubCategoriesController subCategoriesController = SubCategoriesController();

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < farsi.length; i++) {
      input = input.replaceAll(farsi[i], english[i]);
    }

    return input;
  }

  final items = <NewCartModel2>[];

  @override
  Widget build(BuildContext context) {
    final translateName =
    CacheHelper.getDataToSharedPrefrence("localeIsArabic");
    final landScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        cartController.update();
      });
      print("Car updated");
    });

    print(cartController.hide.value);
    cartController.getCartData();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                (CacheHelper.loginShared == null)
                    ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 300.h,
                    ),
                    Center(
                        child: Text(
                          "no_products_cart".tr,
                          style: TextStyle(fontSize: 20.sp, color: mainColor),
                        )),
                  ],
                )
                    : GetX<CartController>(builder: (cartController) {
                  return cartController.hide.value
                      ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 300.h,
                      ),
                      Center(
                        child: Text(
                          "no_products_cart".tr,
                          style: TextStyle(
                              fontSize: 20.sp, color: mainColor),
                        ),
                      )
                    ],
                  )
                      : Column(
                    children: [
                      SizedBox(
                          child: FutureBuilder(
                              future: cartController.getCartData(),
                              builder: (context, snapshot) {
                                cartController.totalPrice.value =
                                0.0;
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  );
                                /*********************************************this is our list******************************************************/

                                return Column(
                                  children: [
                                    FirebaseAnimatedList(
                                        query: cartController.dbRef,
                                        // itemCount: cartController.cartItemList.length,
                                        shrinkWrap: true,
                                        physics:
                                        BouncingScrollPhysics(),
                                        // padding: EdgeInsets.only(bottom: 100),
                                        itemBuilder: (
                                            BuildContext context,
                                            DataSnapshot snapshot,
                                            Animation<double>
                                            animation,
                                            int index,
                                            ) {
                                          if (index == 0) {
                                            cartController
                                                .totalPrice
                                                .value = 0.0;
                                          }
                                          cartController.totalPrice
                                              .value = cartController
                                              .totalPrice
                                              // .value + ((double.parse(snapshot.value["total_price"])) *
                                              .value + ((double.parse(snapshot.value["price"])) *
                                              (double.parse(snapshot.value["quantity"])));
                                          //
                                          // if (!snapshot.exists) {
                                          //    return SizedBox();
                                          // } else {
                                          //   if (index == 0) {
                                          //     cartController
                                          //         .cartItemList = [];
                                          //   }
                                          //   final json =
                                          //       snapshot.value
                                          //           as Map<dynamic,
                                          //               dynamic>;
                                          //   Product message =
                                          //       Product.fromJson(
                                          //           json);
                                          //   cartController
                                          //       .cartItemList
                                          //       .add(message);
                                          //   return SizeTransition(
                                          //     sizeFactor: animation,
                                          //     child: Stack(
                                          //       children: [
                                          //         Card(
                                          //           elevation: 5,
                                          //           color: Colors.white,
                                          //           shadowColor: Colors.white,
                                          //           shape: RoundedRectangleBorder(
                                          //               side: BorderSide(
                                          //                   color: mainColor, width: 4),
                                          //               borderRadius:
                                          //               BorderRadius.circular(15)),
                                          //           child:
                                          //           Row(
                                          //             mainAxisAlignment:
                                          //             MainAxisAlignment.end,
                                          //             children: [
                                          //               Expanded(
                                          //                 child:
                                          //                Row(
                                          //               children: [
                                          //                 ClipRRect(
                                          //                   borderRadius: BorderRadius.only(
                                          //                       topLeft: Radius.circular(5),
                                          //                       bottomLeft:
                                          //                       Radius.circular(15)),
                                          //                   child: CachedNetworkImage(
                                          //                     height: 120.h,
                                          //                     width: 150.w,
                                          //                     imageUrl:
                                          //                         snapshot.value['photo'],
                                          //                     fit: BoxFit
                                          //                         .cover,
                                          //                         errorWidget: (context,
                                          //                             url,
                                          //                             error) =>
                                          //                         Icon(
                                          //                       Icons.image_not_supported_sharp, size: 60,
                                          //                       color:
                                          //                           kPrimaryColor.withOpacity(0.6),
                                          //                     ),
                                          //                   ),
                                          //                 ),
                                          //                 Text('${snapshot.value['totalPrice']}'),
                                          //               Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment.start,
                                          //                     mainAxisAlignment:
                                          //                         MainAxisAlignment.start,
                                          //                     // mainAxisSize:
                                          //                     //     MainAxisSize.max,
                                          //                     children: [
                                          //
                                          //                             Container(
                                          //                               // width:MediaQuery.of(context).size.width,
                                          //                               color:mainColor,
                                          //                               height:30,
                                          //                               child: Text(
                                          //                           snapshot.value['name'] ?? "",
                                          //                           style: TextStyle(
                                          //                               fontWeight: FontWeight.w900,
                                          //                               fontSize: 13.sp,
                                          //                               overflow: TextOverflow.visible,
                                          //                           ),
                                          //
                                          //                       ),
                                          //                             ),
                                          //
                                          //                       getSizeText(snapshot),
                                          //                       SizedBox(
                                          //                         height:
                                          //                             9.h,
                                          //                         child: Text('${snapshot.value['quantity']}',style: TextStyle(color: Colors.black),),
                                          //                       ),
                                          //                       // getGeneralContentText(snapshot),
                                          //                       // Text(
                                          //                       //   (double.parse(snapshot.value.children.toList()[index].child('price').value) * int.parse(snapshot.value['quantity'])).toStringAsFixed(2),
                                          //                       //   style:
                                          //                       //       TextStyle(fontSize: 12.sp),
                                          //                       // ),
                                          //         //
                                          //         //             //adds
                                          //                       getGeneralAdditionsText(
                                          //                           snapshot),
                                          //
                                          //                       getAddDrinkText(
                                          //                           snapshot),
                                          //                       Row(
                                          //                         children: [
                                          //                           OutlinedButton(
                                          //                             onPressed: () async {
                                          //                               String newNumber = (int.parse(snapshot.value['quantity']) + 1).toString();
                                          //                               print(newNumber);
                                          //                            var x=   await FirebaseDatabase.instance.reference().child("Cart").
                                          //                             child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'));
                                          //                              x.
                                          //                              child("quantity").set(newNumber);
                                          //                               cartController.quantity.value= (int.parse(snapshot.value['quantity']) + 1).toInt();
                                          //                               print(cartController.cartItemList[index]);
                                          //
                                          //                               cartController.update();
                                          //
                                          //                               print(x);
                                          //                             },
                                          //                             child: Icon(
                                          //                               Icons.add,
                                          //                               color: HexColor("#89181E"),
                                          //                             ),
                                          //                             style: OutlinedButton.styleFrom(shape: CircleBorder(), side: BorderSide(color: HexColor("#89181E"))),
                                          //                           ),
                                          //                           Text('',
                                          //                             // snapshot.value['quantity'],
                                          //                             style: TextStyle(color: HexColor("#89181E"), fontSize: 16.sp, fontWeight: FontWeight.bold),
                                          //                           ),
                                          //                           OutlinedButton(
                                          //                             onPressed: () async {
                                          //                               if ((int.parse(snapshot.value['quantity']) > 1)) {
                                          //                                 String newNumber = (int.parse(snapshot.value['quantity']) - 1).toString();
                                          //                                 print("&&&&&&&&${newNumber}");
                                          //                                 await FirebaseDatabase.instance.reference().child("Cart").child(CacheHelper.loginShared!.phone.toString()).child(snapshot.value.id).child("quantity").set(newNumber);
                                          //                                 cartController.quantity.value = (int.parse(snapshot.value['quantity']) - 1).toInt();
                                          //                                 cartController.update();
                                          //                               }
                                          //                             },
                                          //                             child: Icon(
                                          //                               Icons.remove,
                                          //                               color: HexColor("#89181E"),
                                          //                             ),
                                          //                             style: OutlinedButton.styleFrom(
                                          //                               shape: CircleBorder(),
                                          //                               side: BorderSide(color: HexColor("#89181E")),
                                          //                             ),
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //
                                          //               ],
                                          //             ),)],),),
                                          //         Padding(
                                          //           padding:
                                          //               const EdgeInsets
                                          //                       .all(
                                          //                   5.0),
                                          //           child: Align(
                                          //             alignment:
                                          //                 Alignment
                                          //                     .topLeft,
                                          //             child:
                                          //                 IconButton(
                                          //               icon: Icon(
                                          //                 Icons
                                          //                     .delete,
                                          //                 size:
                                          //                 !landScape ? 22.r : 50.r,
                                          //               ),
                                          //               onPressed:
                                          //                   () async {
                                          //                 setState(
                                          //                     () {
                                          //                   cartController
                                          //                       .totalPrice
                                          //                       .value -= ((double.parse(
                                          //                           snapshot.value["totalPrice"])) *
                                          //                       (double.parse(snapshot.value["quantity"])));
                                          //                 });
                                          //                 cartController
                                          //                     .update();
                                          //                 await FirebaseDatabase
                                          //                     .instance
                                          //                     .reference()
                                          //                     .child(
                                          //                     'Cart').child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
                                          //                     // .child(CacheHelper
                                          //                     //     .loginShared!
                                          //                     //     .phone
                                          //                     //     .toString())
                                          //                     .child(snapshot.value[
                                          //                         'id'])
                                          //                     .remove()
                                          //                     .then((_) => cartController
                                          //                         .getCartData())
                                          //                     .then((_) =>
                                          //                         cartController.update());
                                          //               },
                                          //               color: Colors
                                          //                   .red,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   );
                                          // }

                                          return Padding(
                                              padding:
                                              const EdgeInsets
                                                  .only(
                                                  bottom: 18.0),
                                              child: Directionality(
                                                textDirection:
                                                translateName
                                                    ? TextDirection
                                                    .ltr
                                                    : TextDirection
                                                    .rtl,
                                                child: Card(
                                                  elevation: 5,
                                                  color: mainColor,
                                                  shadowColor:
                                                  mainColor,
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color:
                                                          mainColor,
                                                          width: 3),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          15)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "${snapshot.value['name']}"
                                                                  .toUpperCase(),
                                                              style:
                                                              TextStyle(fontWeight: FontWeight.bold),
                                                            ),
                                                            Directionality(
                                                              textDirection: translateName
                                                                  ? TextDirection.ltr
                                                                  : TextDirection.rtl,
                                                              child:
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    // height: 80.h,

                                                                    decoration: BoxDecoration(color: Colors.white, borderRadius: translateName ? BorderRadius.only(bottomRight: Radius.circular(15)) : BorderRadius.only(bottomLeft: Radius.circular(15))),
                                                                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                                      CartIngrediantRow(
                                                                          textKey: 'price'.tr,
                                                                          widget: Text(
                                                                            '${snapshot.value['price']}',
                                                                            style: TextStyle(fontSize: 12),
                                                                          )),

                                                                      Divider(
                                                                        thickness: .7,
                                                                        height: 2,
                                                                        color: Colors.grey,
                                                                      ),
                                                                      // CartIngrediantRow(
                                                                      //     textKey: 'order_content'.tr,
                                                                      //     widget: Column(children: [
                                                                      //       ...List.generate( getGeneralContentText(snapshot).length, (index) {
                                                                      //         return getGeneralContentText(snapshot);
                                                                      //       }),
                                                                      //     ])),
                                                                      CartIngrediantRow(
                                                                        textKey: 'order_content'.tr,
                                                                        widget: getGeneralContentText(snapshot),
                                                                      ),

                                                                      Divider(
                                                                        thickness: .7,
                                                                        height: 2,
                                                                        color: Colors.grey,
                                                                      ),
                                                                      CartIngrediantRow(
                                                                        textKey: 'pick_size'.tr,
                                                                        widget: Text(
                                                                          '${snapshot.value['sizes']}'.tr,
                                                                          style: TextStyle(fontSize: 12),
                                                                        ),
                                                                      ),
                                                                      // getSizeText(snapshot),
                                                                      Divider(
                                                                        thickness: .7,
                                                                        height: 2,
                                                                        color: Colors.grey,
                                                                      ),
                                                                      // getOther_additional(snapshot),
                                                                      CartIngrediantRow(
                                                                        textKey: 'extras'.tr,
                                                                        widget: getOther_additional(snapshot),
                                                                        // Text('${snapshot.value['other_additional']}'.tr,style: TextStyle(fontSize: 12),),
                                                                      ),
                                                                      Divider(
                                                                        thickness: .7,
                                                                        height: 2,
                                                                        color: Colors.grey,
                                                                      ),
                                                                      CartIngrediantRow(
                                                                        textKey: 'total'.tr,
                                                                        widget: Row(
                                                                          children: [
                                                                            // Text(
                                                                            //   (double.parse(snapshot.value.children.toList()[index]
                                                                            //       .child(snapshot.value['price']).value) *
                                                                            //       int.parse(snapshot.value['quantity'])).toStringAsFixed(2),
                                                                            //   style:
                                                                            //       TextStyle(fontSize: 12.sp),
                                                                            // ),
                                                                            Text(
                                                                              '${((double.parse(snapshot.value["price"])) *
                                                                                  (double.parse(snapshot.value["quantity"])))}',
                                                                               style: TextStyle(fontSize: 12),
                                                                            ),
                                                                            // Text(
                                                                            //   '${snapshot.value['total_price']}'.tr,
                                                                            //   style: TextStyle(fontSize: 12),
                                                                            // ),
                                                                            Text(
                                                                              'coin_jordan'.tr,
                                                                              style: TextStyle(fontSize: 12),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness: .7,
                                                                        height: 2,
                                                                        color: Colors.grey,
                                                                      ),
                                                                      GetBuilder<CartController>(builder: (cartController) {
                                                                        return CartIngrediantRow(
                                                                          textKey: 'quantity'.tr,
                                                                          widget: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              CircleAvatar(
                                                                                backgroundColor: mainColor,
                                                                                radius: 13,
                                                                                child: IconButton(
                                                                                    onPressed: () async {
                                                                                      // var limit = CacheHelper.getDataToSharedPrefrence('limit');
                                                                                      // var limit =subCategoriesController.products[snapshot.key!!].availability;
                                                                                      // if (int.parse(snapshot.value['quantity']) < limit!) {
                                                                                      String newNumber = (int.parse(snapshot.value['quantity']) + 1).toString();
                                                                                      print(newNumber);
                                                                                      await FirebaseDatabase.instance.reference().child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
                                                                                          .child(CacheHelper.getDataToSharedPrefrence('userID')).child(snapshot.key!).child('quantity').set(newNumber);
                                                                                      cartController.quantity.value = (int.parse(snapshot.value['quantity']) + 1).toInt();
                                                                                      cartController.update();




                                                                                      // } else {
                                                                                      //   Get.snackbar('sorry'.tr, 'there_is_no_sufficient_quantity'.tr, snackPosition: SnackPosition.TOP, backgroundColor: kPrimaryColor, duration: Duration(seconds: 2), dismissDirection: DismissDirection.startToEnd, barBlur: 10, colorText: mainColor);
                                                                                      // }
                                                                                    },
                                                                                    icon: Icon(
                                                                                      Icons.add,
                                                                                      size: 13,
                                                                                      color: Colors.white,
                                                                                    )),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 15,
                                                                              ),
                                                                              SizedBox(
                                                                                child: Text('${snapshot.value['quantity']}'.tr),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 15,
                                                                              ),
                                                                              CircleAvatar(
                                                                                backgroundColor: mainColor,
                                                                                radius: 13,
                                                                                child: IconButton(
                                                                                  onPressed: () async {
                                                                                    if ((int.parse(snapshot.value['quantity']) > 1)) {
                                                                                      String newNumber = (int.parse(snapshot.value['quantity']) - 1).toString();
                                                                                      print(newNumber);
                                                                                      await FirebaseDatabase.instance.reference().child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID')).child(CacheHelper.getDataToSharedPrefrence('userID')).child(snapshot.key!).child('quantity').set(newNumber);
                                                                                      cartController.quantity.value = (int.parse(snapshot.value['quantity']) - 1).toInt();
                                                                                      cartController.update();
                                                                                    }
                                                                                  },
                                                                                  icon: Icon(
                                                                                    Icons.minimize,
                                                                                    size: 13,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }),
                                                                      Divider(
                                                                        thickness: .7,
                                                                        height: 2,
                                                                        color: Colors.grey,
                                                                      ),
                                                                    ]),
                                                                  ),
                                                                  Positioned(
                                                                    top: 0,
                                                                    // right:translateName? 3:0,
                                                                    // left:translateName? 3:0,
                                                                    child: CircleAvatar(
                                                                        radius: 19,
                                                                        backgroundColor: mainColor,
                                                                        child: CircleAvatar(
                                                                          backgroundColor: Colors.white,
                                                                          radius: 18,
                                                                          child: IconButton(
                                                                            icon: Icon(
                                                                              Icons.delete,
                                                                              size: !landScape ? 22.r : 50.r,
                                                                            ),
                                                                            onPressed: () async {
                                                                              setState(
                                                                                      () {
                                                                                    cartController.totalPrice.value -= ((double.parse(snapshot.value["total_price"])) * (double.parse(snapshot.value["quantity"])));
                                                                                  });
                                                                              cartController.update();
                                                                              await FirebaseDatabase.instance
                                                                                  .reference()
                                                                                  .child("Cart")
                                                                                  .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
                                                                                  .child(CacheHelper.getDataToSharedPrefrence('userID'))
                                                                              // .child(CacheHelper
                                                                              //     .loginShared!
                                                                              //     .phone
                                                                              //     .toString())
                                                                              // .child(CacheHelper.getDataToSharedPrefrence('dateOfTheOrder'))

                                                                                  .child(snapshot.key!)
                                                                                  .remove()
                                                                                  .then((_) => cartController.getCartData())
                                                                                  .then((_) => cartController.update());
                                                                            },
                                                                            color: Colors.red,
                                                                          ),
                                                                          // IconButton(
                                                                          //   onPressed: () {},
                                                                          //   icon: Icon(
                                                                          //     Icons.delete,
                                                                          //     color: Colors.red,
                                                                          //     size: 23,
                                                                          //   ),
                                                                          // ),
                                                                        )),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft:
                                                                Radius.circular(15),
                                                                bottomLeft: Radius.circular(15)),
                                                            child:
                                                            CachedNetworkImage(
                                                              height:
                                                              120.h,
                                                              width:
                                                              150.w,
                                                              imageUrl:
                                                              snapshot.value['photo'] ?? "",
                                                              fit: BoxFit
                                                                  .cover,
                                                              errorWidget: (context, url, error) =>
                                                                  Icon(
                                                                    Icons.image_not_supported_sharp,
                                                                    size:
                                                                    60,
                                                                    color:
                                                                    kPrimaryColor.withOpacity(0.6),
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            // width: MediaQuery.of(context).size.width,
                                                            // height: MediaQuery.of(context).size.height,
                                                            // color:Colors.white,
                                                            child: Text(
                                                                'No Massages'),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        }
                                      // }),
                                    )
                                  ],
                                );
                              })),
                      /**********************************************************total***********************************************************/

                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(4.r),
                              color: mainColor,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("${'total'.tr} : ",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight:
                                            FontWeight.bold)),
                                    GetBuilder<CartController>(
                                        builder: (cartController) {
                                          return Text(
                                              cartController
                                                  .totalPrice.value
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 25.sp,
                                                  color: Colors.red,
                                                  fontWeight:
                                                  FontWeight.bold));
                                        }),
                                  ],
                                ),
                                Text(
                                  "(${'with_tax'.tr})",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          /**********************************************the End********************************************************/
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 150.w,
                                height: !landScape ? 50.h : 100.h,
                                child: TextButton(
                                  onPressed: () {
                                    bottomNavBarController
                                        .currentIndex.value = 1;
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: mainColor,
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      "continue_shopping".tr,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ), // afterBuild(),

                              SizedBox(
                                width: 150.w,
                                height: !landScape ? 50.h : 100.h,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() =>
                                        WhereToDeliverScreen());
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: mainColor,
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      "proceed_check_out".tr,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Text(snapshot.value["total_price"].toString()),

  Widget getSizeText(snapshot) {
    if (snapshot.value['sizes'] != null) {
      for (var size in snapshot.value['sizes'] ?? '') {
        if (size["is_need"] == true) {
          return Text(
            size["size"] ?? "",
            style: TextStyle(fontSize: 12.sp),
          );
        }
      }
    }
    return SizedBox();
  }

  Widget getGeneralAdditionsText(dynamic snapshot) {
    List generalAdds = [];
    if (snapshot.value['addsList'] != null) {
      for (var gAdds in snapshot.value['addsList'] ?? []) {
        if (gAdds["is_need"] == true) {
          generalAdds.add(gAdds["adds"]);
        }
      }
      return Text(
        generalAdds.toString().replaceAll("[", "").replaceAll("]", ""),
        style: TextStyle(fontSize: 12.sp),
      );
    }
    return SizedBox();
  }

  Widget getOther_additional(dynamic snapshot) {
    List generalAdds = [];
    if (snapshot.value['other_additional'] != null) {
      for (var gAdds in snapshot.value['other_additional'] ?? []) {
        // if (gAdds["is_need"] == true) {
        generalAdds.add(gAdds["name"]);
        // }
      }
      return Text(
        generalAdds.toString().replaceAll("[", "").replaceAll("]", ""),
        style: TextStyle(fontSize: 12.sp, color: Colors.black),
      );
    }
    return SizedBox();
  }

  Widget getGeneralContentText(dynamic snapshot) {
    List<Widget> contentAds = [];
    if (snapshot.value['components'] != null) {
      for (var gAdds in snapshot.value['components'] ?? []) {
        // if (gAdds["need"] == true) {
        contentAds.add(Text(
          gAdds["name"],
          style: TextStyle(fontSize: 12.sp),
        ));
        contentAds.add(Text(" ,"));
        // }
      }
      return Container(
        width: 170.w,
        child: Wrap(
          children: contentAds,
        ),
      ) /*Text(
          contentAds.toString().replaceAll("[", "").replaceAll("]", ""),style: TextStyle(fontSize: 12.sp),)*/
      ;
    }
    return SizedBox();
  }

  Widget getAddDrinkText(dynamic snapshot) {
    List drinkAds = [];
    if (snapshot.value['list_of_drinks'] != null) {
      for (var gAdds in snapshot.value['list_of_drinks'] ?? []) {
        if (gAdds["is_need"] == true) {
          drinkAds.add(gAdds["name"]);
        }
      }
      return Text(
        drinkAds.toString().replaceAll("[", "").replaceAll("]", ""),
        style: TextStyle(fontSize: 12.sp),
      );
    }
    return SizedBox();
  }
}

class CartIngrediantRow extends StatelessWidget {
  Widget? widget;
  String? textKey;

  CartIngrediantRow({Key? key, this.textKey, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget!,
          SizedBox(
            width: 1,
          ),
          Text(
            ': $textKey',
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}