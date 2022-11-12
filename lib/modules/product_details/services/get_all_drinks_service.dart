import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/product_details/models/drinks_model.dart';
import 'package:dio/dio.dart';

class AllDrinksService {
  static Future<AllDrinksResponse?> getAllDrinks() async {
    Response allDrinksResponse;
    try {
      allDrinksResponse =
          await DioHelper.getData(url: endpoint[Endpoint.getAllDrinks]);

      print(AllDrinksResponse.fromJson(allDrinksResponse.data));
      return (AllDrinksResponse.fromJson(allDrinksResponse.data));
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
