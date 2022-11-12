import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/bottom_nav_bar/screens/bottom_nav_bar_screen.dart';
import 'package:arrows/modules/cart/controllers/cart_controller.dart';
import 'package:arrows/modules/cart/models/copoun_response_model.dart';
import 'package:arrows/modules/where_to_deliver/models/branches_addresses_model.dart';
import 'package:arrows/modules/where_to_deliver/models/delivery_area_model.dart';
import 'package:arrows/modules/where_to_deliver/models/firebase_address_model.dart';
import 'package:arrows/modules/where_to_deliver/services/branches_addresses_service.dart';
import 'package:arrows/shared_object/posted_order.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class WhereToController extends GetxController {
  RxBool showPickUpBranches = true.obs;
  Branch? branchDropDownValue;
  List<Branch> branches = <Branch>[Branch(name: "اختار الفرع")].obs;
  List<UserAddress> addresses = <UserAddress>[].obs;
  UserAddress selectedUserAddress = UserAddress();
  RxBool toggleButtons = true.obs;
  RxString radioValue = "".obs;
  RxString selectTypeRadioButton = "".obs;
  var selectedAddressRadioButton;
  var dbref;
  RxInt selectedPaymentType=(-1).obs;
  String? paymentReferenceId;


  //Text field controllers
  TextEditingController areaNumber = TextEditingController();
  TextEditingController buildNumber = TextEditingController();
  TextEditingController floorNumber = TextEditingController();
  TextEditingController landscape = TextEditingController();
  TextEditingController addressTextController = TextEditingController();

  CartController cartController = Get.find();


  @override
  void dispose() {
    selectedDropDownValue;
  }

  @override
  void onClose() {
    selectedDropDownValue;
  }

  Future<void> getAllBranchAddresses() async {
    BranchesAddresses? response;
    try {
      response = await BranchesAddressesService.getBranchesAddresses();
    } catch (e) {
      print(e);
    }
    branches.addAll(response!.branches);
  }
/******i commented it maybe it's causing the issue*******/
  Future<void> getAllUserAddressees() async{
    dbref = FirebaseDatabase.instance
        .reference()
        .child("Users")
        // .child(CacheHelper.loginShared!.phone.toString())
    // .child("user_address_list");

        .child(CacheHelper.getDataToSharedPrefrence('userID') )
        // .child("DeliveryList");
        .child("user_address_list");
  }
  /******i commented it maybe it's cousing the issue*******/

  // Future<void> getAllUserAddressees() async{
  //   dbref = FirebaseDatabase.instance
  //       .reference()
  //       .child("DeliveryList")
  //       // child('branch1')
  //       // .child('-NCAoy4evO1S9m0g8hvh')
  //   .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
  //       // .child(CacheHelper.loginShared!.phone.toString())
  //   // .child("user_address_list");
  //
  //       // .child(CacheHelper.getDataToSharedPrefrence('userID') )
  //       .child("area");
  // }
  String selectedAreaPrice = '';





  RxList<DeliveryAreaModel>? deliveryAreaList = [
    DeliveryAreaModel(id: '0', area: 'neighbourhood'.tr  , price: '0'),].obs;
  DeliveryAreaModel? selectedDropDownValue;
  Future<void> getDeliveryList()async{
    // deliveryAreaList!.clear();
    var ref =  await FirebaseDatabase.instance.reference().child('DeliveryList')
    // .child('branch1')
    // .child('-NCAoy4evO1S9m0g8hvh')
        .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'));
    ref.once().then((DataSnapshot snapshot){
      print(snapshot.value);
      print(snapshot.key);
      snapshot.value.forEach((key,values) {
        // final json = snapShot.value as Map<dynamic, dynamic>;
        DeliveryAreaModel dv=DeliveryAreaModel.fromJson(values);
        deliveryAreaList!.add(dv);
        print(values);
      });
    });
    /*****************&&&&&********************************/
    // await FirebaseDatabase.instance.reference().child('DeliveryList')
    //     // .child('branch1')
    //     // .child('-NCAoy4evO1S9m0g8hvh')
    //     .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID')).child('-NCAp4o9WkKhm-Q04tWE')
    //
    //     .get().then((snapShot){
    //   // Map <dynamic, dynamic> values = snapShot.value;
    //   final json = snapShot.value as Map<dynamic, dynamic>;
    //   DeliveryAreaModel dv=DeliveryAreaModel.fromJson(json);
    //   deliveryAreaList!.add(dv);
    //   // snapShot.value.forEach((key,  value){
    //   //   deliveryAreaList!.add(DeliveryAreaModel.fromJson(value));
    //   //   print(deliveryAreaList);
    //   // });
    // });
    selectedDropDownValue = deliveryAreaList![0];
  }


  Future<void> addOrderToFirebase()
  async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String dateID = dateFormat.format(DateTime.now());
    PostedOrder.order
      ..branch = branches[1].name
      ..price = cartController.totalPrice.toString()
      ..totalPrice = (cartController.totalPrice.value +
          (showPickUpBranches.value ==
              false
              ? (double.parse(
              selectedAreaPrice
              .toString()))
              : 0.0) +
          (cartController.totalPrice.value *
              (cartController.fees.value!.feesValue !=
                  'null'
                  ? (double.parse(cartController
                  .fees.value!.feesValue
                  .toString()) /
                  100)
                  : 0.0)) -
          cartController.discountValue.value)
          .toStringAsFixed(2)
      ..delivery = selectedAreaPrice
      ..discount = cartController.discountValue.value.toString()
      ..extra = (cartController.fees.value!.feesValue !=
          'null' ||
          cartController.fees.value!.feesValue != null)
          ? cartController.fees.value!.feesValue
          : '0.0'
      ..orderId = dateID
      ..orderStatus = "تم أرسال طلبك"
      ..client = CacheHelper.loginShared
      ..tax = (cartController.fees.value!.tax != 'null' ||
          cartController.fees.value!.tax != null)
          ? cartController.fees.value!.tax
          : '0.0'
      ..listOfProduct = cartController.cartItemList
      ..referenceId = paymentReferenceId ??"cash"
      ..message = cartController.messageTextController.text;

    FirebaseDatabase.instance
        .reference()
        .child("UserOrders")
        .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
        // .child(CacheHelper.loginShared!.phone.toString())
        .child(CacheHelper.getDataToSharedPrefrence('userID') )
        .child(dateID)
        .set(PostedOrder.order.toJson());

    FirebaseDatabase.instance
        .reference()
        .child("Orders")
        .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
        .child(dateID)
        .set(PostedOrder.order.toJson());

    FirebaseDatabase.instance
        .reference()
        .child("Cart")
    .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
        .child(CacheHelper.loginShared!.phone.toString())
        .child(CacheHelper.getDataToSharedPrefrence('userID') )
        .set(null);

    cartController.cartItemList.clear();
    cartController.cartItemList2.clear();
    cartController.sendNotification();
    cartController.discountValue.value = 0.0;
    cartController.discountResponse = CouponResponse();
    cartController.discountCodeTextController.clear();
    Get.offAll(() => BottomNavBarScreen());
  }

  @override
  Future<void> onInit() async {
    // await GeoLocatorHelper.determinePosition();
    await getAllBranchAddresses();
    await getDeliveryList();
    await getAllUserAddressees();
    branchDropDownValue = branches[1];
    // PostedOrder.order.address = Address

    super.onInit();
  }

}
