import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/main_category/models/main_categories_model.dart';
import 'package:dio/dio.dart';

class MainCategoriesService {
  static Future<MainCategories?> getMainCategories() async {
    try {
      Response? response = await DioHelper.getData(
          url: endpoint[Endpoint.getMainCategories]);
      print(response.data);
      return MainCategories.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
