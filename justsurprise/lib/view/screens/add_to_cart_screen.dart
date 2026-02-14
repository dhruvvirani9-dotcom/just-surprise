import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/assets/image_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';

import '../../view_models/controller/make_it_extra_special_view_model.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  final makeItExtraVM = Get.find<MakeItExtraSpecialViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("Cart", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(image: AssetImage(ImageAssets.cake), width: 80.0, height: 80.0)),
                            const SizedBox(width: 10.0),
                             Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text("Black Forest Eggless Bento \nCake 250 Gram", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit")),
                                  ),
                                  SizedBox(height: 3.0),
                                  Text("₹ 449 X 1     Eggless", style: TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit"))
                                ],
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.carbonGreyColor, width: 1.0),
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: const Text("Delete", style: TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: AssetImage(IconAssets.location), width: 25.0, height: 25.0),
                            SizedBox(width: 5.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Delivery to", style: TextStyle(color: AppColor.carbonGrayColor, fontSize: 16, fontFamily: "Kanit")),
                                Text("Mr. sd", style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                                Text("chhatribagh-indore 452001", style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                                Text("Mobile: 0123456789", style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Text("Deliver Date", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit")),
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                          color: AppColor.seashellColor,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: const Text("2  NOV THU   Pre-Midnight Delivery :   19923:00 - 23:59 Hrs", textAlign: TextAlign.center, style: TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit")),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Price Details", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit")),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Product Price", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                        Text("₹ 599", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Charges", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                        Text("Free", style: TextStyle(color: AppColor.mediumGreenColor, fontFamily: "Kanit")),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Product Price", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                        Text("₹ 19", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const SizedBox(height: 10.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: TextStyle(color: AppColor.eerieBlackColor, fontSize: 16, fontFamily: "Kanit")),
                        Text("₹ 699", style: TextStyle(color: AppColor.portlandOrangeColor, fontSize: 15, fontFamily: "Kanit")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                width: Get.width,
                color: AppColor.deepSaffronColor,
                child: const Text("Proceed to Checkout", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 18, fontFamily: "Kanit")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
