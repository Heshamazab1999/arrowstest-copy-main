import 'package:arrows/modules/where_to_deliver/models/firebase_address_model.dart';

class User {
  String? name;
  String? phone;
  String? password;
  String ?id;
  String ?points;
  String? userDeviceToken;
  List<UserAddress>? address;

  User({this.name, this.phone, this.password, this.address,this.userDeviceToken,this.id,this.points});

  User.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    points = json['points'];
    id = json['id'];
    password = json['password'];
    userDeviceToken = json['device_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['points'] = this.points;
    data['id'] = this.id;
    data['device_token'] = this.userDeviceToken;
    if (this.address != null) {
      data['user_address_list'] = this.address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
