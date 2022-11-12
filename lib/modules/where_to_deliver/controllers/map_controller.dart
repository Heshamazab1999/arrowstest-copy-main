import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
 import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../helpers/shared_prefrences.dart';

class MapController extends GetxController {
  static LatLng SOURCE_LOCATION = LatLng(30.020375934687184, 31.23328954878036);
  static LatLng DEST_LOCATION = LatLng(29.986658032558353, 31.231931181107207);
  static double CAMERA_ZOOM = 18;
  static double CAMERA_TILT = 80;
  static double CAMERA_BEARING = 30;
  static double PIN_VISIBLE_POSITION = 20;
  static double PIN_INVISIBLE_POSITION = -300;
  static double SEARCH_VISIBLE_POSITION = 20;
  static double SEARCH_INVISIBLE_POSITION = -300;
  Placemark address = Placemark();
  String? subLocality;
  String? street;
  String? name;
  String? locality;
  String? administrativeArea;
  static LatLng? initialPosition;
  Completer<GoogleMapController> controller = Completer();
   CameraPosition initialCameraPOstion = CameraPosition(
    target: LatLng(
        double.parse(
            CacheHelper.getDataToSharedPrefrence('restaurantBranchLat')),
        double.parse(
            CacheHelper.getDataToSharedPrefrence('restaurantBranchLng'))),
    zoom: CAMERA_ZOOM,
    bearing: CAMERA_BEARING,
    tilt: CAMERA_TILT,
  );
  LatLng? destinationLocation;
  final markers =<Marker> [];
  // Set<Marker> markers = Set<Marker>();
final myMarkerId=1;
   LatLng? currentLocation = LatLng(0.0, 0.0);

  Future<void> onInit() async {
    markers.add(
      Marker(markerId: MarkerId(myMarkerId.toString()), position: currentLocation!),
    );
    address.street;
    getCurrentLocation();
    showPinsOnMap(currentLocation!);
    getUserLocation(currentLocation);
    this.showPinsOnMap(currentLocation!);
    }

  @override
  void onClose() {
    markers[myMarkerId] = Marker(markerId: MarkerId(myMarkerId.toString()), visible: false);

    markers.remove(currentLocation);
    showPinsOnMap(currentLocation!);
    getUserLocation(currentLocation);
    markers.clear();
    controller;
    currentLocation;
    address;

    super.onClose();
  }

  @override
  void dispose() {
    markers[myMarkerId] = Marker(markerId: MarkerId(myMarkerId.toString()), visible: false);

    markers.clear();
    // markers.removeAt(myMarkerId);
    showPinsOnMap(currentLocation!);
    getUserLocation(currentLocation);
    controller;
    currentLocation;
    address;

    super.dispose();
  }

  Completer<GoogleMapController> _controller = Completer();

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((currLocation) {
      currentLocation = LatLng(currLocation.latitude, currLocation.longitude);

      getUserLocation(LatLng(currLocation.latitude, currLocation.longitude));
      // getUserLocation(LatLng(currentLocation!.latitude, currLocation.longitude));
      // showPinsOnMap(LatLng(currentLocation!.latitude, currLocation.longitude));
      showPinsOnMap(LatLng(currLocation.latitude, currLocation.longitude));
      initialPosition = LatLng(currLocation.latitude, currLocation.longitude);

      // getAddressFromLatLng(currentLocation);
      print(currLocation.longitude);
      // pickupPosition=currentLocation;
      update();
    });
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: currentLocation!,
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
      ),
    ));
    update();
  }

  onCameraMove(CameraPosition position) {
    currentLocation = position.target;
    update();
  }

  // getAddressFromLatLng(currentLocation) async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       currentLocation.latitude,
  //       currentLocation.longitude,
  //     );
  //
  //     Placemark place = placemarks[0];
  //     address.country!=place.country;
  //     subLocality=place.subLocality;
  //     street=place.street;
  //     name=place.name;
  //     locality=place.locality;
  //     administrativeArea=place.administrativeArea;
  //     print('$address'+'$currentLocation');
  //     // searchInputTextEditing.text=placemarks[0].name!;
  //
  //      update();
  //     } catch (e) {
  //     print(e);
  //   }
  // }

  showPinsOnMap(currentLocation) {
    try {
      markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          infoWindow: InfoWindow(title: locality, snippet: "Pick Up Locaation"),
          onTap: () {
            getUserLocation(currentLocation);
            print(currentLocation!.latitude);
            update();
          }));
      getUserLocation(currentLocation);
      update();
    } catch (e) {
      printError(info: '############no#########');
    }
  }

  getUserLocation(currentPostion) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPostion.latitude, currentPostion.longitude);
      address = placemarks[0];
      print('%%%%%%%%%$address');
    } catch (e) {
      print(e);
    }
  }
}
