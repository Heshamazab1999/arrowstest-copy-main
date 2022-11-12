import 'package:arrows/modules/main_category/models/main_categories_model.dart';
import 'package:arrows/modules/main_category/services/main_categories_service.dart';
import 'package:get/get.dart';

class MainCategoriesController extends GetxController {
  final isLoading = false.obs;
  List<Category> categories = <Category>[].obs;
  int index = 0;

  Future<void> getMainCategories() async {
    MainCategories? response = await MainCategoriesService.getMainCategories();
    response!.data!.forEach((element) {
      categories.add(element);
    });
    print(categories[0].name);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    await getMainCategories();
    isLoading.value = false;
  }
}
