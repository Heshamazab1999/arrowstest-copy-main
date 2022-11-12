import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/main_category/controllers/main_categories_controller.dart';
import 'package:arrows/modules/sub_categories/screens/sub_categories_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainCategoryScreen extends StatelessWidget {
  MainCategoryScreen({Key? key}) : super(key: key);
  final  mainCategoriesController =
      Get.put(MainCategoriesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => mainCategoriesController.isLoading.value
        ? Center(
            child: Container(
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: mainColor),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: kPrimaryColor,
                    ),
                  ),
                )),
          )
        : Padding(
            padding: EdgeInsets.all(8.w),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250.w,
                    childAspectRatio: 8 / 9,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 20.w),
                itemCount: mainCategoriesController.categories.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      mainCategoriesController.index = index;
                      Get.to(() => SubCategoriesScreen(
                          title: mainCategoriesController
                              .categories[index].name!.tr));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 12 / 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: CachedNetworkImage(
                                imageUrl: mainCategoriesController
                                        .categories[index].photo ??
                                    "assets/images/no.jpeg",
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) => Icon(
                                  Icons.image_not_supported_sharp,
                                  size: 60,
                                  color: kPrimaryColor.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: mainColor,
                            height: 50.h,
                            padding: EdgeInsets.all(2.r),
                            child: Text(
                              mainCategoriesController
                                      .categories[index].name!.tr ,
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
