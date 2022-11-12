import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/colors.dart';
import '../../../helpers/shared_prefrences.dart';
import '../controllers/map_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body:
    Column(
      children: [
    GetBuilder<MapController>(
    init :MapController(),
      builder:(controller)=>  SizedBox(
          height: 400.h,
          child: Container(

            margin: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(
                  color: mainColor,
                  width: 3,
                )),
            child:Stack(children: [
              Positioned.fill(
                child:GoogleMap(
                  mapType: MapType.normal,
                  // markers: markers.values.toSet(),
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  onCameraMove: controller.onCameraMove,
                  initialCameraPosition: controller.initialCameraPOstion,
                  onMapCreated: (GoogleMapController gcontroller) {
                    // _controller.complete(gcontroller);
                    final marker = Marker(
                      markerId: MarkerId(CacheHelper.getDataToSharedPrefrence('restaurantBranchID')),
                      position:  LatLng(double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLat')),double.parse(CacheHelper.getDataToSharedPrefrence('restaurantBranchLng'))),

                      // icon: BitmapDescriptor.,
                      infoWindow: InfoWindow(
                        title: 'Location',
                        snippet: CacheHelper.getDataToSharedPrefrence('restaurantBranchID'),
                      ),
                    );
                  },
                  onTap: (LatLng loc){
                    // print('${loc.latitude}, ${loc.longitude}');
                    // markers.add(  Marker(
                    //     markerId: MarkerId('sourcePin'),
                    //     position: LatLng(loc.latitude,loc.longitude),
                    //     // position: currentLocation!,
                    //     // icon: sourceIcon!,
                    //     infoWindow: InfoWindow(title: controller.locality, snippet: "Pick Up Locaation"),
                    //     onTap: () {
                    //       try {
                    //          print(controller.currentLocation!.latitude);
                    //        } catch (e) {
                    //         printError(info: '#####################');
                    //       }
                    //     }
                    // ));
                  },
                ), ),]),

          )
      ),
    ),
        /************after the map*******/
        Container(
            width:double.infinity,
            color: mainColor,
            child:Center(child: Text('receipt'.tr.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),))),
      ],
    ),);
  }
}
