import 'package:arrows/modules/where_to_deliver/models/firebase_address_model.dart';

class UserModel {
  String? name;
  String? phone;
  String? password;
  late List<UserAddress> userAddress;

  UserModel({this.name, this.phone, this.password, required this.userAddress});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    if (json['user_address'] != null) {
      userAddress = <UserAddress>[];
      json['user_address'].forEach((v) {
        userAddress.add(new UserAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    if (this.userAddress != null) {
      data['user_address'] = this.userAddress.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
