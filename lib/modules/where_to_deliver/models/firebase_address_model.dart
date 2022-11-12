import 'package:arrows/modules/where_to_deliver/models/delivery_area_model.dart';
import 'package:firebase_database/firebase_database.dart';

class UserAddress {
  String? address;
  String? lat;
  String? lng;
  String? buildNumber;
  String? floorNumber;
  String? landmark;
  String? areaNumber;
  bool? checked;
  DeliveryAreaModel? area;

  UserAddress(
      {this.address,
      this.lat,
      this.lng,
      this.buildNumber = '',
        this.areaNumber = '',
      this.floorNumber = '',
      this.landmark = '',
      this.checked,this.area});

  UserAddress.fromJson(Map<dynamic, dynamic> snapshot) {

     Map<dynamic, dynamic> json = snapshot.values as  Map<dynamic, dynamic> ;

    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    buildNumber = json['build_number'];
    floorNumber = json['floor_number'];
    landmark = json['landmark'];
    areaNumber = json['area_number'];
    checked = json['checked'];
    area = json['user_area'] != null
        ? new DeliveryAreaModel.fromJson(json['user_area'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['build_number'] = this.buildNumber;
    data['floor_number'] = this.floorNumber;
    data['landmark'] = this.landmark;
    data['area_number'] = this.areaNumber;
    data['checked'] = this.checked;
    data['user_area'] = this.area;
    if (this.area != null) {
      data['user_area'] = this.area!.toJson();
    }

    return data;
  }
}
