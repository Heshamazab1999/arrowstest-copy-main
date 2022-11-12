import 'dart:convert';

import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/cart/models/copoun_response_model.dart';
import 'package:arrows/modules/cart/models/new_cart_model.dart';
import 'package:arrows/modules/cart/models/resteurant_fees_response_model.dart';
import 'package:arrows/modules/cart/services/cart_service.dart';
import 'package:arrows/modules/cart/services/coupon_body.dart';
import 'package:arrows/modules/cart/services/coupon_service.dart';
import 'package:arrows/modules/sub_categories/models/firebase_product_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart'as dio;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../product_details2/model/ProductDetailsModel.dart';
import '../../sub_categories/models/SubCategories.dart';



class CartController extends GetxController {
  var quantity = 1.obs;
  int cartIndex = 0;
  RxDouble totalPrice = 222345678.0.obs;
  Rx<Fees?> fees = Fees().obs;
  var dbRef;
  List<NewCartModel2> cartItemList2 = <NewCartModel2>[];
   List<Product> cartItemList = <Product>[];
  List<NewCartModel2> cartList = <NewCartModel2>[];
   RxBool hide = true.obs;
  RxBool isPercentage = false.obs;
  CouponResponse discountResponse = CouponResponse();
  Rx<double> discountValue = 0.0.obs;

  TextEditingController messageTextController = TextEditingController();
  TextEditingController discountCodeTextController = TextEditingController();

  // RxInt itemCounter = 0.obs;

  Future<void> getDiscount() async
  {
    CouponBody discountBody = CouponBody(discountCode: discountCodeTextController.text ,
        phoneNumber: CacheHelper.getDataToSharedPrefrence('userID'));
        // phoneNumber: CacheHelper.loginShared!.mphone);
    dio.Response? response;
    try
    {
      response = await CouponService.getDiscount(discountBody);
      if(jsonDecode(response!.data)['data'] == 0)
        {
          // Get.back();
          Get.defaultDialog(content: Text('${jsonDecode(response.data)['msg']}'),title: "خطا");

        }
      else{
        // Get.back();
        print('response.data${response.data}');
        discountResponse = CouponResponse.fromJson(jsonDecode(response.data));
        // Get.back();
      }
    }
    catch(e)
    {
      print(e);
    }
  }

  Future<void> getRestaurantFees() async {
    RestaurantFeesResponse? restaurantFeesResponse;
    try {
      restaurantFeesResponse = await CartService.getRestaurantFees();
    } catch (e) {
      print(e);
    }
    fees.value = restaurantFeesResponse!.fee;
  }

  // Future getCartData() async {
  //   dbRef = FirebaseDatabase.instance
  //       .reference()
  //       .child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
  //       .child(CacheHelper.getDataToSharedPrefrence('userID') );
  //
  //   dbRef.once().then((    snapshot) async {
  //     if (snapshot.exists) {
  //       hide.value = false;
  //       var keys = snapshot.value.keys;
  //        final json = snapshot.value as Map<dynamic, dynamic>;
  //       NewCartModel message = NewCartModel.fromMap(json);
  //        cartList.add(message);
  //       for (var key in keys) {
  //         print(key);
  //         var cartData = await FirebaseDatabase.instance
  //             .reference()
  //             .child("Cart") .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
  //             // .child(CacheHelper.loginShared!.phone.toString())
  //            .child(CacheHelper.getDataToSharedPrefrence('userID') )
  //             .get()
  //             .then((value) {
  //           if (value.exists)  {
  //             print(value);
  //             // final cartToList= value.value.map(( newCartModel) => newCartModel.value).toList();
  //             //  value.value.forEach((element) {
  //             //    cartList.add(NewCartModel.fromMap(element));
  //             // });
  //             // print(cartList);
  //
  //             // print('(((((((((((((((((((object)))))))))))))))))))');
  //             //  cartList.add(NewCartModel.fromMap(value.value));
  //             // print('yarab${cartList[0].name}');
  //             // hide.value = true;
  //           } else {
  //             // hide.value = false;
  //           }
  //            // value.forEach(
  //           //       (key, value) {
  //           //     finalData= NewCartModel.fromMap(value);
  //           //   },
  //           // );
  //
  //             // return Map<String, dynamic>.from(value.value);
  //           return cartList.add(NewCartModel.fromMap(value.value));
  //         });
  //
  //         // print(cartData);
  //         // print(cartList);
  //         // final cartToList= cartData.entries.map(( newCartModel) => newCartModel.value).toList();
  //         //  cartToList.forEach((element) {
  //         //    cartList.add(NewCartModel.fromMap(element));
  //         // });
  //         print('(((((((((((((((((${cartList.length})))))))))))))))))');
  //
  //
  //
  //       }
  //     }
  //     else{
  //       hide.value = true;
  //     }
  //   });
  // }



