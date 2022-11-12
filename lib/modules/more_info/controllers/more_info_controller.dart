import 'package:arrows/modules/more_info/models/more_info_response_model.dart';
import 'package:arrows/modules/more_info/services/more_info_service.dart';
import 'package:get/get.dart';

class MoreInfoController extends GetxController {
  Info? restaurantMoreInfo = Info();
  List<String> restaurantPhoneNumbers = <String>[].obs;

  Future<void> getRestaurantMoreInfo() async {
    MoreInfoResponse? response = await MoreInfoService.getRestaurantMoreInfo();
    print(response!.data);
    restaurantMoreInfo = response.data!;
    if (response.data!.phone1 != "") {
      restaurantPhoneNumbers.add(response.data!.phone1 ?? "");
    }
    if (response.data!.phone2 != "") {
      restaurantPhoneNumbers.add(response.data!.phone2 ?? "");
    }
    if (response.data!.phone3 != "") {
      restaurantPhoneNumbers.add(response.data!.phone3 ?? "");
    }
  }

  @override
  Future<void> onInit() async {
    await getRestaurantMoreInfo();
    super.onInit();
  }
}
