import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/payment/payment_models/paymentTokenBody.dart';
import 'package:dio/dio.dart';

class PaymentTokenService{

  static Future<String> getPaymentToken(PaymentTokenBody paymentTokenBody) async {

    Response? response;
    try{
      response = await DioHelper.dio!.post("https://accept.paymob.com/api/acceptance/payment_keys",data: paymentTokenBody.toJson());
    }on DioError catch(e)
    {
print(e.response);
    }
    return response!.data!['token'];
  }

}