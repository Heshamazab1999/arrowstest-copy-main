import 'package:arrows/components/custom_cart_button.dart';
import 'package:arrows/components/field_title.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/modules/product_details/controllers/product_details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/custom_radio_button.dart';
import '../../components/loading_spinner.dart';
import '../../helpers/shared_prefrences.dart';
import '../sign_up/screens/sign_up_screen.dart';
import '../sub_categories/controllers/sub_categories_controller.dart';
import '../sub_categories/models/SubCategories.dart';

class ProductDetails extends StatelessWidget {
  late final int index;
   ProductDetails({Key? key, required this.index}) : super(key: key);
   final SubCategoriesController subCategoriesController =
      Get.put(SubCategoriesController());
  final productDetailsController = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    subCategoriesController.productPrice.value = double.parse(
            subCategoriesController.products[index].sizes![0].price!);
    subCategoriesController.totalPrice.value =
        subCategoriesController.productPrice.value;
    subCategoriesController.sizeDropDownValue =
    subCategoriesController.products[index].sizes![0];
    return  WillPopScope(
        onWillPop: ()async{
      return disposeMethod();
    },
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text("${subCategoriesController.products[index].name!.tr}",
            style: TextStyle(color: kPrimaryColor)),
        leading: IconButton(
          onPressed: () {
            Get.back();
            subCategoriesController.dispose();
            subCategoriesController.onClose();
          },
          icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                SizedBox(height: 2.h),
                Container(
              width: MediaQuery.of(context).size.width - 10,
              height: 300.h,
              decoration:
                  BoxDecoration(border: Border.all(color: mainColor, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.r),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: ScreenUtil().screenWidth,
                  imageUrl: subCategoriesController.products[index].photo
                          .toString() ,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.image_not_supported_sharp,
                    size: 60,
                    color: kPrimaryColor.withOpacity(0.6),),),),),
                GetBuilder<SubCategoriesController>(
                init: SubCategoriesController(),
                builder: (controller) =>    Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('   ${'price'.tr} : ',
                    style: TextStyle(fontSize: 20.sp, color: mainColor),
                  ),
                  subCategoriesController.totalPrice.value == 0
                      ? Text("   ${subCategoriesController.products[index].sizes![0].price}  ${'coin_jordan'.tr}    ",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: mainColor,
                          ),
                        )
                      : Text(
                          "   ${subCategoriesController.totalPrice.value.toStringAsFixed(2)}  ${'coin_jordan'.tr}    ",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: mainColor,
                          ),
                        ),
                ],
              ),
        ),),
            SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(alignment:WrapAlignment.start,
            children: [
                Text(
                  "   ${'order_content'.tr}" + ' :  ',
                  style: TextStyle(fontSize: 20.sp, color: mainColor),
                ),
                (subCategoriesController.products[index].components!.isEmpty ||
                        subCategoriesController.products[index].components ==
                            null)
                    ? SizedBox()
                    : Wrap(alignment:WrapAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            subCategoriesController
                                .products[index].components!.length,
                            (item) {
                              return  Padding(
                              padding: EdgeInsets.only(left: 18.0, right: 18,bottom: 5.h),
                              child: Text.rich(
                                TextSpan(
                                  text: subCategoriesController
                                      .products[index].components![item].name!,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                            );}
                          ),
                        ],
                      ),

              ],
            ),
            ),
            Container(
              width: 300.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 2, 0, 2),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        hoverColor: Colors.transparent,
                        color: kPrimaryColor,
                        icon: Icon(
                          Icons.minimize,
                          color: mainColor,
                          size: 20,
                        ), onPressed: () {
                          subCategoriesController.decreaseOrderCounter(index);
                        },
                      ),
                    ),
                  ),
                  GetBuilder<SubCategoriesController>(
                    init: SubCategoriesController(),
                    builder: (controller) => Obx(() => Text(
                          '${controller.orderCounter.toString()}',
                        )),
                  ),
                  GetBuilder<SubCategoriesController>(
                    init: SubCategoriesController(),
                    builder: (controller) => Align(
                      alignment: AlignmentDirectional(-0.6, 0.05),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 5, 2),
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            iconSize: 20,
                            color: kPrimaryColor,
                            icon: Icon(
                              Icons.add,
                              color: mainColor,
                              size: 20,
                            ),
                            onPressed: () {
                              controller.increaseOrderCounter(controller.products[index].availability!,index);
                              CacheHelper.saveDataToSharedPrefrence('limit', controller.products[index].availability!);

                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Material(
              color: mainColor,
              borderRadius: BorderRadius.circular(20.r),
              child: Padding(
                padding: EdgeInsets.only(left: 18.0.w, right: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /************************************sizes*********************************/
                    Obx(() => (subCategoriesController.products[index].sizes) !=
                     null ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      FieldTitle(title: 'pick_size'.tr,),
                      GetBuilder<ProductDetailsController>(
                        init: ProductDetailsController(),
                        builder: (controller) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child:  Obx(()=> DropdownButton<Sizes>(
                                iconSize: 24,
                                underline: SizedBox(),
                                style: TextStyle(color: kPrimaryColor),
                                isExpanded: true,
                                 items: subCategoriesController
                                    .products[index].sizes!
                                    .map((item) {
                                return DropdownMenuItem<Sizes>(
                                      value: item,
                                      child: Row(
                                        children: [
                                          Text(item.size ?? "", style: TextStyle(fontSize: 14.sp),), SizedBox(width: 15.w,),
                                          Text(
                                            "(${item.price})",
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ],
                                      ));
                                }).toList(),
                                onChanged: (newValue) {

                                  // subCategoriesController.selectSize(newValue,index);
                                  Sizes size = newValue as Sizes;
                                  if (subCategoriesController.productPrice.value != size.price) {
                                  // if (subCategoriesController.products[index].sizes!.first.price != size.price) {
                                    subCategoriesController.productPrice.value=double.parse(newValue.price!) ;
                                    subCategoriesController.products[index].sizes!.first.price!=newValue.price;
                                  var total =subCategoriesController.totalPrice.value + (double.parse(size.price!)*subCategoriesController.orderCounter.value);
                                  print('total1   ${total}');
                                    total -= ((double.parse(newValue.price!)*subCategoriesController.orderCounter.value));
                                    print('total2  ${total}');
                                    subCategoriesController.totalPrice.value -= total-(double.parse(size.price!)+double.parse(newValue.price!)*subCategoriesController.orderCounter.value );
                                    print('total3  ${subCategoriesController.totalPrice.value-double.parse(newValue.price!)}');
                                    subCategoriesController.totalPrice.value=subCategoriesController.totalPrice.value-double.parse(newValue.price!);
                                    subCategoriesController.products[index].sizes!.first.price == size.price;
                                     /********rightSoultion***************/
                                       // Sizes size = newValue as Sizes;
  //                                 if (subCategoriesController.products[index].sizes!.first.price != size.price) {
  //                                   size.price==newValue.price;
  //
  //                                 var total =subCategoriesController.totalPrice.value + (double.parse(size.price!)*subCategoriesController.orderCounter.value);
  //                                 print('total1   ${total}');
  //
  //                                 total -= ((double.parse(newValue.price!)*subCategoriesController.orderCounter.value));
  //                                 print('total2  ${total}');
  //                                 subCategoriesController.totalPrice.value -= total-(double.parse(size.price!)+double.parse(newValue.price!)*subCategoriesController.orderCounter.value );
  //                                 print('total3  ${subCategoriesController.totalPrice.value-double.parse(newValue.price!)}');
  //                                 subCategoriesController.totalPrice.value=subCategoriesController.totalPrice.value-double.parse(newValue.price!);
  //                                 subCategoriesController.products[index].sizes!.first.price == size.price;
                                     /********rightSoultion***************/
                                    subCategoriesController.products[index].sizes!.first.price == size.price;
                                    print('------------------');
                                    print(size.price);
                                    subCategoriesController.sizesList.add(Sizes(size:newValue.size,price: newValue.price ));
                                    print('##########${newValue.price}');
                                    CacheHelper.saveDataToSharedPrefrence('selectedSize', size.size);
                                   var x= CacheHelper.getDataToSharedPrefrence('selectedSize');
                                     print(subCategoriesController.products[index].sizes!.first.price);
                                    print('---------selectedSize-----$x----');
                                  }
                                /***new***/
                                  // productDetailsController.value=productDetailsController.selectedSize;

                                },

                                // value: productDetailsController.value,

                              )));
                        }), ],
                    ) : SizedBox(),),
                    /************************************Componants*********************************/
                Obx(() => (subCategoriesController.products[index].components!.isNotEmpty &&(subCategoriesController.products[index].components )!=null)
                 ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [    FieldTitle(title: 'order_content'.tr),
                    GetBuilder<ProductDetailsController>(
                      builder: (controller) {
                        return ListView.builder(
                            itemCount: subCategoriesController
                                .products[index].components!.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                             itemBuilder: (_, i) {
                              controller.component.value = List.filled(subCategoriesController.products[index].components!.length, true);

                              subCategoriesController.listOfPComponents.add(Components(
                                  id: num.tryParse( subCategoriesController
                                      .products[index].components![i].toString()),
                                  ));
                              return Obx(() => CheckboxListTile(
                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                  dense:true,
                                   contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                  checkColor: mainColor,
                                  selectedTileColor: mainColor,
                                  activeColor: kPrimaryColor,

                                  // value:   subCategoriesController.products[index].components![i],
                                  value:   controller.component[i], //list
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text(
                                    '${subCategoriesController.products[index].components![i].name!.tr}',
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 18.sp),
                                  ),
                                  onChanged: (bool? value) {
                                    print(value);
                                     controller.component[i] = value!;
                                    print(controller.component[i]);

                                    controller.component[i] ?

                                    subCategoriesController.listOfPComponents.add(subCategoriesController.products[index].components![i] )
                                    : subCategoriesController.listOfPComponents.removeAt(i);

                                    print(subCategoriesController.listOfPComponents.length);
                                    subCategoriesController.products[index].components;
                               subCategoriesController.listOfPComponents;

                                  }),
                              );
                            });
                      },
                    ),
                    ]):SizedBox()),
                    /************************************Types*********************************/

                        Obx(() => (subCategoriesController.products[index].spices!.isNotEmpty &&(subCategoriesController.products[index].spices )!=null)
                            ? Column( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FieldTitle(
                                  title: 'type'.tr,
                                ),
                            GetBuilder<SubCategoriesController>(
                                        init: SubCategoriesController(),
                                        builder: (controller) => Obx(() =>
                                            ListView.builder(
                                                itemCount: controller
                                                    .products[index]
                                                    .spices!
                                                    .length,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                padding: null,
                                                itemBuilder: (_, i) {
                                                  controller.valueGroupType.value =
                                                      List.filled(controller.products[index].spices!.length, 0);
                                                  return CustomRadioButton(
                                                      isPayment: false,

                                                      isDrinks: false,
                                                      controller: controller,
                                                      value: controller.products[index].spices![i].name!.tr,
                                                      onChanged: (v) {
                                                        controller.selectTypeRadioButton(v);
                                                        subCategoriesController
                                                            .addToSpices(
                                                                controller.products[index].spices![i].id!,
                                                                controller.products[index].spices![i]);
                                                        print(v);
                                                      },
                                                      textOfTheRadio: controller.products[index].spices![i].name!.tr);
                                                },),),),

                              ],
                            ) : SizedBox(),
                    ),
                    /************************************BasicDrinks*********************************/
                        Obx(() => ((subCategoriesController.products[index].drinks!.isNotEmpty) &&(subCategoriesController.products[index].drinks )!=null)
                            ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FieldTitle(
                                  title: 'drinks'.tr,
                                ),
                                SizedBox(
                                  child:GetBuilder<SubCategoriesController>(
                                          init: SubCategoriesController(),
                                          builder: (controller) {
                                            return ListView.builder(
                                                itemCount:
                                                    subCategoriesController
                                                        .products[index]
                                                        .drinks!
                                                        .length,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (_, i) {
                                                  controller.valueGroupType
                                                          .value =
                                                      List.filled(
                                                          controller
                                                              .products[index]
                                                              .drinks!
                                                              .length,
                                                          0);
                                                  return CustomRadioButton(
                                                      isDrinks: true,
                                                      isPayment: false,

                                                      controller:
                                                          subCategoriesController,
                                                      value:
                                                          subCategoriesController
                                                              .products[index]
                                                              .drinks![i]
                                                              .name.toString(),
                                                      onChanged: (v) {
                                                        subCategoriesController
                                                            .selectDrinkRadioButton(
                                                                v);
                                                      },
                                                      textOfTheRadio:
                                                          subCategoriesController
                                                              .products[index]
                                                              .drinks![i]
                                                              .name.toString());
                                                });
                                          }),
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                    /************************************Souces*********************************/
                        Obx(() => (subCategoriesController.products[index].sauces!.isNotEmpty &&(subCategoriesController.products[index].sauces )!=null)
                            ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FieldTitle(
                                  title: 'sauces'.tr,
                                ),
                                Text(
                                  '(${'choose_only_4_items'.tr})',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                GetBuilder<ProductDetailsController>(
                                  builder: (controller) {
                                    controller.suaces.value = List.filled(
                                        subCategoriesController
                                            .products[index].sauces!.length,
                                        false);
                                    return ListView.builder(
                                        itemCount: subCategoriesController
                                            .products[index].sauces!.length,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          controller.suaces.value = List.filled(
                                              subCategoriesController
                                                  .products[index]
                                                  .sauces!
                                                  .length,
                                              false);
                                          return Obx(() => CheckboxListTile(
                                              checkColor: mainColor,
                                              selectedTileColor: mainColor,
                                              activeColor: kPrimaryColor,
                                              value: controller.suaces[i],
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              title: Text(
                                                subCategoriesController
                                                    .products[index]
                                                    .sauces![i]
                                                    .name!
                                                    .tr,
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 18.sp),
                                              ),
                                              onChanged: (bool? value) {
                                                print(value);
                                                controller.suaces[i] = value!;
                                                subCategoriesController
                                                    .addToSouces(
                                                        controller.suaces[i],
                                                        subCategoriesController
                                                            .products[index]
                                                            .sauces![i]);
                                                print(subCategoriesController
                                                    .listOfSouces.length);
                                              }));
                                        });
                                  },
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                    /************************************generalextra*********************************/
                    Obx(() => (subCategoriesController.products[index].additional!.isNotEmpty &&(subCategoriesController.products[index].additional )!=null)
                          ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FieldTitle(
                                  title: 'general_extras'.tr,
                                ),
                                GetBuilder<ProductDetailsController>(
                                  builder: (controller) {
                                    return Obx(() => ListView.builder(
                                        itemCount: subCategoriesController
                                            .products[index].additional!.length,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          controller.addition.value =
                                              List.filled(
                                                  subCategoriesController
                                                      .products[index]
                                                      .additional!
                                                      .length,
                                                  false);
                                          return Obx(() => ListTileTheme(
                                              dense: true,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                              child:CheckboxListTile(
                                              contentPadding: EdgeInsets.all(0),
                                                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                                  checkColor: mainColor,
                                              selectedTileColor: mainColor,
                                              activeColor: kPrimaryColor,
                                              value: controller.addition[i],
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              title: Text(
                                                "${subCategoriesController.products[index].additional![i].addition} =${subCategoriesController.products[index].additional![i].price}",
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 18.sp),
                                              ),
                                              onChanged: (bool? value) {
                                                controller.addition[i] = value!;
                                                subCategoriesController
                                                    .addToPublicAddition(
                                                        controller.addition[i],
                                                        subCategoriesController
                                                            .products[index]
                                                            .additional![i]);

                                                print('**************${subCategoriesController.listOfPublicAdditional[i].price}');
                                              })));
                                        }));
                                  },
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                    /************************************extra*********************************/
                    Obx(() => (productDetailsController.drinks!.isNotEmpty &&(productDetailsController.drinks )!=null)
               ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ FieldTitle(title: 'extras'.tr,),
                    GetBuilder<ProductDetailsController>(
                      init: ProductDetailsController(),
                      builder: (controller) {
                        return Obx(() => ListView.builder(
                            itemCount: controller.drinks!.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return Obx(() => CheckboxListTile(
                                  checkColor: mainColor,
                                  selectedTileColor: mainColor,
                                  activeColor: kPrimaryColor,
                                  value: controller.otherAddition[i],
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text(
                                    "${controller.drinks![i].name} = ${controller.drinks![i].price}",
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 18.sp),
                                  ),
                                  onChanged: (bool? value) {controller.otherAddition[i] = value!;
                                    subCategoriesController.addToDrinks(
                                        controller.otherAddition[i],
                                        controller.drinks![i]);

                                    subCategoriesController.addToOtherAdditional(
                                        num.parse(controller.drinks![i].id.toString()),
                                        controller.drinks![i]
                                    );


                                  }));
                            }));
                      },
                    ),   ],
                )
                    : SizedBox(),),
                    /************************************addToCart*********************************/
                    GetBuilder<SubCategoriesController>(
                      init: SubCategoriesController(),
                      builder: (subCategoriesController) {
                        return CustomCartButton(
                            text: 'add_to_cart',
                            isCart: true,
                            color: kPrimaryColor,
                            textColor: mainColor,
                            onPressed: () async {
                              if (await subCategoriesController
                                      .products[index].availability ==
                                  0) {
                                Get.defaultDialog(
                                    content: Text('الوجبة غير متوفرة'),
                                    title: '');
                              }
                              else if (CacheHelper.loginShared == null) {
                                showLoaderDialog(context);
                                Get.to(SignUpScreen());
                              }
                              else {
                                print(subCategoriesController.listOfPComponents.length);
                                CacheHelper.getDataToSharedPrefrence('orderId');
                                print('^^^^^^^${subCategoriesController.listOfAdditional }');
                                await subCategoriesController
                                    .validateOrder(index);


                                // addToCart(index) async {
                                //   try{

                            }});
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      ),
    );
  }

disposeMethod() {
  print('yamosaheellll');
  Get.back();

  subCategoriesController.dispose();
  subCategoriesController.onClose();
  // productDetailsController.dispose();
  // productDetailsController.onClose();

}}