
import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/payment/payment_models/orders_body.dart';
import 'package:arrows/modules/payment/payment_models/payment_order_response.dart';
import 'package:dio/dio.dart';

class PaymentOrderService{
  
  static Future<PaymentOrderResponse> doPaymentOrder(PaymentOrdersBody ordersBody)
  async {
    Response? response;
    try
        {
          response = await DioHelper.dio!.post("https://accept.paymob.com/api/ecommerce/orders", data: ordersBody.toJson());
        } on DioError catch(e)
    {
      print(e.response);
    }
    return PaymentOrderResponse.fromJson(response!.data);
  }
}