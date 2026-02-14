import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/view/screens/add_address_screen.dart';
import 'package:justsurprise/view/screens/edit_address_screen.dart';
import 'package:justsurprise/view_models/controller/address_view_model.dart';

import '../../utils/shared_preferences_services.dart';
import '../../view_models/controller/add_address_view_model.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final addressVM = Get.put(AddressViewModel());
  final addAddressVM = Get.put(AddAddressViewModel());
  var id;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    id = await SharedPref.getUserid();
    print(id);
    addressVM.viewAddressApi(context, id!);
  }
  bool getIsLoading() {
    if(addressVM.rxRequestStatus.value == Status.LOADING) {
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
        title: const Text("My Address", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ), body: SafeArea(
          child: Container(
            color: AppColor.whiteColor,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    Map results = await Navigator.of(context).push(MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) {
                        return const AddAddressScreen();
                      },
                    ));
                    if(results.containsKey("selection")) {
                      addressVM.setRxRequestStatus(Status.LOADING);
                      addressVM.viewAddressApi(context,id!);
                    }
                  },
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColor.dullGrayColor,
                            blurRadius: 25,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]
                    ),
                    child: const Text("+ Add New Address", textAlign: TextAlign.center, style: TextStyle(color: AppColor.carrotOrangeColor, fontSize: 18, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                  ),
                ),
                Obx(() => Expanded(
                  child: getIsLoading() ? addressVM.viewAddressResponseData.value.data != null ? addressVM.viewAddressResponseData.value.data!.isNotEmpty ?
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                    itemBuilder: (context, index) {
                      return Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.dullGrayColor,
                                  blurRadius: 25,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ]
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(image: AssetImage(IconAssets.location), color: AppColor.deepSaffronColor, width: 25.0, height: 25.0),
                              const SizedBox(width: 5.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(addressVM.viewAddressResponseData.value.data![index].name!, style: const TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 5.0),
                                    Text(addressVM.viewAddressResponseData.value.data![index].address!, style: const TextStyle(color: AppColor.smokeyGrayColor, fontSize: 13, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                                                EditAddressScreen(index),));
                                            print(addressVM.viewAddressResponseData.value.data![index].id);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 23.0, right: 23.0, top: 5.0, bottom: 5.0),
                                            decoration: BoxDecoration(
                                                color: AppColor.lightGrayColor,
                                                borderRadius: BorderRadius.circular(50.0)
                                            ),
                                            child: const Row(
                                              children: [
                                                Image(image: AssetImage(IconAssets.edit), width: 14.0, height: 14.0),
                                                SizedBox(width: 5.0),
                                                Text("Edit", style: TextStyle(color: AppColor.graniteGrayColor, fontFamily: "Kanit", fontWeight: FontWeight.w400))
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        InkWell(
                                          onTap: () {
                                            addressVM.deleteAddressApi(context,
                                                index,
                                                addressVM.viewAddressResponseData.value.data![index].id!.toString()
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
                                            decoration: BoxDecoration(
                                                color: AppColor.lavenderColor,
                                                borderRadius: BorderRadius.circular(50.0)
                                            ),
                                            child: const Row(
                                              children: [
                                                Image(image: AssetImage(IconAssets.trash), width: 12.0, height: 12.0),
                                                SizedBox(width: 5.0),
                                                Text("Delete", style: TextStyle(color: AppColor.whiteColor, fontFamily: "Kanit", fontWeight: FontWeight.w400))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                      }, itemCount: addressVM.viewAddressResponseData.value.data?.length,
                    ) : const Center(child: Text("No Address Found", style: TextStyle(color: AppColor.blackColor)))
                      : const Center(child: Text("No Address Found", style: TextStyle(color: AppColor.blackColor)))
                      : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)),
                ))
              ],
            ),
          ),
        )
    );
  }
}
