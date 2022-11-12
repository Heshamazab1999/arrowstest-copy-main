import 'package:arrows/modules/MainBranches/models/fireBase_branches.dart';
import 'package:arrows/modules/where_to_deliver/models/branches_addresses_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MainBranchesController extends GetxController{

  // List<Branch> mainBranches = <Branch>[
  //   Branch(name: 'please_choose_branch'.tr , restaurantName: ''),
  //   Branch(restaurantName: 'y7b42yskv43l_igrill' , name: 'Aleppo'),
  //   Branch(restaurantName: 'y7b42yskv43l_aleppo' , name: 'Aleppo Dokki'),
  // ].obs;
  // Branch? mainBranchDropDownValue;
FireBaseBranchesModel? mainBranchDropDownValue;
bool isLoading=false; //bool variable created
var  selectedValue ;


  RxList<FireBaseBranchesModel> firebaseBranches = [FireBaseBranchesModel(

      name_en: 'choose_branch_drop_down'.tr,
      dataBase: 'Demo DataBase',
      available:false,
      name_ar: 'choose_branch_drop_down'.tr,
      id: '',
      address_ar: '',
      address_en: '',
      lat: '',
      lng: ''
  )].obs;
  
  void getFirebaseBranches()async {
    isLoading=true;
    await FirebaseDatabase.instance.reference()
        .child('branches').get().then((snapShot){
      var values = snapShot.value;
      values.forEach((key, value){
        firebaseBranches.add(FireBaseBranchesModel.fromJson(value));
        print(value);
      });
      isLoading=false;

      update();
    });
   }
  @override
  void onInit() {
    mainBranchDropDownValue =   firebaseBranches[0];
    firebaseBranches;
    getFirebaseBranches();
    super.onInit();
  }

  switchFunc(value){
      selectedValue=value;
      update();
   }
}
