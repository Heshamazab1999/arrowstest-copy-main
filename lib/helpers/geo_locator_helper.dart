import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorHelper {
  static String address = "";
  static getAddressFromLatLong(Position position) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placeMark);
    Placemark place = placeMark[0];
    address =
        '${place.name} , ${place.street} , ${place.administrativeArea} ,${place.subAdministrativeArea},${place.country}';
    print(address);
  }

  static Future<Position> determinePosition() async {
    // await Geolocator.openLocationSettings();

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
