import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/cart/models/resteurant_fees_response_model.dart';
import 'package:dio/dio.dart';

class CartService {
  static Future<RestaurantFeesResponse?> getRestaurantFees() async {
    Response? response;
    try {
      response =
          await DioHelper.getData(url: endpoint[Endpoint.getRestaurantFees]);
      print(response);
      return RestaurantFeesResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
