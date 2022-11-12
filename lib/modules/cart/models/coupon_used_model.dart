class CouponUsedModel{
  int? data;
  String? msg;
  bool? status;

  CouponUsedModel({this.data , this.msg , this.status});

  CouponUsedModel.fromJson(Map<String , dynamic> json){
    this.data = json['data'];
    this.msg = json['msg'];
    this.status = json['status'];
  }

  Map<String , dynamic> toJson(){
    Map<String , dynamic> data = {};
    data['data'] = this.data;
    data['msg'] = this.msg;
    data['status'] = this.status;

    return data;
  }
}