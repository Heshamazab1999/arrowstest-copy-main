class DeliveryAreaModel{
  String? area;
  String? id;
  String? price;

  DeliveryAreaModel({
    this.price,
    this.area,
    this.id,
});
  DeliveryAreaModel.fromJson(Map<dynamic,dynamic> json){
    this.id = json['id'];
    this.area = json['area'];
    this.price = json['price'];
  }


  Map<String , dynamic> toJson(){
    Map<String , dynamic> data = {};
    data['id'] = this.id ;
    data['area'] = this.area;
    data['price'] = this.price;

    return data;
  }
}