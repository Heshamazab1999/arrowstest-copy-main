import 'dart:convert';
/// data : {"id":107,"name":"برجر","components":[{"id":1,"name":"برجر"},{"id":2,"name":"خبز"}],"sizes":[{"id":1,"price":"25","size":"صغير"},{"id":2,"price":"50","size":"وسط"},{"id":3,"price":"100","size":"كبير"}],"additional":[{"addition":"جبن","id":1,"price":"15"}],"sauces":[{"id":1,"name":"كاتشب"},{"id":2,"name":"مايونيز"},{"id":3,"name":"ثاوزند آيلاند"},{"id":4,"name":"مسطردة"},{"id":5,"name":"مسطردة بالعسل"}],"drinks":[{"id":1,"name":"كولا"},{"id":2,"name":"سيفن اب"},{"id":3,"name":"ميراندا"}],"spices":[{"id":1,"name":"حار"},{"id":2,"name":"عادي"}],"availability":1,"photo":"https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/02b6862e-3e14-44e2-bf2b-a7efa76b87cb_1664368370.jpg","category_id":13,"category":{"id":13,"name":"اكل غربي","photo":"https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/cropped6970335221665492048_1666370087.jpg"}}
/// msg : "product returned successfully"
/// status : true

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));
String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());
class ProductDetailsModel {
  ProductDetailsModel({
      Product? data,
      String? msg,
      bool? status,}){
    _data = data;
    _msg = msg;
    _status = status;
}

  ProductDetailsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Product.fromJson(json['data']) : null;
    _msg = json['msg'];
    _status = json['status'];
  }
  Product? _data;
  String? _msg;
  bool? _status;
ProductDetailsModel copyWith({  Product? data,
  String? msg,
  bool? status,
}) => ProductDetailsModel(  data: data ?? _data,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  Product? get data => _data;
  String? get msg => _msg;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}

/// id : 107
/// name : "برجر"
/// components : [{"id":1,"name":"برجر"},{"id":2,"name":"خبز"}]
/// sizes : [{"id":1,"price":"25","size":"صغير"},{"id":2,"price":"50","size":"وسط"},{"id":3,"price":"100","size":"كبير"}]
/// additional : [{"addition":"جبن","id":1,"price":"15"}]
/// sauces : [{"id":1,"name":"كاتشب"},{"id":2,"name":"مايونيز"},{"id":3,"name":"ثاوزند آيلاند"},{"id":4,"name":"مسطردة"},{"id":5,"name":"مسطردة بالعسل"}]
/// drinks : [{"id":1,"name":"كولا"},{"id":2,"name":"سيفن اب"},{"id":3,"name":"ميراندا"}]
/// spices : [{"id":1,"name":"حار"},{"id":2,"name":"عادي"}]
/// availability : 1
/// photo : "https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/02b6862e-3e14-44e2-bf2b-a7efa76b87cb_1664368370.jpg"
/// category_id : 13
/// category : {"id":13,"name":"اكل غربي","photo":"https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/cropped6970335221665492048_1666370087.jpg"}

