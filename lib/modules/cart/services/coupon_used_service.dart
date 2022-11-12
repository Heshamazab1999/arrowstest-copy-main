import 'package:arrows/api_base/api_endpoints.dart';
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/cart/services/coupon_used_body.dart';
import 'package:dio/dio.dart';

class CouponUsedService{

  static Future<Response?>registerCouponUsed(CouponUsedBody couponUsedBody)async{

    Response? response;
    response = await DioHelper.postData(url: endpoint[Endpoint.getCouponUsed] , query: couponUsedBody.toJson());
    print(response.data);
    return response;
  }
}