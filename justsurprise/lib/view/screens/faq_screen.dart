import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/view_models/controller/faq_view_model.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final faqVM = Get.put(FaqViewModel());

  @override
  void initState() {
    super.initState();
    faqVM.faqApi(context);
  }

  bool getIsLoading() {
    if(faqVM.rxRequestStatus.value == Status.LOADING) {
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
        title: const Text("FAQ", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ), body: Obx(() => getIsLoading() ? faqVM.faqResponseData.value.faqData != null ? SafeArea(
          child: Container(
            color: AppColor.whiteColor,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: const Border(left: BorderSide(color: AppColor.graniteGrayColor, width: 4.0)),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.dullGrayColor,
                          spreadRadius: 5,
                          blurRadius: 25, // changes position of shadow
                        ),
                      ]
                  ),
                  child: Theme(
                    data: ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      onExpansionChanged: (value) {
                        faqVM.selectedIndex.value = index;
                        if (faqVM.selectedIndex.value == index) {
                          faqVM.isExpanded.value = value;
                        }
                      },
                      title: Text(faqVM.faqResponseData.value.faqData![index].question!, style: const TextStyle(color: AppColor.blackEelColor, fontSize: 14, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                      trailing: Obx(() => faqVM.isExpanded.value && faqVM.selectedIndex.value == index ?
                        const Text("-", style: TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w600)) :
                        const Text("+", style: TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w600))),
                      childrenPadding: const EdgeInsets.only(left: 15.0, bottom: 10.0, right: 15.0),
                      children: [
                        Text(faqVM.faqResponseData.value.faqData![index].question!,
                        style: const TextStyle(color: AppColor.blackEelColor, fontSize: 14, fontFamily: "Kanit", fontWeight: FontWeight.w300))
                      ],
                    ),
                  ),
                );
              }, itemCount: faqVM.faqResponseData.value.faqData?.length,
            ),
          ),
        ) : const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)),
      )
    );
  }
}
