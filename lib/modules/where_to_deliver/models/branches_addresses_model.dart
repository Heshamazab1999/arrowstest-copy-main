class BranchesAddresses {
  late List<Branch> branches;
  String? msg;
  bool? status;

  BranchesAddresses({required this.branches, this.msg, this.status});

  BranchesAddresses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      branches = <Branch>[];
      json['data'].forEach((v) {
        branches.add(new Branch.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.branches != null) {
      data['data'] = this.branches.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? lat;
  String? lng;
  String? restaurantName;
  String? restaurantId;
  String? address;
  String? createdAt;
  String? updatedAt;

  Branch(
      {this.id,
      this.name,
      this.lat,
      this.lng,
      this.restaurantName,
      this.restaurantId,
      this.address,
      this.createdAt,
      this.updatedAt});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
    restaurantName = json['restaurant_name'];
    restaurantId = json['restaurant_id'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_id'] = this.restaurantId;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
