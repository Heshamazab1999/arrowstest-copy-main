class RestaurantFeesResponse {
  Fees? fee;
  String? msg;
  bool? status;

  RestaurantFeesResponse({required this.fee, this.msg, this.status});

  RestaurantFeesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      fee = new Fees.fromJson(json['data']);
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fee != null) {
      data['data'] = this.fee!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Fees {
  int? id;
  String? tax;
  String? deliveryValue;
  String? feesValue;
  String? restaurantName;
  String? restaurantId;
  String? createdAt;
  String? updatedAt;

  Fees(
      {this.id,
      this.tax,
      this.deliveryValue,
      this.feesValue,
      this.restaurantName,
      this.restaurantId,
      this.createdAt,
      this.updatedAt});

  Fees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tax = json['tax'];
    deliveryValue = json['delivery_value'];
    feesValue = json['fees_value'];
    restaurantName = json['restaurant_name'];
    restaurantId = json['restaurant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tax'] = this.tax;
    data['delivery_value'] = this.deliveryValue;
    data['fees_value'] = this.feesValue;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_id'] = this.restaurantId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
