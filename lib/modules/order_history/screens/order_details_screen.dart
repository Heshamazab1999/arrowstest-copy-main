import 'package:arrows/components/arrows_app_bar.dart';
import 'package:arrows/shared_object/order_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key, required this.order}) : super(key: key);
  late final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowsAppBar('Orders'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: ScreenUtil().screenWidth,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: order.listOfProduct!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: CachedNetworkImage(
                                height: 150.h,
                                width: 150.w,
                                imageUrl:
                                    order.listOfProduct![index].photo ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 198.w,
                                    child: Text(
                                      order.listOfProduct![index].name ?? "",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.visible
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(order.listOfProduct![index].sizes![0]
                                          .size ??
                                      "",style: TextStyle(fontSize: 12.sp),maxLines: 2, overflow: TextOverflow.visible,),
                                  SizedBox(
                                    height: 25.h,
                                    width: ScreenUtil.defaultSize.width - 120.w,
                                    child: ListView.separated(
                                        separatorBuilder: (context, sepIndex) {
                                            return Text(" , ");
                                        },
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: order.listOfProduct![index]
                                            .components!.length,
                                        itemBuilder: (context, contentIndex) {
                                          return SizedBox(
                                            child: Text(order
                                                    .listOfProduct![index]
                                                    .components![contentIndex]
                                                    .name ??
                                                "",style: TextStyle(fontSize: 12.sp),maxLines: 2, overflow: TextOverflow.visible,),
                                          );
                                        }),
                                  ),
                                  Text("{order.listOfProduct![index].} ( x{order.listOfProduct![index].number} )",style: TextStyle(fontSize: 12.sp), ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
