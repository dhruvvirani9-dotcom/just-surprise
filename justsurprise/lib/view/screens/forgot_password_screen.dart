import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/assets/animation_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/components/round_button.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/forgot_password_view_model.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  final forgotVM = Get.put(ForgotPasswordViewModel());

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    forgotVM.isConnected.value = await Utils.isConnected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          color: AppColor.whiteColor,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                        color: AppColor.magnoliaColor,
                        shape: BoxShape.circle
                    ), child: const Icon(Icons.arrow_back_outlined),
                  ),
                ),
                const Center(child: Text("Forgot Password", style: TextStyle(color: AppColor.eerieBlackColor, fontSize: 28.0, fontFamily: "Kanit"))),
                Center(child: Lottie.asset(AnimationAssets.forgotPasswordAnimation, width: 275.0, height: 275.0)),
                const Text("Email Address", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                TextField(
                  controller: forgotVM.emailController.value,
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text("Please write your email to receive a confirmation code to set a new password.", textAlign: TextAlign.center, style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                const SizedBox(height: 20.0),
                Center(
                  child: Obx(() => RoundButton(
                    title: "Continue",
                    width: Get.width * 0.4,
                    loading: forgotVM.loading.value,
                    onPress: () {
                      if(forgotVM.emailController.value.text.isNotEmpty) {
                        if (forgotVM.isConnected.value) {
                          forgotVM.forgotPasswordApi(context);
                        } else {
                          Utils.noInternetDialog(context);
                        }
                      } else {
                        Utils.flushBarErrorMessage("Please Enter Your Email", context);
                      }
                    },
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
