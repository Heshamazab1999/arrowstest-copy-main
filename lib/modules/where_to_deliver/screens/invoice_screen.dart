import 'package:arrows/components/arrows_app_bar.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowsAppBar(''),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [
                Text("السعر"),
                Text("الخصم"),
                Text("التوصل"),
                Text("الضريبة"),
                Text("رسوم اضافية"),
                Text("اجمالى السعر"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
