import 'package:arrows/modules/sign_up/models/firebase_user_model.dart';
import 'package:arrows/modules/sub_categories/models/firebase_product_model.dart';
import 'package:arrows/modules/where_to_deliver/models/firebase_address_model.dart';

import '../modules/product_details2/model/ProductDetailsModel.dart';

class Order {
  late List<Product> _list_of_product;
  late String _price,
      _discount,
      _delivery,
      _tax,
      _extra,
      _total_price,
      _branch,
      _order_status,
      _order_id;
  late UserAddress _address;
  late UserModel _client;

  Order(
      this._list_of_product,
      this._price,
      this._discount,
      this._delivery,
      this._tax,
      this._extra,
      this._total_price,
      this._branch,
      this._order_status,
      this._order_id,
      this._address,
      this._client);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this._price;
    data['discount'] = this._discount;
    data['delivery'] = this._delivery;
    data['tax'] = this._tax;
    data['extra'] = this._extra;
    data['total_price'] = this._total_price;
    data['branch'] = this._branch;
    data['order_status'] = this._order_status;
    data['order_id'] = this._order_id;
    data['address'] = this._address;
    data['client'] = this._client;

    if (this._list_of_product != null) {
      data['list_of_product'] =
          this._list_of_product.map((v) => v.toJson()).toList();
    }
    return data;
  }

  UserModel get client => _client;

  set client(UserModel value) {
    _client = value;
  }

  UserAddress get address => _address;

  set address(UserAddress value) {
    _address = value;
  }

  get order_id => _order_id;

  set order_id(value) {
    _order_id = value;
  }

  get order_status => _order_status;

  set order_status(value) {
    _order_status = value;
  }

  get branch => _branch;

  set branch(value) {
    _branch = value;
  }

  get total_price => _total_price;

  set total_price(value) {
    _total_price = value;
  }

  get extra => _extra;

  set extra(value) {
    _extra = value;
  }

  get tax => _tax;

  set tax(value) {
    _tax = value;
  }

  get delivery => _delivery;

  set delivery(value) {
    _delivery = value;
  }

  get discount => _discount;

  set discount(value) {
    _discount = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  List<Product> get list_of_product => _list_of_product;

  set list_of_product(List<Product> value) {
    _list_of_product = value;
  }
}
