class AllDrinksResponse {
  late List<Drink> drinks;
  String? msg;
  bool? status;

  AllDrinksResponse({required this.drinks, this.msg, this.status});

  AllDrinksResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      drinks = <Drink>[];
      json['data'].forEach((v) {
        drinks.add(new Drink.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
      data['data'] = this.drinks.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Drink {
  int? id;
  String? photo;
  String? name;
  String? price;
  String? restaurantName;
  String? restaurantId;
  String? createdAt;
  String? updatedAt;
  bool? isNeed;

  Drink(
      {this.id,
      this.photo,
      this.name,
      this.price,
      this.restaurantName,
      this.restaurantId,
      this.createdAt,
      this.updatedAt,
      this.isNeed});

  Drink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    price = json['price'];
    restaurantName = json['restaurant_name'];
    restaurantId = json['restaurant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['is_need'] = this.isNeed;
    return data;
  }
}
