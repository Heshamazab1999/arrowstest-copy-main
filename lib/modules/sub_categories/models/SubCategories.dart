/// data : [{"id":107,"name":"Burger","components":[{"id":1,"name":"Burger"},{"id":2,"name":"Bread"}],"sizes":[{"id":1,"price":"25","size":"Small"},{"id":2,"price":"50","size":"Medium"},{"id":3,"price":"100","size":"Larg"}],"additional":[{"addition":"Cheese","id":1,"price":"15"}],"sauces":[{"id":1,"name":"Ketchup"},{"id":2,"name":"Mayonnaise"},{"id":3,"name":"Thousand Island"},{"id":4,"name":"Mustard"},{"id":5,"name":"Honey Mustard"}],"drinks":[{"id":1,"name":"Cola"},{"id":2,"name":"SevenUp"},{"id":3,"name":"Miranda"}],"spices":[{"id":1,"name":"Hot"},{"id":2,"name":"Regular"}],"availability":1,"photo":"https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/02b6862e-3e14-44e2-bf2b-a7efa76b87cb_1664368370.jpg","category_id":13},{"id":108,"name":"Burger","components":[{"id":1,"name":"Burger"},{"id":2,"name":"Bread"}],"sizes":[{"id":1,"price":"25","size":"Small"},{"id":2,"price":"50","size":"Medium"},{"id":3,"price":"100","size":"Larg"}],"additional":[{"addition":"Cheder Chesse","id":1,"price":"20"}],"sauces":[],"drinks":[],"spices":[],"availability":0,"photo":"https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/02b6862e-3e14-44e2-bf2b-a7efa76b87cb_1664368370.jpg","category_id":13},{"id":109,"name":"Burger","components":[{"id":1,"name":"Burger"},{"id":2,"name":"Bread"}],"sizes":[{"id":1,"size":"Small","price":"25"},{"id":2,"size":"Medium","price":"50"},{"id":3,"size":"Larg","price":"100"}],"additional":[{"id":1,"addition":"Cheder Chesse","price":"20"}],"sauces":null,"drinks":null,"spices":null,"availability":1,"photo":"https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/02b6862e-3e14-44e2-bf2b-a7efa76b87cb_1664368370.jpg","category_id":13},{"id":110,"name":"Burger","components":[{"id":1,"name":"Burger"},{"id":2,"name":"Bread"}],"sizes":[{"id":1,"price":"25","size":"Small"},{"id":2,"price":"50","size":"Medium"},{"id":3,"price":"100","size":"Larg"}],"additional":[],"sauces":[],"drinks":[],"spices":[],"availability":1,"photo":"https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/02b6862e-3e14-44e2-bf2b-a7efa76b87cb_1664368370.jpg","category_id":13}]
/// msg : "Category products returned successfully"
/// nextPage : 1
/// status : true

class SubCategories {
  SubCategories({
      List<Products>? data,
      String? msg, 
      num? nextPage, 
      bool? status,}){
    _data = data;
    _msg = msg;
    _nextPage = nextPage;
    _status = status;
}

  SubCategories.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Products.fromJson(v));
      });
    }
    _msg = json['msg'];
    _nextPage = json['nextPage'];
    _status = json['status'];
  }
  List<Products>? _data;
  String? _msg;
  num? _nextPage;
  bool? _status;
SubCategories copyWith({  List<Products>? data,
  String? msg,
  num? nextPage,
  bool? status,
}) => SubCategories(  data: data ?? _data,
  msg: msg ?? _msg,
  nextPage: nextPage ?? _nextPage,
  status: status ?? _status,
);
  List<Products>? get data => _data;
  String? get msg => _msg;
  num? get nextPage => _nextPage;
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['msg'] = _msg;
    map['nextPage'] = _nextPage;
    map['status'] = _status;
    return map;
  }

}

/// id : 107
/// name : "Burger"
/// components : [{"id":1,"name":"Burger"},{"id":2,"name":"Bread"}]
/// sizes : [{"id":1,"price":"25","size":"Small"},{"id":2,"price":"50","size":"Medium"},{"id":3,"price":"100","size":"Larg"}]
/// additional : [{"addition":"Cheese","id":1,"price":"15"}]
/// sauces : [{"id":1,"name":"Ketchup"},{"id":2,"name":"Mayonnaise"},{"id":3,"name":"Thousand Island"},{"id":4,"name":"Mustard"},{"id":5,"name":"Honey Mustard"}]
/// drinks : [{"id":1,"name":"Cola"},{"id":2,"name":"SevenUp"},{"id":3,"name":"Miranda"}]
/// spices : [{"id":1,"name":"Hot"},{"id":2,"name":"Regular"}]
/// availability : 1
/// photo : "https://restulocales.arrowscars.com/storage/imgs/y7b42yskv43l_restu_locales/02b6862e-3e14-44e2-bf2b-a7efa76b87cb_1664368370.jpg"
/// category_id : 13

