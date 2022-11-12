import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/main_category/controllers/main_categories_controller.dart';
import 'package:arrows/modules/sub_categories/models/SubCategories.dart';
import 'package:arrows/modules/sub_categories/services/sub_categories_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../helpers/shared_prefrences.dart';
import '../../cart/models/new_cart_model.dart';
import '../../product_details/models/drinks_model.dart';

class SubCategoriesController extends GetxController {
  int mainCategoryId = 0;
  late final String restaurantName;
  List<Products> products = <Products>[].obs;
  int page = 0;
  final isFirstLoadRunning = false.obs;
  final hasNextPage = true.obs;
  final isLoadMoreRunning = false.obs;
  final RefreshController refreshController = RefreshController();
  Sizes sizeDropDownValue=Sizes();
  final drinkRadioButtonSelectedValue = ''.obs;
  final typeRadioButtonSelectedValue = ''.obs;
  final valueGroupType = <int>[].obs;
  List <Sizes>  sizesList=[];
  List    <Drink> other_additional=[];
  SubCategories? subCategories;
   Future getSubCategories() async {
    isFirstLoadRunning.value = true;
    products.clear();
    subCategories =
        await SubCategoriesService.getSubCategories(mainCategoryId, page);
    products.assignAll(subCategories!.data!);
    isFirstLoadRunning.value = false;
  }

  loadMore() async {
    if (subCategories!.data!.isNotEmpty) {
      page++;
      subCategories =
          await SubCategoriesService.getSubCategories(mainCategoryId, page);
      products.addAll(subCategories!.data!);
      print("loading");
    } else {
      print("no subcategories");
    }
  }

  @override
  void dispose() {
    refreshController;
    totalPrice.value=0;
    orderCounter.value=1;
    listOfPComponents;
      isFirstLoadRunning ;
      hasNextPage ;
      isLoadMoreRunning  ;
      sizeDropDownValue=Sizes();
      drinkRadioButtonSelectedValue ;
      typeRadioButtonSelectedValue ;
      valueGroupType;
   sizesList;
  other_additional;
    subCategories;
    update();

  }
  void onClose() {
     totalPrice.value=0;
     orderCounter.value=1;
     orderPrice.value;
     refreshController;
       listOfPComponents;
     isFirstLoadRunning ;
     hasNextPage ;
     isLoadMoreRunning  ;
     sizeDropDownValue=Sizes();
     drinkRadioButtonSelectedValue ;
     typeRadioButtonSelectedValue ;
     valueGroupType;
     sizesList;
     other_additional;
     subCategories;
     update();

  }
  final value = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final MainCategoriesController mainCategoriesController =
        Get.put(MainCategoriesController());
    mainCategoryId = mainCategoriesController
            .categories[mainCategoriesController.index].id ?? 0;
    getSubCategories();

    // totalSum(value.value);
    // totalPrice.value = double.parse(products[index].sizes[0].price) * orderCounter.value;

    // print(double.parse(products.first.sizes!.first.price!));
  }

  // double totalSum(int index) {
  //   totalPrice.value = double.parse(products[index].sizes!.first.price!) * orderCounter.value;
  //
  //   print(totalPrice.value);
  //  return totalPrice.value;
  // }

