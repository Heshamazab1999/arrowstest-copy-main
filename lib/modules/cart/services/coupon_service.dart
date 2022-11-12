import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/cart/services/coupon_body.dart';
import 'package:dio/dio.dart';

class CouponService
{
  static Future<Response?> getDiscount(CouponBody discountBody) async
  {
    Response? response;
    try{
      response = await DioHelper.postData(url: endpoint[Endpoint.getDiscount],query:discountBody.toJson(),);
    }on DioError catch(e)
    {
      print(e.response);
    }
    return response;
  }
}