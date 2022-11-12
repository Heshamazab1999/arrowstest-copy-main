
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/payment/payment_models/auth_body.dart';
import 'package:arrows/modules/payment/payment_models/orders_body.dart';
import 'package:arrows/modules/payment/payment_models/paymentTokenBody.dart';
import 'package:arrows/modules/payment/payment_models/payment_order_response.dart';
import 'package:arrows/modules/payment/payment_services/payment_auth_service.dart';
import 'package:arrows/modules/payment/payment_services/payment_token_service.dart';
import 'package:arrows/modules/payment/payment_services/paymment_order_service.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController

{
  static String authKey = '' ;
  static String paymentTokens = '';




  static Future<String?>paymentCheckout(double totalPrice)
  async {
    AuthBody apiKey = AuthBody(apiKey:CacheHelper.getDataToSharedPrefrence("apiKey"));

     await PaymentAuthService.AuthenticatePayment(apiKey).then((authToken)  async {
      authKey = authToken;
      PaymentOrdersBody paymentOrderBody = PaymentOrdersBody(authToken: authKey ,
        amountCents: (totalPrice *100).round().toString(),
        deliveryNeeded: 'false',
      );
      await  PaymentOrderService.doPaymentOrder(paymentOrderBody).then((PaymentOrderResponse orderId) async {
        PaymentTokenBody paymentTokenBody = PaymentTokenBody(
          authToken:authKey,
          orderId: orderId.id,
          amountCents: (totalPrice *100).round(),
          currency: "EGP",
            expiration: 3600,
          integrationId: 1025192,
          billingData: BillingData(
            phoneNumber: 'NA',
            firstName: 'NA',
            lastName: 'NA',
            street: 'NA',
            apartment: 'NA',
            building: 'NA',
            city: 'NA',
            country: 'NA',
            email: 'NA',
            floor: 'NA',
            postalCode: 'NA',
            shippingMethod: 'NA',
            state: 'NA',
          )
        );
        await PaymentTokenService.getPaymentToken(paymentTokenBody).then((paymentToken){
          paymentTokens = paymentToken;
        });
      });
    });
    return paymentTokens;

  }
}