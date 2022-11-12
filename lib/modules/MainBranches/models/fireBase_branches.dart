class FireBaseBranchesModel {
  String? dataBase;
  String? name_en;
  String? name_ar;
  String? address_ar;
  String? address_en;
  String? id;
  bool? available;
  String? lat;
  String? lng;

  FireBaseBranchesModel({
    required this.name_en,
    required this.name_ar,
    required this.dataBase,
    required this.available,
    required this.id,
    required this.address_ar,
    required this.address_en,
    required this.lat,
    required this.lng,
  });

  FireBaseBranchesModel.fromJson(Map<dynamic, dynamic> json) {
    dataBase = json['database'];
    available = json['available'];
    name_en = json['name_en'];
    name_ar = json['name_ar'];
    id = json['id'];
    address_ar = json['address_ar'];
    address_en = json['address_en'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<dynamic, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['dataBase'] = dataBase;
    data['name_en'] = name_en;
    data['available'] = available;
    data['name_ar'] = name_ar;
    data['name_en'] = name_en;
    data['id'] = id;
    data['address_ar'] = address_ar;
    data['address_en'] = address_en;
    data['lat'] = lat;
    data['lng'] = lng;

    return data;
  }
}
