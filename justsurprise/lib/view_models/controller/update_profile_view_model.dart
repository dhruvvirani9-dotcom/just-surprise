import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/utils/shared_preferences_services.dart';
import '../../repository/ApiRepository.dart';
import '../../utils/utils.dart';

class UpdateProfileViewModel extends GetxController {
  final _api = ApiRepository();
  final userNameController = TextEditingController().obs;
  final mobileNumController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  RxString username = "".obs;
  RxString birthDate = "".obs;
  RxString anniversaryDate = "".obs;
  RxString gender = "male".obs;
  RxBool hidePassword = true.obs;
  RxBool loading = false.obs;
  RxBool isConnected = false.obs;

  Future<void> updateProfileApi(BuildContext context) async {
    loading.value = true;
    Map data = {
      "name": userNameController.value.text,
      "phone": mobileNumController.value.text,
      "email": emailController.value.text,
      "dob": birthDate.value,
      "anniversary": anniversaryDate.value,
      "gender": gender.value,
    };
    _api.updateProfileApi(data).then((value) async {
      loading.value = false;
      if (value["status"] == 1) {
        await SharedPref.setUserName(value["name"].toString());
        await SharedPref.setUserEmail(value["email"].toString());
        await SharedPref.setUserNumber(value["phone"].toString());
        await SharedPref.setUserDob(value["dob"].toString());
        await SharedPref.setUserAnniversaryDate(value["anniversary"].toString());
        await SharedPref.setUserGender(value["gender"].toString());
        Get.back();
      } else {
        Utils.flushBarErrorMessage(value["message"], context);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
