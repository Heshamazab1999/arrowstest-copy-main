import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/product_details/controllers/product_details_controller.dart';
import 'package:arrows/modules/sub_categories/controllers/sub_categories_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CustomRadioButton extends StatelessWidget {
  final value;
  SubCategoriesController controller;
     String  ?image;
   final String  textOfTheRadio;
     bool  isDrinks=false;
     bool  ?isPayment=false;
  void Function(dynamic)? onChanged;
    CustomRadioButton({
    Key? key,
    required this.controller,
    required this.value,
    required this.onChanged,
      this.isPayment,
      this.image,
     required this.textOfTheRadio,
     required this.isDrinks,
  })   ;



  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            activeColor:kPrimaryColor,
              value:value,
            groupValue:isDrinks?controller.drinkRadioButtonSelectedValue.value:
            controller.typeRadioButtonSelectedValue.value,
            onChanged:onChanged,
          ),
          isPayment! ?Image.asset(image!,width: 30.w,):SizedBox(),
          isPayment! ? SizedBox(width: 10.w,):SizedBox(),

            Text("${textOfTheRadio.tr}", style:   TextStyle(fontSize: 16.0),),

        ]);
  }
}
