class HomeAds {
  List<Ads>? data;
  String? msg;
  bool? status;

  HomeAds({this.data, this.msg, this.status});

  HomeAds.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Ads>[];
      json['data'].forEach((v) {
        data!.add(new Ads.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Ads {
  int? id;
  String? restaurantId;
  String? ads;
  String? restaurantName;
  String? createdAt;
  String? updatedAt;

  Ads(
      {this.id,
      this.restaurantId,
      this.ads,
      this.restaurantName,
      this.createdAt,
      this.updatedAt});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    ads = json['ads'];
    restaurantName = json['restaurant_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['ads'] = this.ads;
    data['restaurant_name'] = this.restaurantName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