//   selectSize(value,index) {
//     if(value == sizeDropDownValue){
//       print('the value is ${value.price} and the sizeDropDownValue is ${sizeDropDownValue.price}e');
//       return;
//     }else{
//       if(value.price >sizeDropDownValue.price){
//
//         totalPrice.value -=  double.parse(sizeDropDownValue.price !) * orderCounter.value;
// print(totalPrice.value);
//     }
//       sizeDropDownValue = value;
//       print('this is the selected size price${value.price}');
//       Sizes size = value as Sizes;
//       if(sizeDropDownValue != products[index].sizes![0].price){
//         num x= num.parse(sizeDropDownValue.price!);
//         num y= num.parse(products[index].sizes![0].price!);
//         if( x- y >0) { // اللي اخترته اكبر
//           num total =y-x;
//           totalPrice.value -=  total  * orderCounter.value;
//
//
//           print('the new value is ===>${totalPrice.value}');
//
//         }
//         print('so8nn');
//
//
//         print('*******************************${totalPrice.value}');
//
//       }
//       sizeDropDownValue = value;
//
//       update();
//     }
//     }

  // }

  selectDrinkRadioButton(var v) {
    drinkRadioButtonSelectedValue.value = v;
    print('this is the value of the drinks radio button selected $v');

    update();
  }

  selectTypeRadioButton(var v) {
    typeRadioButtonSelectedValue.value = v;
    print('this is the value of the types radio button selected $v');
    update();
  }

  /********addToCart****/

  final totalPrice = 0.0.obs;

  RxDouble productPrice = 0.0.obs;
  RxDouble orderPrice = 0.0.obs;
  final priceList = <String>[].obs;
  RxInt orderCounter = 1.obs;
  final listOfSouces = <Sauces >[].obs;
  // List<Sauces> listOfSouces= <Sauces> [];
  final listOfAdditional = <Drink>[];
  final listOfPublicAdditional = <Additional>[];
  List <Components>  listOfPComponents =[];
  // final listOfPComponents = '' ?? <Components>[];

  final listOfPSpices = <Spices>[];

  increaseOrderCounter(num limit,index) {
    if (orderCounter.value < 6) {
      orderCounter.value++;
      // orderPrice.value = productPrice.value * orderCounter.value;
      // totalPrice.value = double.parse(products[index].sizes!.first.price!) * orderCounter.value;
      totalPrice.value = productPrice.value * orderCounter.value;

      print(totalPrice.value);
    } else {
      Get.snackbar('sorry'.tr, 'there_is_no_sufficient_quantity'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: kPrimaryColor,
          duration: Duration(seconds: 2),
          dismissDirection: DismissDirection.startToEnd,
          barBlur: 10,
          colorText: mainColor);
    }
  }

  decreaseOrderCounter(index) {
     if (orderCounter.value >1) {
      orderCounter.value--;
      totalPrice.value -= productPrice.value;

      print(totalPrice.value);
    }
    else {
      Get.snackbar('sorry'.tr, 'you_can\'t_order_less_than_one'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: kPrimaryColor,
          duration: Duration(seconds: 2),
          dismissDirection: DismissDirection.startToEnd,
          barBlur: 10,
          colorText: mainColor);
    }
  }

  addToCart(index) async {
     DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String dateID = await dateFormat.format(DateTime.now());
     NewCartModel2 oneProduct = NewCartModel2();
    var x = CacheHelper.getDataToSharedPrefrence('selectedSize');
     CacheHelper.saveDataToSharedPrefrence('dateOfTheOrder',dateID);
    oneProduct = NewCartModel2(
      id: int.tryParse(products[index].id.toString()),
      additional: listOfPublicAdditional,
      drinks: listOfAdditional[0].name.toString(),
      name: products[index].name,
      components:products[index].components!,
      price: products[index].sizes![0].price,
      sizes:x, //,
      photo: products[index].photo,
      // spices:  , //.
      // spices: products[index].spices!.isNotEmpty ) && (products[index].spices )!=null)? listOfPSpices[0] : empty,
      sauces: listOfSouces.value,
      quantity:orderCounter.value.toString(),
      categoryId: products[index].categoryId.toString(),
       total_price: totalPrice.value.toString(),
      other_additional: other_additional,
    );

     CacheHelper.getDataToSharedPrefrence('userID') !=null ?  FirebaseDatabase.instance
        .reference()
        .child('Cart')
        .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
        .child(CacheHelper.getDataToSharedPrefrence('userID') )
        // .child(CacheHelper.loginShared!.phone.toString())
        .child(dateID)
        .set(oneProduct.toJson()).then((value) {
          return     Get.snackbar('Done', 'one item added successfully ',
              snackPosition: SnackPosition.TOP,
              backgroundColor: kPrimaryColor,
              duration: Duration(seconds: 2),
              dismissDirection: DismissDirection.startToEnd,
              barBlur: 10,
              colorText: mainColor);
    }):printError(info: '___________________');
     Get.back();
  }
  // addToCart(index) async {
  //
  //      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  //   String dateID = await dateFormat.format(DateTime.now());
  //   NewCartModel2 oneProduct = NewCartModel2();
  //     var x= CacheHelper.getDataToSharedPrefrence('selectedSize');
  //     await CacheHelper.saveDataToSharedPrefrence('dateID', dateID);
  //  Products pr =Products();
  //  pr.componentss=listOfPComponents;
  //
  //
  //
  //   FirebaseDatabase.instance
  //       .reference()
  //       .child('Cart')
  //       .child(CacheHelper.getDataToSharedPrefrence('restaurantBranchID'))
  //       .child(CacheHelper.getDataToSharedPrefrence('userID') )
  //       // .child(CacheHelper.loginShared!.phone.toString())
  //       .child(dateID)
  //       .set(pr.toJson()).then((value) {
  //         return  Get.snackbar('Done', 'one item added successfully ',
  //             snackPosition: SnackPosition.TOP,
  //             backgroundColor: kPrimaryColor,
  //             duration: Duration(seconds: 2),
  //             dismissDirection: DismissDirection.startToEnd,
  //             barBlur: 10,
  //             colorText: mainColor);
  //   });
  //   print('our product id ${products[index].id.toString()}');
  //     await CacheHelper.saveDataToSharedPrefrence('orderId', products[index].id.toString());
  // }

  validateOrder(index)  {
    try {
      if (products[index].spices!.isNotEmpty &&(products[index].spices )!=null) {

       if (typeRadioButtonSelectedValue.isEmpty) {
        Get.snackbar('Error', 'you should select a Type',
            snackPosition: SnackPosition.TOP,
            backgroundColor: kPrimaryColor,
            duration: Duration(seconds: 2),
            dismissDirection: DismissDirection.startToEnd,
            barBlur: 10,
            colorText: mainColor);
      }

      }
      else if (products[index].drinks!.isNotEmpty &&(products[index].drinks )!=null) {

        if (drinkRadioButtonSelectedValue.isEmpty) {
        Get.snackbar('Error', 'you should select a drink ',
            snackPosition: SnackPosition.TOP,
            backgroundColor: kPrimaryColor,
            duration: Duration(seconds: 2),
            dismissDirection: DismissDirection.startToEnd,
            barBlur: 10,
            colorText: mainColor);
      }
      }
      else if (products[index].sauces!.isNotEmpty &&(products[index].sauces )!=null) {
       if(listOfSouces.isEmpty) {
        Get.snackbar('Error', 'you should select a some sauces ',
            snackPosition: SnackPosition.TOP,
            backgroundColor: kPrimaryColor,
            duration: Duration(seconds: 2),
            dismissDirection: DismissDirection.startToEnd,
            barBlur: 10,
            colorText: mainColor);
      }
       else if (listOfSouces.length > 4) {
        Get.snackbar('Error', 'you should select only 4 Types',
            snackPosition: SnackPosition.TOP,
            backgroundColor: kPrimaryColor,
            duration: Duration(seconds: 2),
            dismissDirection: DismissDirection.startToEnd,
            barBlur: 10,
            colorText: mainColor);
      }
       // addToCart(index);
      }
      // else if(otherAddition.length>4){
      //   Get.snackbar('Error', 'you should select only 4 Types',
      //       snackPosition: SnackPosition.TOP,backgroundColor: kPrimaryColor,
      //       duration: Duration(seconds: 2),
      //       dismissDirection: DismissDirection.startToEnd,
      //       barBlur: 10,
      //       colorText: mainColor);
      // }
      addToCart(index);

    } catch (e) {
      print(e);
    }
  }

  addToSouces(bool value, Sauces item) {
    if (value == true) {
      listOfSouces.add(item);
    } else {
      listOfSouces.remove(item);
    }
  }

  addToDrinks(bool value, Drink item) {
    double price = 0.0;
    if (value == true) {
      listOfAdditional.add(item);
      totalPrice.value += num.parse(item.price!)*orderCounter.value;
      print(totalPrice.value);
      print('addToDrinks totalPrice.value');
      // listOfAdditional.forEach((element) {
      //   price += double.parse(element.price!);
      //   print(price);
      // });
    } else {
      listOfAdditional.remove(item);
      totalPrice.value -= num.parse(item.price!)*orderCounter.value;
      print(totalPrice.value);
      // listOfAdditional.forEach((element) {
      //   price += double.parse(element.price!);
      //   print(price);
      // });
    }
  }

  addToPublicAddition(bool value, Additional item) {
    if (value == true) {
      listOfPublicAdditional.add(item);
      totalPrice.value += num.parse(item.price!)*orderCounter.value;
      print(totalPrice.value);
      print('addToPublicAdditiontotalPrice.value');
    } else {
      listOfPublicAdditional.remove(item);
      totalPrice.value -= num.parse(item.price!)*orderCounter.value;
      print(totalPrice.value);

    }

  }

  addToComponents(bool value, Components item) {
    if (value == true) {
      listOfPComponents.add(item);
      // listOfPComponents.remove(item);
      print(listOfPComponents.first.name);
    } else {
      listOfPComponents.remove(item);
      print('*****listOfPComponents ${listOfPComponents.length}');
    }
  }

  ///Radio button///
  addToSpices(num id, Spices item) {
    if (id == item.id) {
      listOfPSpices.add(item);
     } else {
      listOfPSpices.remove(item);
      print(listOfPComponents.length);
    }
  }
  addToOtherAdditional(num id, Drink item) {
    if (id == item.id) {
      other_additional.add(item);
     } else {
      other_additional.remove(item);
      print(other_additional.length);
    }
  }

}
