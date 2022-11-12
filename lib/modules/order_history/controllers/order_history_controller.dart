import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  var dbRef;
  RxBool hide = true.obs;



  // Future<void> geHistoryData() async {
  //
  //   DatabaseReference referenceData = FirebaseDatabase.instance
  //       .reference()
  //       .child("Cart")
  //       .child(CacheHelper.loginShared!.phone.toString());
  //
  //   referenceData.once().then((DataSnapshot snapshot) async {
  //     if (snapshot.exists) {
  //       hide.value = false;
  //     }
  //     else
  //       {
  //         hide.value = true;
  //       }
  //   });
  //       }

    Future<void> geHistoryData() async {
      dbRef = FirebaseDatabase.instance
          .reference()
          .child("User_Orders")
          // .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
          // .child(CacheHelper.loginShared!.phone.toString());
          .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
          .child(CacheHelper.getDataToSharedPrefrence('userID'));

      DatabaseReference referenceData = FirebaseDatabase.instance
          .reference()
          .child("User_Orders")
          .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
          // .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchName'))
          .child(CacheHelper.getDataToSharedPrefrence('userID'));
          // .child(CacheHelper.loginShared!.phone.toString());

      referenceData.once().then((DataSnapshot snapshot) async {
        if (snapshot.exists) {
          hide.value = false;
          var keys = snapshot.value.keys;
          var values = snapshot.value;


          final json = snapshot.value as Map<dynamic, dynamic>;
          // Product message = Product.fromJson(json);
          // cartItemList.add(message);
          for (var key in keys) {
            print(key);
            var cartData = await FirebaseDatabase.instance
                .reference()
                .child("User_Orders")
                .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
                .child(CacheHelper.getDataToSharedPrefrence('userID'))
                // .child(CacheHelper.loginShared!.phone.toString())
                .get()
                .then((value) {
              if (value.exists) {
                // hide.value = true;
              } else {
                // hide.value = false;
              }
              return Map<String, dynamic>.from(value.value);
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

  @override
  void onInit() {
    // if (CacheHelper.loginShared != null) {
    //   dbRef = FirebaseDatabase.instance
    //       .reference()
    //       .child("User_Orders")
    //       .child(CacheHelper.loginShared!.phone.toString());
    // }
    super.onInit();
  }
}
