import 'package:arrows/modules/product_details/models/drinks_model.dart';
import 'package:arrows/modules/product_details/services/get_all_drinks_service.dart';
import 'package:arrows/modules/sub_categories/controllers/sub_categories_controller.dart';
import 'package:get/get.dart';

import '../../product_details2/model/ProductDetailsModel.dart' as productDetails;
import '../../sub_categories/models/SubCategories.dart';

class ProductDetailsController extends GetxController {
  final SubCategoriesController subCategoriesController = Get.find();
  final otherAddition = <bool>[].obs;
  final suaces = <bool>[].obs;
  final component = <bool>[].obs;
  final addition = <bool>[].obs;

  RxInt orderCounter = 1.obs;
  List<Drink>? drinks = <Drink>[].obs;
  Drink? drinkDropDownValue;

  RxDouble productPrice = 0.0.obs;
  RxDouble orderPrice = 0.0.obs;
  Drink selectedDrink = Drink();
  Sizes selectedSize = Sizes();
var value ;
   List<bool> selectedAdditions = <bool>[].obs;
  List<bool> selectedComponents = <bool>[].obs;

   final priceList = <String>[].obs;

  List<Products> products = <Products>[].obs;
  var addressesBox;
  var cartBox;
  String dropDownValue = '';
  List<productDetails.ProductDetailsModel> productDetailsModel = <productDetails.ProductDetailsModel>[].obs;
  bool? typeValue;


  // void onClose() {
  //   // sumTotal();
  //  }

  // increaseOrderCounter(int limit) {
  //   if (orderCounter.value < limit) orderCounter.value++;
  //   // orderPrice.value = productPrice.value * orderCounter.value;
  // }
  //
  // decreaseOrderCounter() {
  //   if (orderCounter.value > 1) {
  //     orderCounter.value--;
  //     // orderPrice.value -= productPrice.value;
  //   }
  // }
  //
  //
  // increaseQuantity() {
  //   orderCounter++;
  //   // totalPrice.value = totalPrice * orderCounter.toInt();
  //   orderPrice.value = productPrice.value * orderCounter.value;
  //   print(orderCounter);
  //    update();
  // }

  // decreaseQuantity() {
  //   if (orderCounter.value > 1) {
  //     orderCounter--;
  //     print(orderCounter);
  //   } else {
  //     print('error to minus the quantity');
  //   }
  //   totalPrice.value -= totalPrice * orderCounter.toInt();
  //   print(orderCounter);
  //   print(totalPrice);
  //   update();
  // }

  Future<void> getAllRestaurantDrinks() async {
    AllDrinksResponse? response;
    try {
      response = await AllDrinksService.getAllDrinks();
    } catch (e) {
      print(e);
    }
    drinks!.addAll(response!.drinks);
    print(response.drinks);
  }

  @override
  Future<void> onInit() async {

    // fSizes.clear();
    await getAllRestaurantDrinks();
    otherAddition.value = List.filled(drinks!.length, false);
    super.onInit();
  }


  @override
  void dispose() {
    super.dispose();
   }

  selectType(newValue) {
    typeValue = newValue;
    update();
  }

  updatePriceList(String price) {
    priceList.add(price);
    print(priceList);
  }

  // double sumTotal() {
  //   priceList.forEach((element) {
  //     orderPrice.value += double.parse(element);
  //   });
  //   print(orderPrice.value);
  //   return orderPrice.value;
  // }

}
