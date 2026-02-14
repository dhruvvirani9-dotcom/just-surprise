import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/main.dart';
import 'package:justsurprise/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/ApiRepository.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/shared_preferences_services.dart';
import '../../utils/utils.dart';

class LogInViewModel extends GetxController {
  final _api = ApiRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool hidePassword = true.obs;
  RxBool loading = false.obs;
  RxBool isConnected = false.obs;

  Future<void> loginApi(BuildContext context) async {
    loading.value = true;
    Map data = {
      "email" : emailController.value.text,
      "password" : passwordController.value.text,
    };
    _api.loginApi(data).then((value) async {
      loading.value = false;
      if(value["status"] == 1) {
        print("status");
        userModel user = userModel.fromJson(value);
        print("token");
        print(value["token"]);
        await SharedPref.setToken(value["token"]);
        await SharedPref.setUserid(user.user!.id.toString());
        await SharedPref.setUserName(user.user!.name.toString());
        await SharedPref.setUserEmail(user.user!.email.toString());
        await SharedPref.setUserNumber(user.user!.phone.toString());
        await SharedPref.setUserDob(user.user!.dob.toString());
        await SharedPref.setUserAnniversaryDate(user.user!.anniversary.toString());
        await SharedPref.setUserGender(user.user!.gender.toString());
        print(user.user!.id);
        print(""+value["message"]);
        loginValue();
        Get.offNamed(RoutesName.homeScreen);
      } else {
        print(value["message"]);
        Utils.flushBarErrorMessage(value["message"], context);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error.toString());
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> loginValue() async {
    var sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool(MyHomePageState.KEYLOGIN, true);
  }

  Future<void> logoutValue() async {
    var sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool(MyHomePageState.KEYLOGIN, false);
  }
}