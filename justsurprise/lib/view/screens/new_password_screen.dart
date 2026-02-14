import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/assets/animation_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/components/round_button.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/new_password_view_model.dart';
import 'package:lottie/lottie.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final newPassVM = Get.put(NewPasswordViewModel());
  String email = "";

  @override
  void initState() {
    super.initState();
    _checkConnection();
    email = Get.arguments;
  }

  Future<void> _checkConnection() async {
    newPassVM.isConnected.value = await Utils.isConnected();
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
                const Center(child: Text("New Password", style: TextStyle(color: AppColor.eerieBlackColor, fontSize: 28.0, fontFamily: "Kanit"))),
                Center(child: Lottie.asset(AnimationAssets.newPasswordAnimation, width: 205.0, height: 205.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 55,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                      child: TextField(
                        controller: newPassVM.otp1Controller.value,
                        focusNode: newPassVM.otp1FocusNode.value,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            Utils.fieldFocusChange(context, newPassVM.otp1FocusNode.value, newPassVM.otp2FocusNode.value);
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: AppColor.spanishGrayColor, width: 0.5)),
                            hintText: "-",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: AppColor.spanishGrayColor, width: 0.5)
                            )
                        ),
                        style: const TextStyle(color: AppColor.eerieBlackColor, fontSize: 14),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                      child: TextField(
                        controller: newPassVM.otp2Controller.value,
                        focusNode: newPassVM.otp2FocusNode.value,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            Utils.fieldFocusChange(context, newPassVM.otp2FocusNode.value, newPassVM.otp3FocusNode.value);
                          } else {
                            Utils.fieldFocusChange(context, newPassVM.otp2FocusNode.value, newPassVM.otp1FocusNode.value);
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: AppColor.spanishGrayColor, width: 0.5)),
                            hintText: "-",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: AppColor.spanishGrayColor, width: 0.5)
                            )
                        ),
                        style: const TextStyle(color: AppColor.eerieBlackColor, fontSize: 14),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                      child: TextField(
                        controller: newPassVM.otp3Controller.value,
                        focusNode: newPassVM.otp3FocusNode.value,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            Utils.fieldFocusChange(context, newPassVM.otp3FocusNode.value, newPassVM.otp4FocusNode.value);
                          } else {
                            Utils.fieldFocusChange(context, newPassVM.otp3FocusNode.value, newPassVM.otp2FocusNode.value);
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: AppColor.spanishGrayColor, width: 0.5)),
                            hintText: "-",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: AppColor.spanishGrayColor, width: 0.5)
                            )
                        ),
                        style: const TextStyle(color: AppColor.eerieBlackColor, fontSize: 14),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Container(
                      width: 55,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                      child: TextField(
                        controller: newPassVM.otp4Controller.value,
                        focusNode: newPassVM.otp4FocusNode.value,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            Utils.fieldFocusChange(context, newPassVM.otp4FocusNode.value, newPassVM.otp3FocusNode.value);
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: AppColor.spanishGrayColor, width: 0.5)),
                            hintText: "-",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: AppColor.spanishGrayColor, width: 0.5)
                            )
                        ),
                        style: const TextStyle(color: AppColor.eerieBlackColor, fontSize: 14),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                const Text("Password", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                Obx(() => TextField(
                  controller: newPassVM.passwordController.value,
                  obscureText: newPassVM.hidePassword.value,
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                      suffixIcon: IconButton(
                        icon: newPassVM.hidePassword.value
                            ? const Icon(Icons.visibility_off, color: AppColor.smokeyGrayColor, size: 15.0)
                            : const Icon(Icons.visibility, color: AppColor.smokeyGrayColor, size: 15.0),
                        onPressed: () {
                          newPassVM.hidePassword.value = !newPassVM.hidePassword.value;
                        },
                      )
                  ),
                )),
                const SizedBox(height: 15.0),
                const Text("Confirm Password", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                TextField(
                  controller: newPassVM.confirmPasswordController.value,
                  style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w500, fontSize: 15.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 30.0),
                const Center(child: Text("Please write your new password.", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter"))),
                const SizedBox(height: 30.0),
                Center(
                  child: Obx(() => RoundButton(
                    title: "Save",
                    width: Get.width * 0.4,
                    loading: newPassVM.loading.value,
                    onPress: () {
                      if(newPassVM.passwordController.value.text.isNotEmpty && newPassVM.confirmPasswordController.value.text.isNotEmpty) {
                        if (newPassVM.passwordController.value.text == newPassVM.confirmPasswordController.value.text) {
                          if (newPassVM.otp1Controller.value.text.isNotEmpty && newPassVM.otp2Controller.value.text.isNotEmpty && newPassVM.otp3Controller.value.text.isNotEmpty && newPassVM.otp4Controller.value.text.isNotEmpty) {
                            if (newPassVM.isConnected.value) {
                              newPassVM.changePasswordApi(context, email);
                            } else {
                              Utils.noInternetDialog(context);
                            }
                          } else {
                            Utils.flushBarErrorMessage("Enter otp", context);
                          }
                        } else {
                          Utils.flushBarErrorMessage("Password Not Matched", context);
                        }
                      } else {
                        if(newPassVM.passwordController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Password", context);
                        } else if (newPassVM.confirmPasswordController.value.text.isEmpty) {
                          Utils.flushBarErrorMessage("Please Enter Confirm Password", context);
                        }
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
