import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/home/models/home_response_body.dart';
import 'package:dio/dio.dart';

class HomeServices {
  static Future<HomeAds?> getHomeAds() async {
    Response? response;
    try {
      response = await DioHelper.getData(url: endpoint[Endpoint.getHomeAds]);
      return HomeAds.fromJson(response.data);
    } on DioError catch (e) {
      print("----------------");
      print("error : ${e.message}");
    }
  }
}
