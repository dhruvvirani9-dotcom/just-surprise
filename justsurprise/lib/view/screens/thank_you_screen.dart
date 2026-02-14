import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:lottie/lottie.dart';

import '../../res/assets/animation_assets.dart';
import '../../res/assets/icon_assets.dart';
import '../../res/colors/app_color.dart';

class thankYouScreen extends StatefulWidget {
  const thankYouScreen({super.key});

  @override
  State<thankYouScreen> createState() => _thankYouScreenState();
}

class _thankYouScreenState extends State<thankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.offNamed(RoutesName.orderScreen);
          },
            child: Icon(Icons.arrow_back,color: Colors.white)
        ),
        title: const Text("Thank You", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 60),
          Center(child: Lottie.asset(AnimationAssets.thankYouAnimation, width: 400.0, height: 400.0)),
          InkWell(
            onTap: () {
              Get.offNamed(RoutesName.orderScreen);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0,left: 15,right: 15),
              decoration: BoxDecoration(
                  color: AppColor.deepSaffronColor,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: const Text("Go to OrderScreen", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
