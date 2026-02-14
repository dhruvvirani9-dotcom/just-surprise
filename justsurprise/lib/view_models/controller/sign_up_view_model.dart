import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import '../../repository/ApiRepository.dart';
import '../../utils/utils.dart';

class SignUpViewModel extends GetxController {
  final _api = ApiRepository();
  final userNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final mobileNumController = TextEditingController().obs;
  RxBool hidePassword = true.obs;
  RxBool loading = false.obs;
  RxBool isConnected = false.obs;

  Future<void> signUpApi(BuildContext context) async {
    loading.value = true;
    Map data = {
      "name": userNameController.value.text,
      "password": passwordController.value.text,
      "email": emailController.value.text,
      "phone": mobileNumController.value.text,
    };
    _api.signUpApi(data).then((value) {
      loading.value = false;
      if (value["status"] == 1) {
        Get.toNamed(RoutesName.loginScreen);
      } else {
        Utils.flushBarErrorMessage(value["message"], context);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
