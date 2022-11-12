import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/where_to_deliver/models/branches_addresses_model.dart';
import 'package:dio/dio.dart';

class BranchesAddressesService {
  static Future<BranchesAddresses?> getBranchesAddresses() async {
    Response? response;
    try {
      response =
          await DioHelper.getData(url: endpoint[Endpoint.getBranchesAddresses]);
      print(BranchesAddresses.fromJson(response.data));
      return BranchesAddresses.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
