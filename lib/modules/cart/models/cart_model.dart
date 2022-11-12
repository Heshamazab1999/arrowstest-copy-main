import 'package:arrows/modules/sub_categories/models/firebase_product_model.dart';

import '../../product_details2/model/ProductDetailsModel.dart';

class Cart {
  List<Product>? listOfProduct;

  Cart({this.listOfProduct});

  Cart.fromJson(Map<dynamic, dynamic> json) {
    if (json['list_of_product'] != null) {
      listOfProduct = <Product>[];
      json['list_of_product'].forEach((v) {
        listOfProduct!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listOfProduct != null) {
      data['list_of_product'] =
          this.listOfProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
