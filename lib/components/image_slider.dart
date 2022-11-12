import 'package:arrows/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class ImageSlider extends StatelessWidget {
  late final bool autoPlay;
  late final double heightSlider;
  late final double imageSliderHeight;
  late final double imageSliderWidth;
  late final double asspectRatio;
  late final bool infiniteScroll;
  late final List imageList;
  late final BoxFit fit;
  late final Widget nextPage;
  RxInt currentIndex = 0.obs;

  ImageSlider(
      {required this.autoPlay,
      required this.heightSlider,
      required this.imageSliderHeight,
      required this.imageSliderWidth,
      required this.asspectRatio,
      required this.infiniteScroll,
      required this.imageList,
      required this.fit,
      required this.nextPage,
      required this.currentIndex});

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Obx(() {
        return CarouselSlider(
          options: CarouselOptions(
              disableCenter: false,
              autoPlay: autoPlay,
              height: heightSlider,
              viewportFraction: 1.0,
              aspectRatio: asspectRatio,
              enableInfiniteScroll: infiniteScroll,
              autoPlayAnimationDuration: Duration(milliseconds: 300),
              enlargeCenterPage: false,
              onPageChanged: (index, fn) {
                currentIndex.value = index;
              }),
          carouselController: _controller,
          items: imageList.map(
            (imgAsset) {
              return Padding(
                padding:
                    EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: CachedNetworkImage(
                    imageUrl: imgAsset,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                          value: downloadProgress.progress),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.image_not_supported_sharp,
                      size: 90,
                      color: Colors.blue.withOpacity(0.4),
                    ),

                  ),
                ),
              );
            },
          ).toList(),
        );
      }),
      // Obx(() {
      //   return Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: (imageList.asMap().entries.map((entry) {
      //       return GestureDetector(
      //         onTap: () => _controller.animateToPage(entry.key),
      //         child: Container(
      //           width: 12.0,
      //           height: 12.0,
      //           margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      //           decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: (Theme.of(context).brightness == Brightness.dark
      //                       ? Colors.orange
      //                       : Colors.orange)
      //                   .withOpacity(
      //                       currentIndex.value == (entry.key) ? 0.9 : 0.4)),
      //         ),
      //       );
      //     }).toList()),
      //   );
      // }),
      Obx(() {
        return SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount:imageList.length ,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.orange
                          : Colors.orange)
                          .withOpacity(
                          currentIndex.value == (index) ? 0.9 : 0.4)),
                ),
              );
            },

          ),
        );
      }),
    ]);
  }
}
