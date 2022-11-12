class AvailabilityModel {
  Data? data;
  String? msg;
  bool? status;

  AvailabilityModel({this.data, this.msg, this.status});

  AvailabilityModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? availability;

  Data({this.availability});

  Data.fromJson(Map<String, dynamic> json) {
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availability'] = this.availability;
    return data;
  }
}