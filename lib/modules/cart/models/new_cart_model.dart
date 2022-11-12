import 'package:arrows/modules/product_details/models/drinks_model.dart';
import 'package:arrows/modules/sub_categories/models/SubCategories.dart';
import 'package:flutter/material.dart';






class NewCartModel2 {
  int? id;
  String? photo;
  String? name;
  String? price;
  String? quantity;
  String? total_price;
  List<Drink>?  other_additional;
  String? drinks;
  String? spices;
  List<Components>? components;
  List<Sauces>? sauces;
  List <Additional> ?additional;
  String? sizes;
  String? categoryId;
  NewCartModel2(
      {this.id,
        this.photo,
        this.name,
        this.price,
        this.additional,
        this.components,
        this.sauces,
        this.quantity,
        this.sizes,
        this.drinks,
        this.spices,
        this.total_price,
        this.other_additional,
        this.categoryId, List<Components>? comp

      });

  NewCartModel2.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    price = json['price'];
    additional = json['additional'];
    components = json['components'];
    sauces = json['sauces'];
    quantity = json['quantity'];
    sizes = json['sizes'];
    drinks = json['drinks'];
    total_price = json['total_price'];
    spices = json['spices'];
    categoryId = json['categoryId'];
    other_additional = json['other_additional'];


   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['photo'] = this.photo;
      data['quantity'] = this.quantity;
    data['sizes'] = this.sizes;
    data['drinks'] = this.drinks;
    data['total_price'] = this.total_price;
    data['categoryId'] = this.categoryId;
    data['spices'] = this.spices;

    if (this.components != null) {
      data['components'] = this.components!.map((v) => v.toJson()).toList();
    }
    // if (spices != null) {
    //   data['spices'] = this.spices!.map((v) => v.toJson()).toList();
    // }
    if (additional != null) {
      data['additional'] = additional!.map((v) => v.toJson()).toList();
    }
    if (sauces != null) {
      data['sauces'] = sauces!.map((v) => v.toJson()).toList();
    }
    if (other_additional != null) {
      data['other_additional'] = other_additional?.map((v) => v.toJson()).toList();
    }







    return data;
  }
}






// class NewCartModel {
//   String? name;
//   String? id;
//   String? quantity;
//   String? total_price;
//   List<Drink>?  other_additional;
//   String? drinks;
//   String? spices;
//   List<Components>? components;
//   List<Sauces>? sauces;
//   List <Additional> ?additional;
//   String? sizes;
//   String? photo;
//   String? price;
//   String? categoryId;
//
//   NewCartModel(
//       {this.name,
//       this.id,
//       this.total_price,
//       this.components,
//       this.other_additional,
//       this.spices,
//       this.categoryId,
//       this.sauces,
//       this.drinks,
//         this.additional,
//       this.photo,
//       this.price,
//       this.quantity,
//       this.sizes});
//   Map<dynamic,dynamic>  toMap(){
//     Map map=Map<dynamic,dynamic>();
//     map['name']=name;
//     map['id']=id;
//     map['sizes']=sizes;
//     map['drinks']=drinks;
//     map['quantity']=quantity;
//     map['spices']=spices;
//     map['additional']=additional;
//     map['price']=price;
//     map['total_price']=total_price;
//     map['categoryId']=categoryId;
//     map['components']=components;
//     map['sauces']=sauces;
//     map['photo']=photo;
//     map['other_additional']=other_additional;
//
//     return map;
//   }
//
//   NewCartModel.fromMap(Map <dynamic ,dynamic >map){
//     name=map['name'];
//     name=map['name'];
//     categoryId=map['categoryId'];
//     components =map['components'];
//     photo =map['photo'];
//     total_price =map['total_price'];
//     spices =map['spices'];
//     quantity =map['quantity'];
//     additional =map['additional'];
//     drinks =map['drinks'];
//     sauces =map['sauces'];
//     price =map['price'];
//     sizes =map['sizes'];
//     id =map['id'];
//     other_additional =map['other_additional'];
//    }
// }