  Future<void> getCartData() async {
    dbRef = FirebaseDatabase.instance
        .reference()
        .child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
        .child(CacheHelper.getDataToSharedPrefrence('userID') );


    DatabaseReference referenceData = FirebaseDatabase.instance
        .reference()
        .child("Cart") .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
        .child(CacheHelper.getDataToSharedPrefrence('userID') );

    referenceData.once().then((DataSnapshot snapshot) async {
      if (snapshot.exists) {
        hide.value = false;
        var keys = snapshot.value.keys;
        var values = snapshot.value;


        final json = snapshot.value as Map<dynamic, dynamic>;
        NewCartModel2   message = NewCartModel2.fromJson(json);
        cartItemList2.add(message);
        for (var key in keys) {
          print(key);
          var cartData = await FirebaseDatabase.instance
              .reference()
              .child("Cart")
              .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
              .child(CacheHelper.getDataToSharedPrefrence('userID') )
              // .child(CacheHelper.loginShared!.phone.toString())
              // .child(key)
               .get()
              .then((value) {
            if (value.exists) {
              // hide.value = true;
            } else {
              // hide.value = false;
            }
            return Map<dynamic, dynamic>.from(value.value);
          });
          print(cartData);
          // cartItemList.add(Product.fromJson(cartData));


        }
      }
      else{
        hide.value = true;
      }
    });
  }
  Future<void> sendNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String dashboardToken = await FirebaseDatabase.instance
        .reference()
        .child("Dashboard_Token")
        .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
    // .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
        .child("Token")
        .get().then((value){
      return value.value;
    });
    print(dashboardToken);
    final data = {
      "notification": {"body": "لديك طلب جديد", "title": "Arrows Dashboard"},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done"
      },
      "to": "$dashboardToken"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=AAAA98WHE5Q:APA91bHf3aO87IIOIm3PnK4pzt5rVLLcpa_McOsUnJ6-xl35R_34WvFw3PwTXVLKOBrfXjeRDUg5RGqQPYz4kHR62fDAT666XOPA_aWOAPt7JfDappkHprPVdJ5qUcEBcjqHYOfJ-OYD'
    };

    BaseOptions options = new BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );

    final response = await Dio(options).post('https://fcm.googleapis.com/fcm/send',
        data: data);

  }

  @override
  Future<void> onInit() async {
    await getRestaurantFees();
    totalPrice.value;
     // getCartData();
   print('_______________________________________________________________-${cartItemList2.length}');
   print('_______________________________________________________________-${cartList.length}');
    super.onInit();
  }
  increaseQuantity(quantity1,String id)async{

    var x= await FirebaseDatabase.instance
        .reference()
        .child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
        .child(CacheHelper.getDataToSharedPrefrence('userID') )
       .once().then((DataSnapshot snapshot) async {
    //${snapshot.value['quantity']}
     quantity.value=quantity1;
     quantity.value ++;

     print(quantity.value);
     var keys = snapshot.value.keys;
     print(quantity.value);
    for(var i in keys){
      print(i);
      Map< String , dynamic> quantityUpadte={'quantity' :6};
      await FirebaseDatabase.instance
          .reference()
          .child("Cart").child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
          .child(CacheHelper.getDataToSharedPrefrence('userID') )
          .child('2022-11-03 16:21:18').child("quantity").set(quantity.value);

     }quantity.value ++;
    update();
  }
  );

}
}
