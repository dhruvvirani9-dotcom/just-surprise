import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import '../../repository/ApiRepository.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel extends GetxController {
  final _api = ApiRepository();
  final emailController = TextEditingController().obs;
  RxBool loading = false.obs;
  RxBool isConnected = false.obs;

  Future<void> forgotPasswordApi(BuildContext context) async {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
    };
    _api.forgotPasswordApi(data).then((value) {
      loading.value = false;
      if (value["status"] == 1) {
        Get.toNamed(RoutesName.newPasswordScreen, arguments: emailController.value.text);
      } else {
        Utils.flushBarErrorMessage(value["message"], context);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}