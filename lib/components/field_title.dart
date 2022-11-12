import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class FieldTitle extends StatelessWidget {
  final String title;
  FieldTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: kPrimaryColor, fontSize: 20.sp, fontWeight: FontWeight.w600),
    );
  }
}
