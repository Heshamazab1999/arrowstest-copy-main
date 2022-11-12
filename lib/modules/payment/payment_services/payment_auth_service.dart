
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/payment/payment_models/auth_body.dart';
import 'package:dio/dio.dart';

class PaymentAuthService
{
  static Future<String> AuthenticatePayment(AuthBody apiKey)
  async {
      Response? response;
      try
          {
            response = await DioHelper.dio!.post("https://accept.paymob.com/api/auth/tokens",data:apiKey.toJson() );
          }on DioError catch(e)
      {
        print(e.response);
      }
      return response!.data!['token'];
  }
}