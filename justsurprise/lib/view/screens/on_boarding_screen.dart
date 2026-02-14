import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/assets/animation_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/notification_services.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  void initState() {
    super.initState();
    NotificationServices.getFCMToken(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.geyserColor,
                  AppColor.softPeachColor,
                ]
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset(AnimationAssets.cartAnimation),
                const Text("All your shopping in", style: TextStyle(fontSize: 25.0, color: AppColor.jakartaColor, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Just", style: TextStyle(fontSize: 25.0, color: AppColor.windowsBlueColor, fontFamily: "Kanit", fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
                    Text("Su", style: TextStyle(fontSize: 25.0, color: AppColor.deepSaffronColor, fontFamily: "Kanit", fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
                    Text("rpr", style: TextStyle(fontSize: 25.0, color: AppColor.easternBlueColor, fontFamily: "Kanit", fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
                    Text("ise", style: TextStyle(fontSize: 25.0, color: AppColor.fandangoColor, fontFamily: "Kanit", fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text("Sell your devices the smarter, faster way for immediate cash and a cleaner conscience. Sell your devices the smarter, faster way for immediate cash and a cleaner conscience.",
                    textAlign: TextAlign.center, style: TextStyle(color: AppColor.blackColor, fontSize: 15.0, fontFamily: "Inter", fontWeight: FontWeight.w400)),
                const SizedBox(height: 40.0),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.offNamed(RoutesName.loginScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                              color: AppColor.deepSaffronColor,
                              borderRadius: BorderRadius.circular(10.0)
                          ), child: const Text("Log in", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.offNamed(RoutesName.signUpScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10.0)
                          ), child: const Text("Sign Up", textAlign: TextAlign.center, style: TextStyle(color: AppColor.deepSaffronColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
