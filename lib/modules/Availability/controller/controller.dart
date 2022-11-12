import 'package:arrows/api_base/dio_helper.dart';
import 'package:arrows/modules/Availability/model/availability_model.dart';
import 'package:get/get.dart';

class AvailabilityController extends GetxController{


  Rx<AvailabilityModel>? availabilityModel = AvailabilityModel().obs;
  Future <void> getAvailability(int id)async{
    final response = await DioHelper.getData(url: 'product/availability/$id');
    availabilityModel!.value = AvailabilityModel.fromJson(response.data);
  }
}