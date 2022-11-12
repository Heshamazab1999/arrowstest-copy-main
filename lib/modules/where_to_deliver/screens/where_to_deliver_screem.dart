import 'dart:async';
import 'package:arrows/components/arrows_app_bar.dart';
import 'package:arrows/constants/colors.dart';
import 'package:arrows/constants/styles.dart';
import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/main.dart';
import 'package:arrows/modules/add_address/screens/add_address_screen.dart';
import 'package:arrows/modules/reciept/screens/reciept_screen.dart';
import 'package:arrows/modules/where_to_deliver/controllers/Where_to_controller.dart';
import 'package:arrows/modules/where_to_deliver/models/firebase_address_model.dart';
import 'package:arrows/shared_object/posted_order.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../components/custom_button.dart';
import '../controllers/map_controller.dart';

class WhereToDeliverScreen extends StatefulWidget {
  WhereToDeliverScreen({Key? key}) : super(key: key);

  @override
  State<WhereToDeliverScreen> createState() => _WhereToDeliverScreenState();
}

class _WhereToDeliverScreenState extends State<WhereToDeliverScreen> {
  final WhereToController whereToController = Get.put(WhereToController());
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker>markers = {};
   @override
  Widget build(BuildContext context) {
    final landScape = MediaQuery.of(context).orientation == Orientation.landscape;
     whereToController.getAllUserAddressees();
      final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    return Scaffold(
      appBar:ArrowsAppBar('checkOut_onOrder',),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: double.infinity,
            //   height: !landScape ? 50.h : 180.h,
            //   color: kPrimaryColor.withOpacity(0.7),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Center(
            //         child: Text(
            //           "checkOut_onOrder".tr,
            //           style: TextStyle(fontSize: 20.sp,color: mainColor),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                "checkOut_onOrder_title".tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp,color: mainColor),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 10.w,),
                Obx(() {
                  return Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            whereToController.showPickUpBranches.value
                                ? mainColor
                                : mainColor
                                
                      ),
                      onPressed: () async{
                        PostedOrder.order.address = null; //this is the cause of the crashing
                        PostedOrder.order.branch =
                             await whereToController.branches[1].name;
                          whereToController.showPickUpBranches.value = true;
                        print('%%%%%5${whereToController.showPickUpBranches.value}');


                      },
                      child: Text(
                        "receive_from".tr,
                        style: TextStyle(
                            color:whereToController.showPickUpBranches.value?kPrimaryColor:Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
                SizedBox(width: 10.w,),
                // TextButton(onPressed: (){
                //   whereToController.showPickUpBranches.value=false;
                //   print('%%%%%5${whereToController.showPickUpBranches.value}');
                // }, child: Text('jhdhd'))
                Obx(() {
                  return Expanded(child:TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          whereToController.showPickUpBranches.value
                               ? mainColor
                               : mainColor,
                              // : Colors.green,
                    ),
                    onPressed: () {
                      // PostedOrder.order.branch = 'null';
                      try{
                      PostedOrder.order.branch = null;
                      whereToController.showPickUpBranches.value =false;
                      (whereToController.selectedUserAddress!=null && whereToController.selectedUserAddress.address!.isNotEmpty)?
                      PostedOrder.order.address = whereToController.selectedUserAddress:
                      printError(info:'mnnnnnnnvnnnnnvvnvnvnvn');
                    }catch(e){
                        print(e);
                      }},
                    child: Text(
                      "deliver_to".tr,
                      style: TextStyle(
                          color:whereToController.showPickUpBranches.value? Colors.white:kPrimaryColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    ),
                  );
                }),
                SizedBox(width: 10.w,),
              ],
            ),
            Obx((){
              return (whereToController.showPickUpBranches.value)
                  ? FutureBuilder(
                future:  whereToController.getAllBranchAddresses(),
                    builder:(context ,snapShot) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("  ${'receive_from'.tr} :",style: TextStyle(fontSize: 14.sp,color: mainColor),),
                          //الاستلام من الفرع
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: Container(
                              padding: EdgeInsets.only(top: 15.h),
                              width: ScreenUtil().screenWidth,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: mainColor,
                                  ),
                              ),
                              child: (snapShot.connectionState == ConnectionState.waiting) ?
                              Center(child: CupertinoActivityIndicator(radius: 20, color: kPrimaryColor,),)
                                  :Column(
                                    children: [
                                      Padding(
                                        padding:   EdgeInsets.all(8.0.sp),
                                        child: Row(
                                          children: [
                                            Text('${'branch'.tr}  :',style: TextStyle(fontWeight: FontWeight.bold),),
                                            Text('${whereToController.branches[1].name}'),
                                          ],
                                        ),
                                      ), Padding(
                                        padding:   EdgeInsets.only(bottom: 8.0.h,left: 8.w,right: 8.w),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('${'your_address'.tr}  :',style: TextStyle(fontWeight: FontWeight.bold),),
                                            SizedBox(width: MediaQuery.of(context).size.width/2.w,
                                                child: Text('${CacheHelper.getDataToSharedPrefrence('restaurantBranchAddress')}'
                                                  ,style: TextStyle(fontSize: 16.sp),)),
                                                // child: Text('${whereToController.branches[1].address}',style: TextStyle(fontSize: 16.sp),)),
                                          ],
                                        ),
                                      ),




                                      GetBuilder<MapController>(
                                          init :MapController(),
                                          builder:(controller){
                                            return
                                              (!whereToController.showPickUpBranches.value) ?
                                              SizedBox():
                                              SizedBox(
                                                  height: 400.h,
                                                  child: Container(
                                                      // margin: EdgeInsets.only(top: 20.h),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                        border: Border.all(
                                                          color: mainColor,
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child:GoogleMap(
                                                          mapType: MapType.normal,
                                                          initialCameraPosition: controller.initialCameraPOstion,
                                                          markers: markers,
                                                          onMapCreated: (GoogleMapController controller) {
                                                            _controller.complete(controller);
                                                            //  final marker = Marker(
                                                            //   markerId: MarkerId(CacheHelper.getDataToSharedPrefrence('restaurantBranchID')),
                                                            //   position:  LatLng(double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLat')),
                                                            //       double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLng'))),
                                                            //   // icon: BitmapDescriptor.,
                                                            //   infoWindow: InfoWindow(
                                                            //     title: 'Location',
                                                            //     snippet: CacheHelper.getDataToSharedPrefrence('restaurantBranchID'),
                                                            //   ),
                                                            // );
                                                            setState(() {
                                                              markers.add(Marker(
                                                                markerId: MarkerId("home"), //marker ID is mandate to differentiate from the other markers
                                                                position: LatLng(double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLat')),double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLng'))),

                                                              ));
                                                              // marker;
                                                            });
                                                          }
                                                      ))) ;

                                          })  ,
                                    ],
                                  ),
                            ),
                          ),
                        ],
                      ),
                  ) : whereToController.dbref == null
                      ? SizedBox()
                      : Container(
                        decoration: CommonStyles.customBoxDecoration,
                          // height: ScreenUtil().screenHeight,
                          width: ScreenUtil().screenWidth,
                          child: FirebaseAnimatedList(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              query: whereToController.dbref,
                              itemBuilder: (
                                BuildContext context,
                                DataSnapshot snapshot,
                                Animation<double> animation,
                                int index,
                              ) {
                                return Obx(() {
                                  return RadioListTile(
                                    groupValue:
                                        whereToController.radioValue.value,
                                    value: snapshot.value.toString(),
                                    onChanged: (onChanged) {
                                      whereToController.radioValue.value =
                                          snapshot.value.toString();
                                      PostedOrder.order.address =
                                          UserAddress.fromJson(snapshot.value as Map<dynamic, dynamic>);
                                      whereToController.selectedUserAddress =
                                          UserAddress.fromJson(snapshot.value as Map<dynamic, dynamic>);
                                      // whereToController.selectedAreaPrice =snapshot.value!['branch1']['price'];
                                      whereToController.selectedAreaPrice =snapshot.value['user_area']['price'];
                                    },
                                    title: Text(
                                        "${snapshot.value["address"]} - ${snapshot.value['user_area']['area'] ?? ""}",style: TextStyle(fontSize: 14.sp),),
                                  );
                                });
                              }),
                        );
            }),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 20.h,),
                  Obx(()=>
                (whereToController.showPickUpBranches.value) ?
                 SizedBox():
                Button(text: "add_new_address".tr, size: 250,
                  height: 50,
                  isFramed: true
                    ,onPressed: (){
                      Get.to(() => AddNewAddress());
                    },),),
                SizedBox(height: 20.h,),

            // Obx(()=>
            //     (whereToController.showPickUpBranches.value) ?
            //       SizedBox():
            //       SizedBox(
            //             width: 250.w,
            //             child: TextButton(
            //               onPressed: () {
            //                 Get.to(() => AddNewAddress());
            //               },
            //               style: TextButton.styleFrom(
            //                 backgroundColor: mainColor,
            //               ),
            //               child: FittedBox(
            //                 child: Text(
            //                   "add_new_address".tr,
            //                   style: TextStyle(color: kPrimaryColor,fontSize: 15.sp),
            //                 ),
            //               ),
            //             ),
            //             ),
            //
            //   ),

    // Obx((){
    // return (whereToController.showPickUpBranches.value)
    // ?
    //         GetBuilder<MapController>(
    //                 init :MapController(),
    //                 builder:(controller){
    //                 return
    //                 (!whereToController.showPickUpBranches.value) ?
    //                 SizedBox():
    //                  SizedBox(
    //                     height: 400.h,
    //                     child: Container(
    //                       margin: EdgeInsets.only(top: 20.h),
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.all(Radius.circular(15.0)),
    //                               border: Border.all(
    //                                 color: mainColor,
    //                                 width: 3,
    //                               ),
    //                           ),
    //                       child:GoogleMap(
    //                      mapType: MapType.normal,
    //                      initialCameraPosition: controller.initialCameraPOstion,
    //                      markers: markers,
    //                      onMapCreated: (GoogleMapController controller) {
    //                        _controller.complete(controller);
    //                        //  final marker = Marker(
    //                        //   markerId: MarkerId(CacheHelper.getDataToSharedPrefrence('restaurantBranchID')),
    //                        //   position:  LatLng(double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLat')),
    //                        //       double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLng'))),
    //                        //   // icon: BitmapDescriptor.,
    //                        //   infoWindow: InfoWindow(
    //                        //     title: 'Location',
    //                        //     snippet: CacheHelper.getDataToSharedPrefrence('restaurantBranchID'),
    //                        //   ),
    //                        // );
    //                        setState(() {
    //                          markers.add(Marker(
    //                              markerId: MarkerId("home"), //marker ID is mandate to differentiate from the other markers
    //                          position: LatLng(double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLat')),double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLng'))),
    //
    //                          ));
    //                          // marker;
    //                        });
    //                   }
    //                  ))) ;
    //
    //                  })  ,

                  /********sec****/

                  // GetBuilder<MapController>(
                  // init :MapController(),
                  // builder:(controller){
                  //       return
                  //   //       (whereToController.showPickUpBranches.value)
                  //   // ?
                  //         GetBuilder<MapController>(
                  // init :MapController(),
                  // builder:(controller)=>
                  //
                  // SizedBox(
                  //   height:whereToController.showPickUpBranches.value? 400.h:0,
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 20.h),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //             border: Border.all(
                  //               color: mainColor,
                  //               width: 3,
                  //             ),
                  //         ),
                  //     child:Stack(children: [
                  //               Positioned.fill(
                  //                 child:
                  //                 GoogleMap(
                  //     mapType: MapType.hybrid,
                  //       initialCameraPosition: _kGooglePlex,
                  //      // markers: markers.values.toSet(),
                  //       onMapCreated: (GoogleMapController controller) {
                  //         _controller.complete(controller);
                  //       },
                  //     ),
                  //
                  //                 ),]),
                  //   )
                  // ),
                  // ); }),

                  /********first****/

                  // Obx ((){
                  //       return
                  //         (whereToController.showPickUpBranches.value)
                  //   ? GetBuilder<MapController>(
                  // init :MapController(),
                  // builder:(controller)=>
                  //
                  // SizedBox(
                  //   height: 400.h,
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 20.h),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //             border: Border.all(
                  //               color: mainColor,
                  //               width: 3,
                  //             ),
                  //         ),
                  //     child:Stack(children: [
                  //               Positioned.fill(
                  //                 child:GoogleMap(
                  //                   mapType: MapType.normal,
                  //                   markers: markers.values.toSet(),
                  //                   myLocationButtonEnabled: false,
                  //                   myLocationEnabled: true,
                  //                   onCameraMove: controller.onCameraMove,
                  //                    initialCameraPosition: controller.initialCameraPOstion,
                  //                    // initialCameraPosition: controller.initialCameraPOstion,
                  //                   onMapCreated: (GoogleMapController gcontroller) {
                  //                        _controller.complete(gcontroller);
                  //                        final marker = Marker(
                  //                          markerId: MarkerId(CacheHelper.getDataToSharedPrefrence('restaurantBranchID')),
                  //                          position:  LatLng(double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLat')),
                  //                              double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLng'))),
                  //                          // icon: BitmapDescriptor.,
                  //                          infoWindow: InfoWindow(
                  //                            title: 'Location',
                  //                            snippet: CacheHelper.getDataToSharedPrefrence('restaurantBranchID'),
                  //                          ),
                  //                        );
                  //                        setState(() {
                  //                          markers[MarkerId('place_name')] = marker;
                  //                        });
                  //                   },
                  //                    onTap: (LatLng loc){
                  //                        // print('${loc.latitude}, ${loc.longitude}');
                  //                        // markers.add(  Marker(
                  //                        //     markerId: MarkerId('sourcePin'),
                  //                        //     position: LatLng(loc.latitude,loc.longitude),
                  //                        //     // position: currentLocation!,
                  //                        //     // icon: sourceIcon!,
                  //                        //     infoWindow: InfoWindow(title: controller.locality, snippet: "Pick Up Locaation"),
                  //                        //     onTap: () {
                  //                        //       try {
                  //                        //          print(controller.currentLocation!.latitude);
                  //                        //        } catch (e) {
                  //                        //         printError(info: '#####################');
                  //                        //       }
                  //                        //     }
                  //                        // ));
                  //                      },
                  //                 ), ),]),
                  //   )
                  // ),
                  // ):SizedBox();}),




              Button(text:  "check_out".tr, size: 250, isFramed: false,height: 50
                ,onPressed: (){

                    if( whereToController.showPickUpBranches.value){
                      /**************KK****/
                      if (whereToController.branchDropDownValue!.name == "اختار الفرع") {
                        Get.defaultDialog(
                            title: "", content: Text("برجاء اختر الفرع",style: TextStyle(fontSize: 14.sp),));
                      } else {
                        Get.to(() => ReceiptScreen(selectedAreaPrice :whereToController.selectedDropDownValue?.price));
                      }
                      /**************KK****/
                    }
                    else{
                      if(whereToController.radioValue.value == "")
                      {
                        Get.defaultDialog(
                            title: "", content: Text("please_choose_branch".tr,style: TextStyle(fontSize: 14.sp),));
                      }else{
                        Get.to(() => ReceiptScreen( selectedAreaPrice :whereToController.selectedDropDownValue?.price));

                      }
                    }

                },),

                  // SizedBox(
                  //   width: 250.w,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       if( whereToController.showPickUpBranches.value){
                  //         /**************KK****/
                  //         if (whereToController.branchDropDownValue!.name == "اختار الفرع") {
                  //           Get.defaultDialog(
                  //               title: "", content: Text("برجاء اختر الفرع",style: TextStyle(fontSize: 14.sp),));
                  //         } else {
                  //           Get.to(() => ReceiptScreen());
                  //         }
                  //         /**************KK****/
                  //       }
                  //       else{
                  //         if(whereToController.radioValue.value == "")
                  //         {
                  //           Get.defaultDialog(
                  //               title: "", content: Text("please_choose_branch".tr,style: TextStyle(fontSize: 14.sp),));
                  //         }else{
                  //           Get.to(() => ReceiptScreen());
                  //
                  //         }
                  //       }
                  //     },
                  //     style: TextButton.styleFrom(
                  //       backgroundColor: mainColor,
                  //     ),
                  //     child: FittedBox(
                  //       child: Text(
                  //         "check_out".tr,
                  //         style: TextStyle(color: kPrimaryColor,fontSize: 15.sp),
                  //       ),
                  //     ),



                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}


//GetBuilder<WhereToController>(
//                                 builder: (whereToController) {
//                               return DropdownButton(
//                                 borderRadius: BorderRadius.circular(10.r),
//                                 underline: SizedBox(),
//                                 style: TextStyle(color: kPrimaryColor),
//                                 items: whereToController.branches.map((item) {
//                                   return DropdownMenuItem(
//                                       value: item,
//                                       child: SizedBox(width:ScreenUtil.defaultSize.width - 50.w  ,child: Text(item.name ?? "",style: TextStyle(fontSize: 14.sp),)));
//                                 }).toList(),
//                                 onChanged: (Branch? newValue) {
//                                   print(newValue!.name);
//                                   whereToController.branchDropDownValue =
//                                       newValue;
//                                   PostedOrder.order.branch = whereToController
//                                       .branchDropDownValue!.name;
//                                   whereToController.update();
//                                 },
//                                 value: whereToController.branchDropDownValue,
//                               );
//                             }),