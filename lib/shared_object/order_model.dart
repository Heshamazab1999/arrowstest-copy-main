import 'package:arrows/modules/sign_up/models/user_model.dart';
import 'package:arrows/modules/sub_categories/models/firebase_product_model.dart';
import 'package:arrows/modules/where_to_deliver/models/firebase_address_model.dart';

import '../modules/product_details2/model/ProductDetailsModel.dart';

class Order {
  List<Product>? listOfProduct;
  // List<Product>? listOfProduct;
  String? price;
  String? discount;
  String? delivery;
  String? tax;
  String? extra;
  String? totalPrice;
  String? branch;
  String? orderStatus;
  String? message;
  String? orderId;
  UserAddress? address;
  User? client;
  String? selectedArea;
  String? referenceId;

  Order(
      {this.listOfProduct,
      this.price,
      this.discount,
      this.delivery,
      this.tax,
      this.extra,
      this.totalPrice,
      this.branch,
      this.orderStatus,
      this.message,
      this.orderId,
      this.address,
      this.client,
      this.selectedArea,
        this.referenceId
      });

  Order.fromJson(Map<dynamic, dynamic> json) {
    if (json['list_of_product'] != null) {
      listOfProduct = <Product>[];
      json['list_of_product'].forEach((v) {
        listOfProduct!.add(new Product.fromJson(v));
      });
    }
    price = json['price'];
    discount = json['discount'];
    delivery = json['delivery'];
    tax = json['tax'];
    extra = json['extra'];
    totalPrice = json['total_price'];
    branch = json['branch'];
    orderStatus = json['order_status'];
    message = json['message'];
    referenceId = json['reference_id'];
    orderId = json['order_id'];
    address = json['address'] != null
        ? new UserAddress.fromJson(json['address'])
        : null;
    client = json['client'] != null ? new User.fromJson(json['client']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listOfProduct != null) {
      data['list_of_product'] =
          this.listOfProduct!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['delivery'] = this.delivery;
    data['tax'] = this.tax;
    data['extra'] = this.extra;
    data['total_price'] = this.totalPrice;
    data['reference_id'] = this.referenceId;
    data['branch'] = this.branch;
    data['order_status'] = this.orderStatus;
    data['message'] = this.message;
    data['order_id'] = this.orderId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}
