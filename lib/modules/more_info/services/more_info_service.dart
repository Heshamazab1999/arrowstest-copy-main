import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/more_info/models/more_info_response_model.dart';
import 'package:dio/dio.dart';

class MoreInfoService {
  static Future<MoreInfoResponse?> getRestaurantMoreInfo() async {
    try {
      Response? response = await DioHelper.getData(
        url: endpoint[Endpoint.getRestaurantMoreInfo],
      );
      return MoreInfoResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }
}
