import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/components/round_button.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/view_models/controller/login_view_model.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LogInViewModel());

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    loginVM.isConnected.value = await Utils.isConnected();
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
                const Center(child: Text("Welcome", style: TextStyle(color: AppColor.eerieBlackColor, fontSize: 30.0, fontFamily: "Kanit"))),
                const Center(child: Text("Please enter your data to continue", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 15.0, fontFamily: "Kanit"))),
                const SizedBox(height: 100.0),
                const Text("Email", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                TextField(
                  controller: loginVM.emailController.value,
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text("Password", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                Obx(() => TextField(
                  controller: loginVM.passwordController.value,
                  obscureText: loginVM.hidePassword.value,
                  obscuringCharacter: '*',
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                      suffixIcon: IconButton(
                        icon: loginVM.hidePassword.value
                            ? const Icon(Icons.visibility_off, color: AppColor.smokeyGrayColor, size: 15.0)
                            : const Icon(Icons.visibility, color: AppColor.smokeyGrayColor, size: 15.0),
                        onPressed: () {
                          loginVM.hidePassword.value = !loginVM.hidePassword.value;
                          },
                      )
                  ),
                )),
                const SizedBox(height: 15.0),
                InkWell(
                  onTap: () {
                    Get.toNamed(RoutesName.forgotPasswordScreen);
                  }, child: Container(alignment: Alignment.centerRight, child: const Text("Forgot password?", style: TextStyle(color: AppColor.carminePinkColor, fontSize: 15.0, fontFamily: "Inter")))),
                const SizedBox(height: 30.0),
                Center(
                  child: Obx(() => RoundButton(
                    title: "LOG IN",
                    width: Get.width * 0.4,
                    loading: loginVM.loading.value,
                    onPress: () {
                      if(loginVM.emailController.value.text.isNotEmpty && loginVM.passwordController.value.text.isNotEmpty) {
                        if (loginVM.isConnected.value) {
                          loginVM.loginApi(context);
                        } else {
                          Utils.noInternetDialog(context);
                        }
                      } else {
                        if(loginVM.emailController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Your Email", context);
                        } else if (loginVM.passwordController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Password", context);
                        }
                      }
                    },
                  )),
                ),
                const SizedBox(height: 10.0),
                const Center(child: Text("or log in with", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 12.0, fontFamily: "ProductSans"))),
                const SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.chineseWhiteColor, width: 1.0),
                    shape: BoxShape.circle
                  ),
                  child: const Image(image: AssetImage(IconAssets.google), width: 20.0, height: 20.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? ", style: TextStyle(color: AppColor.blackColor, fontSize: 14.0, fontFamily: "ProductSans")),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.signUpScreen);
                      }, child: const Text("Sign Up", style: TextStyle(color: AppColor.blackColor, fontSize: 14.0, fontFamily: "ProductSans"))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