class Products {

  Products({
      num? id, 
      String? name, 
      List<Components>? components, 
      List<Sizes>?  sizes,
      List<Additional>? additional, 
      List<Sauces>? sauces,
      String? totalPrice,
      String? quantity,
      List<Drinks>? drinks,
      List<Spices>? spices, 
      num? availability, 
      String? photo,
      String? fIdd,
this.componentss,
       num? categoryId,}){
    _id = id;
    _name = name;
    _components = components;
    _sizes = sizes;
    _additional = additional;
    _sauces = sauces;
    _drinks = drinks;
    _totalPrice = totalPrice;
    _spices = spices;
    _quantity = quantity;
    _availability = availability;
    _photo = photo;
    _categoryId = categoryId;

  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    componentss = json['componentss'];
    _name = json['name'];
    _quantity = json['quantity'];
    _fId = json['fId'];
    _totalPrice = json['totalPrice'];
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
  }
  num? _id;
  String? _name;
  List<Components>? _components;
  List<Sizes>? _sizes;
  List<Additional>? _additional;
  List<Sauces>? _sauces;
  String? _totalPrice;
  List<Drinks>? _drinks;
  List<Spices>? _spices;
  num? _availability;
  List<Components>?   componentss;

  String? _photo;
  String? _fId;
  String? _quantity;
  num? _categoryId;
 Products copyWith({  num? id,
  String? name,
  List<Components>? components,
  List<Sizes>? sizes,
  List<Additional>? additional,
  List<Sauces>? sauces,
  List<Drinks>? drinks,
   String? totalPrice,
   String? quantity,

   List<Spices>? spices,
  num? availability,
  String? photo,
  num? categoryId,
}) => Products(  id: id ?? _id,
  name: name ?? _name,
  components: components ?? _components,
  sizes: sizes ?? _sizes,
  additional: additional ?? _additional,
  sauces: sauces ?? _sauces,
  drinks: drinks ?? _drinks,
  totalPrice : totalPrice ?? _totalPrice,
  spices: spices ?? _spices,
  availability: availability ?? _availability,
  photo: photo ?? _photo,
   quantity: quantity ?? _quantity,
  categoryId: categoryId ?? _categoryId,
);
  num? get id => _id;
  String? get name => _name;
  String? get fId => _fId;
  List<Components>? get components => _components;
  List<Sizes>? get sizes => _sizes;
  List<Additional>? get additional => _additional;
  List<Sauces>? get sauces => _sauces;
  List<Drinks>? get drinks => _drinks;

  List<Spices>? get spices => _spices;
  num? get availability => _availability;
  String? get photo => _photo;
  String? get totalPrice   => _totalPrice;
  String? get quantity   => _quantity;
  num? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['totalPrice'] = _totalPrice;
    map['name'] = _name;
    map['quantity'] = _quantity;
    if (_components != null) {
      map['components'] = _components?.map((v) => v.toJson()).toList();
    }


    if (this.componentss != null) {
      map['componentss'] = this.componentss!.map((v) => v.toJson()).toList();
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
    return map;
  }

}

/// id : 1
/// name : "Hot"

