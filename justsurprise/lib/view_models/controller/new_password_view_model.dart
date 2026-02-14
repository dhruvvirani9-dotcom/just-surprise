import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import '../../repository/ApiRepository.dart';

class NewPasswordViewModel extends GetxController {
  final _api = ApiRepository();
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final otp1Controller = TextEditingController().obs;
  final otp2Controller = TextEditingController().obs;
  final otp3Controller = TextEditingController().obs;
  final otp4Controller = TextEditingController().obs;
  final otp1FocusNode = FocusNode().obs;
  final otp2FocusNode = FocusNode().obs;
  final otp3FocusNode = FocusNode().obs;
  final otp4FocusNode = FocusNode().obs;
  RxBool hidePassword = true.obs;
  RxBool loading = false.obs;
  RxBool isConnected = false.obs;

  Future<void> changePasswordApi(BuildContext context, String email) async {
    loading.value = true;
    Map data = {
      "email": email,
      "password": passwordController.value.text,
      "otp": otp1Controller.value.text + otp2Controller.value.text + otp3Controller.value.text + otp4Controller.value.text,
    };
    _api.changePasswordApi(data).then((value) {
      loading.value = false;
      if (value["status"] == 1) {
        Get.offAndToNamed(RoutesName.loginScreen);
      } else {
        Utils.flushBarErrorMessage(value["message"], context);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
     // Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}