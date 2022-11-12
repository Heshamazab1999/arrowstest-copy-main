import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:arrows/modules/home/controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/custom_main_screen_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  final BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(
      () => homeController.isLoading.value
          ? Container(
              height: 500.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ))
          : Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 10.h),
                Obx(() => CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true,
                          height: 450.h,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            homeController.currentImageIndex.value = index;
                          }),
                      items: homeController.homeAdsImages
                          .map((item) => Container(
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width - 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: mainColor, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  item!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                    fit: BoxFit.cover),
                                errorBuilder: (context, url, error) {
                                  return BlurHash(
                                      hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
                                },
                                fit: BoxFit.cover,
                              )))
                          .toList(),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() => AnimatedSmoothIndicator(
                      activeIndex: homeController.currentImageIndex.value,
                      count: 3,
                      effect: ExpandingDotsEffect(
                          dotHeight: 5,
                          dotWidth: 5,
                          activeDotColor: mainColor,
                          dotColor: mainColor),
                    )),
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CustomMainScreenCard(
                            bottomNavBarController: bottomNavBarController,
                            label: 'order_now'.tr,
                            image: "assets/images/shop_now.png",
                            onTap: () {
                              bottomNavBarController.currentIndex.value = 1;
                            }),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: CustomMainScreenCard(
                            bottomNavBarController: bottomNavBarController,
                            label: 'track_order'.tr,
                            image: "assets/images/track_order.png",
                            onTap: () {
                              bottomNavBarController.currentIndex.value = 3;
                            }),
                      ),

                    ],
                  ),
                ),
              ],
            ),
    ));
  }
}
