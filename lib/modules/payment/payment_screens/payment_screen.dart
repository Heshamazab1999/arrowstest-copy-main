import 'dart:io';

import 'package:arrows/modules/where_to_deliver/controllers/Where_to_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String paymentToken;
  late WebViewController webViewController;
   PaymentScreen({Key? key, required this.paymentToken}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  initState(){
    super.initState();
  }
  WhereToController whereToController = Get.put(WhereToController());
  @override
  Widget build(BuildContext context) {
    // final String paymentToken = ModalRoute.of(context)!.settings.arguments as String;

return Scaffold(
  appBar: AppBar(),
  body: WebView(
    initialUrl: 'https://accept.paymob.com/api/acceptance/iframes/284546?payment_token=${widget.paymentToken}',
    javascriptMode: JavascriptMode.unrestricted,
     allowsInlineMediaPlayback: true,
    onPageFinished: (responseURL){
      Uri url = Uri.parse(responseURL);
      Map<String,String> map = url.queryParameters;
      if(url.queryParameters.containsKey('success'))
      {
        if(map['success'] == 'true')
          {
            url.queryParameters.forEach((key, value) {
              if(key == 'id'){
                print(value);
               whereToController.paymentReferenceId = value;
                whereToController.addOrderToFirebase();
              }
            });
          }
      }

    },
    // onWebViewCreated: (controller) => widget.webViewController = controller ,

  ),
);
  }
}