Product dataFromJson(String str) => Product.fromJson(json.decode(str));
String dataToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      int? id,
      String? name,
      List<Components>? components,
      List<Sizes>? sizes,
      List<Additional>? additional,
     String? quantity,
    List<Sauces>? sauces,
      List<Drinks>? drinks,
      List<Spices>? spices,
      int? availability,
      String? photo,
      int? categoryId,

      Category? category,}){
    _id = id;
    _name = name;
    _components = components;
    _sizes = sizes;
    _additional = additional;
    _sauces = sauces;
    _drinks = drinks;
    _spices = spices;
    _availability = availability;
    _photo = photo;
    _categoryId = categoryId;
    quantity = quantity;
    _category = category;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _quantity = json['quantity'];
    if (json['components'] != null) {
      _components = [];
      json['components'].forEach((v) {
        _components?.add(Components.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      _sizes = [];
      json['sizes'].forEach((v) {
        _sizes?.add(Sizes.fromJson(v));
      });
    }
    if (json['additional'] != null) {
      _additional = [];
      json['additional'].forEach((v) {
        _additional?.add(Additional.fromJson(v));
      });
    }
    if (json['sauces'] != null) {
      _sauces = [];
      json['sauces'].forEach((v) {
        _sauces?.add(Sauces.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      _drinks = [];
      json['drinks'].forEach((v) {
        _drinks?.add(Drinks.fromJson(v));
      });
    }
    if (json['spices'] != null) {
      _spices = [];
      json['spices'].forEach((v) {
        _spices?.add(Spices.fromJson(v));
      });
    }
    _availability = json['availability'];
    _photo = json['photo'];
    _categoryId = json['category_id'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  int? _id;
  String? _name;
  String? _quantity;
  List<Components>? _components;
  List<Sizes>? _sizes;
  List<Additional>? _additional;
  List<Sauces>? _sauces;
  List<Drinks>? _drinks;
  List<Spices>? _spices;
  int? _availability;
  String? _photo;
  int? _categoryId;
  Category? _category;
Product copyWith({  int? id,
  String? name,
  String? quantity,
  List<Components>? components,
  List<Sizes>? sizes,
  List<Additional>? additional,
  List<Sauces>? sauces,
  List<Drinks>? drinks,
  List<Spices>? spices,
  int? availability,
  String? photo,
  int? categoryId,
  Category? category,
}) => Product(  id: id ?? _id,
  name: name ?? _name,
  components: components ?? _components,
  sizes: sizes ?? _sizes,
  additional: additional ?? _additional,
  sauces: sauces ?? _sauces,
  drinks: drinks ?? _drinks,
  spices: spices ?? _spices,
  quantity: quantity ?? _quantity,
  availability: availability ?? _availability,
  photo: photo ?? _photo,
  categoryId: categoryId ?? _categoryId,
  category: category ?? _category,
);
  int? get id => _id;
  String? get name => _name;
  String? get quantity => _quantity;
  List<Components>? get components => _components;
  List<Sizes>? get sizes => _sizes;
  List<Additional>? get additional => _additional;
  List<Sauces>? get sauces => _sauces;
  List<Drinks>? get drinks => _drinks;
  List<Spices>? get spices => _spices;
  int? get availability => _availability;
  String? get photo => _photo;
  int? get categoryId => _categoryId;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['quantity'] = _quantity;
    if (_components != null) {
      map['components'] = _components?.map((v) => v.toJson()).toList();
    }
    if (_sizes != null) {
      map['sizes'] = _sizes?.map((v) => v.toJson()).toList();
    }
    if (_additional != null) {
      map['additional'] = _additional?.map((v) => v.toJson()).toList();
    }
    if (_sauces != null) {
      map['sauces'] = _sauces?.map((v) => v.toJson()).toList();
    }
    if (_drinks != null) {
      map['drinks'] = _drinks?.map((v) => v.toJson()).toList();
    }
    if (_spices != null) {
      map['spices'] = _spices?.map((v) => v.toJson()).toList();
    }
    map['availability'] = _availability;
    map['photo'] = _photo;
    map['category_id'] = _categoryId;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

/// id : 13
/// name : "اكل غربي"
/// photo : "https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/cropped6970335221665492048_1666370087.jpg"

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
      int? id,
      String? name,
      String? photo,}){
    _id = id;
    _name = name;
    _photo = photo;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _photo = json['photo'];
  }
  int? _id;
  String? _name;
  String? _photo;
Category copyWith({  int? id,
  String? name,
  String? photo,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  photo: photo ?? _photo,
);
  int? get id => _id;
  String? get name => _name;
  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['photo'] = _photo;
    return map;
  }

}

/// id : 1
/// name : "حار"

Spices spicesFromJson(String str) => Spices.fromJson(json.decode(str));
String spicesToJson(Spices data) => json.encode(data.toJson());
class Spices {
  Spices({
      int? id,
      String? name,}){
    _id = id;
    _name = name;
}

  Spices.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
Spices copyWith({  int? id,
  String? name,
}) => Spices(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// id : 1
/// name : "كولا"

Drinks drinksFromJson(String str) => Drinks.fromJson(json.decode(str));
String drinksToJson(Drinks data) => json.encode(data.toJson());
class Drinks {
  Drinks({
      int? id,
      String? name,}){
    _id = id;
    _name = name;
}

  Drinks.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
Drinks copyWith({  int? id,
  String? name,
}) => Drinks(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// id : 1
/// name : "كاتشب"

Sauces saucesFromJson(String str) => Sauces.fromJson(json.decode(str));
String saucesToJson(Sauces data) => json.encode(data.toJson());
class Sauces {
  Sauces({
      int? id,
      String? name,}){
    _id = id;
    _name = name;
}

  Sauces.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
Sauces copyWith({  int? id,
  String? name,
}) => Sauces(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// addition : "جبن"
/// id : 1
/// price : "15"

Additional additionalFromJson(String str) => Additional.fromJson(json.decode(str));
String additionalToJson(Additional data) => json.encode(data.toJson());
class Additional {
  Additional({
      String? addition,
      int? id,
      String? price,}){
    _addition = addition;
    _id = id;
    _price = price;
}

  Additional.fromJson(dynamic json) {
    _addition = json['addition'];
    _id = json['id'];
    _price = json['price'];
  }
  String? _addition;
  int? _id;
  String? _price;
Additional copyWith({  String? addition,
  int? id,
  String? price,
}) => Additional(  addition: addition ?? _addition,
  id: id ?? _id,
  price: price ?? _price,
);
  String? get addition => _addition;
  int? get id => _id;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addition'] = _addition;
    map['id'] = _id;
    map['price'] = _price;
    return map;
  }

}

/// id : 1
/// price : "25"
/// size : "صغير"

Sizes sizesFromJson(String str) => Sizes.fromJson(json.decode(str));
String sizesToJson(Sizes data) => json.encode(data.toJson());
class Sizes {
  Sizes({
      int? id,
      String? price,
      String? size,}){
    _id = id;
    _price = price;
    _size = size;
}

  Sizes.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _size = json['size'];
  }
  int? _id;
  String? _price;
  String? _size;
Sizes copyWith({  int? id,
  String? price,
  String? size,
}) => Sizes(  id: id ?? _id,
  price: price ?? _price,
  size: size ?? _size,
);
  int? get id => _id;
  String? get price => _price;
  String? get size => _size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['size'] = _size;
    return map;
  }

}

/// id : 1
/// name : "برجر"

Components componentsFromJson(String str) => Components.fromJson(json.decode(str));
String componentsToJson(Components data) => json.encode(data.toJson());
class Components {
  Components({
      int? id,
      String? name,}){
    _id = id;
    _name = name;
}

  Components.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
Components copyWith({  int? id,
  String? name,
}) => Components(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}