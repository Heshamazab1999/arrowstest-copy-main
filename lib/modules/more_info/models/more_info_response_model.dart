class MoreInfoResponse {
  Info? data;
  String? msg;
  bool? status;

  MoreInfoResponse({this.data, this.msg, this.status});

  MoreInfoResponse.fromJson(Map<String, dynamic> json) {
    data = Info.fromJson(json['data']);
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data!.toJson();
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Info {
  int? id;
  String? phone1;
  String? phone2;
  String? phone3;
  String? facebook;
  String? twitter;
  String? instagram;
  String? snapchat;
  String? website;
  String? restaurantName;
  String? restaurantId;
  String? tiktok;
  String? youtube;
  String? createdAt;
  String? updatedAt;

  Info(
      {this.id,
      this.phone1,
      this.phone2,
      this.phone3,
      this.facebook,
      this.twitter,
      this.instagram,
      this.snapchat,
      this.website,
      this.restaurantName,
      this.restaurantId,
      this.tiktok,
      this.youtube,
      this.createdAt,
      this.updatedAt});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone1 = json['phone_1'];
    phone2 = json['phone_2'];
    phone3 = json['phone_3'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    snapchat = json['snapchat'];
    website = json['website'];
    restaurantName = json['restaurant_name'];
    restaurantId = json['restaurant_id'];
    tiktok = json['tiktok'];
    youtube = json['youtube'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_1'] = this.phone1;
    data['phone_2'] = this.phone2;
    data['phone_3'] = this.phone3;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['snapchat'] = this.snapchat;
    data['website'] = this.website;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_id'] = this.restaurantId;
    data['tiktok'] = this.tiktok;
    data['youtube'] = this.youtube;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
