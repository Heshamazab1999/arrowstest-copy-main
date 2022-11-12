import 'dart:async';

import 'package:arrows/modules/where_to_deliver/models/delivery_area_model.dart';
import 'package:arrows/modules/where_to_deliver/models/firebase_address_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  String location = "";
  List<UserAddress> addresses = <UserAddress>[];
  Completer<GoogleMapController> controller = Completer();



  @override
  Future<void> onInit() async {

    super.onInit();
  }
  @override
  void onClose() {
    addresses;
    super.onClose();
  }
  @override
  void dispose() {
    addresses;
    super.dispose();
  }
}