class Spices {
  Spices({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Spices.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Spices copyWith({  num? id,
  String? name,
}) => Spices(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// id : 1
/// name : "Cola"

class Drinks {
  Drinks({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Drinks.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Drinks copyWith({  num? id,
  String? name,
}) => Drinks(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// id : 1
/// name : "Ketchup"vmmvb

class Sauces {
  Sauces({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Sauces.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Sauces copyWith({  num? id,
  String? name,
}) => Sauces(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// addition : "Cheese"
/// id : 1
/// price : "15"

class Additional {
  Additional({
      String? addition, 
      num? id, 
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
  num? _id;
  String? _price;
Additional copyWith({  String? addition,
  num? id,
  String? price,
}) => Additional(  addition: addition ?? _addition,
  id: id ?? _id,
  price: price ?? _price,
);
  String? get addition => _addition;
  num? get id => _id;
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
/// size : "Small"

class Sizes {
  Sizes({
      num? id, 
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
  num? _id;
  String? _price;
  String? _size;
Sizes copyWith({  num? id,
  String? price,
  String? size,
}) => Sizes(  id: id ?? _id,
  price: price ?? _price,
  size: size ?? _size,
);
  num? get id => _id;
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
/// name : "Burger"/&&&&&&&

class Components {
  Components({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Components.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Components copyWith({  num? id,
  String? name,
}) => Components(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}
// import 'package:arrows/modules/product_details/models/drinks_model.dart';
//
// import 'firebase_product_model.dart';
//
// class SubCategories {
//   int? id;
//   String? name;
//   String? photo;
//   String? restaurantId;
//   String? createdAt;
//   String? updatedAt;
//   List<Products>? products;
//
//   SubCategories(
//       {this.id,
//       this.name,
//       this.photo,
//       this.restaurantId,
//       this.createdAt,
//       this.updatedAt,
//       this.products});
//
//   SubCategories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     photo = json['photo'];
//     restaurantId = json['restaurant_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['photo'] = this.photo;
//     data['restaurant_id'] = this.restaurantId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Products {
//   int? id;
//   String? name;
//   String? number;
//   String? image;
//   List<String>? components;
//   List<Sizes>? sizes;
//   List<AddsList>? additional;
//   List<Drink>? drinks = [];
//   String? restaurantId;
//   String? restaurantName;
//   int? categoryId;
//   int? availability;
//   String? createdAt;
//   String? updatedAt;
//   String? totalPrice;
//   String? price;
//   String? fId;
//   List<Content>? content;
//   List<FireSizes>? fSizes;
//
//   Products(
//       {this.id,
//       this.name,
//       this.image,
//       this.components,
//       this.sizes,
//       this.additional,
//       this.restaurantId,
//       this.restaurantName,
//       this.availability,
//       this.categoryId,
//       this.createdAt,
//       this.updatedAt,
//       this.drinks,
//       this.number,
//       this.totalPrice,
//       this.content,
//       this.fId,
//       this.price});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['photo'];
//
//     if (json['components'][0] != null) {
//       components = json['components'].cast<String>();
//     } else {
//       components = [];
//     }
//
//     if (json['sizes'] != null) {
//       sizes = <Sizes>[];
//       json['sizes'].forEach((v) {
//         sizes!.add(new Sizes.fromJson(v));
//       });
//     }
//     if (json['additional'] != null) {
//       additional = <AddsList>[];
//       json['additional'].forEach((v) {
//         additional!.add(new AddsList.fromJson(v));
//       });
//     }
//
//     if (json['drinks'] != null) {
//       drinks = <Drink>[];
//       json['drinks'].forEach((v) {
//         drinks!.add(new Drink.fromJson(v));
//       });
//     }
//     availability = json['availability'];
//     restaurantId = json['restaurant_id'];
//     restaurantName = json['restaurant_name'];
//     categoryId = json['category_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.fId;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     if (this.sizes != null) {
//       data['sizes'] = this.fSizes!.map((v) => v.toJson()).toList();
//     }
//     if (this.additional != null) {
//       data['addsList'] = this.additional!.map((v) => v.toJson()).toList();
//     }
//     if (this.drinks != null) {
//       data['list_of_drinks'] = this.drinks!.map((v) => v.toJson()).toList();
//     }
//     data['availability'] = this.availability;
//     data['category_id'] = this.categoryId;
//     data['number'] = this.number;
//     data['total_price'] = this.totalPrice;
//     data['price'] = this.price;
//     if (this.content != null) {
//       data['content'] = this.content!.map((v) => v.toJson()).toList();
//     }
//
//     return data;
//   }
// }
//
// // class Sizes {
// //   String? size;
// //   String? price;
// //
// //   Sizes({this.size, this.price});
// //
// //   Sizes.fromJson(Map<String, dynamic> json) {
// //     size = json['size'];
// //     price = json['price'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['size'] = this.size;
// //     data['price'] = this.price;
// //     return data;
// //   }
// // }
//
// class FireSizes {
//   String? size;
//   String? price;
//   bool? isNeed;
//
//   FireSizes({this.size, this.price, this.isNeed});
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['size'] = this.size;
//     data['price'] = this.price;
//     data['is_need'] = this.isNeed;
//     return data;
//   }
// }
//
// class Additional {
//   String? addition;
//   String? price;
//   bool? isNeed;
//
//   Additional({this.addition, this.price, this.isNeed});
//
//   Additional.fromJson(Map<String, dynamic> json) {
//     addition = json['addition'];
//     price = json['price'];
//     price = json['price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['adds'] = this.addition;
//     data['price'] = this.price;
//     data['is_need'] = this.isNeed;
//     return data;
//   }
// }
