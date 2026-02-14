import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/contact_view_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final contactVM = Get.put(ContactViewModel());

  @override
  void initState() {
    super.initState();
    contactVM.contactApi(context);
  }

  bool getIsLoading() {
    if(contactVM.rxRequestStatus.value == Status.LOADING) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("Contact", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ),
      body: Obx(() => getIsLoading() ? contactVM.contactResponseData.value.contactData != null ? SafeArea (
          child: Container(
            color: AppColor.whiteColor,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.dullGrayColor,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image(image: NetworkImage(Utils.imageUrl + contactVM.contactResponseData.value.contactData!.image1!), width: 25.0, height: 25.0),
                        title: Text(contactVM.contactResponseData.value.contactData!.title1 ?? "", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                        subtitle: Text(contactVM.contactResponseData.value.contactData!.description1 ?? "", style: const TextStyle(color: AppColor.smokeyGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                      ),
                      ListTile(
                        leading: Image(image: NetworkImage(Utils.imageUrl + contactVM.contactResponseData.value.contactData!.image2!), width: 25.0, height: 25.0),
                        title: Text(contactVM.contactResponseData.value.contactData!.title2 ?? "", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                      ),
                      ListTile(
                        leading: Image(image: NetworkImage(Utils.imageUrl + contactVM.contactResponseData.value.contactData!.image3!), width: 25.0, height: 25.0),
                        title: Text(contactVM.contactResponseData.value.contactData!.title3 ?? "", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                        subtitle: Text(contactVM.contactResponseData.value.contactData!.description3 ?? "", style: const TextStyle(color: AppColor.smokeyGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                      ),
                      ListTile(
                        leading: Image(image: NetworkImage(Utils.imageUrl + contactVM.contactResponseData.value.contactData!.image4!), width: 25.0, height: 25.0),
                        title: Text(contactVM.contactResponseData.value.contactData!.title4 ?? "", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                        subtitle: Text(contactVM.contactResponseData.value.contactData!.description4 ?? "", style: const TextStyle(color: AppColor.smokeyGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ) : const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)),
      )
    );
  }
}
