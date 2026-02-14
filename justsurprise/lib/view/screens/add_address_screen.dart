import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/add_address_view_model.dart';

import '../../model/pincode_response_model.dart';
import '../../view_models/controller/address_view_model.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final addAddressVM = Get.put(AddAddressViewModel());
  final addressVM = Get.find<AddressViewModel>();

  @override
  Widget build(BuildContext context) {
    final addressController = TextEditingController(text: addAddressVM.pinCodeAddress.value.toString()).obs;
    final landmarkController = TextEditingController(text: addAddressVM.pinCodeLandmark.value.toString()).obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("Add Address", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ),body: SafeArea(
        child: Container(
          color: AppColor.whiteColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    controller: addAddressVM.typeController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Work type",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.type_specimen_sharp, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: addAddressVM.nameController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Name",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.person, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: addAddressVM.mobileController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Mobile",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.phone, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: addAddressVM.alternateMobileController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Alternate Mobile",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.phone, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      // Text("Select Delivery Location", style: TextStyle(color: AppColor.carbonGreyColor, fontSize: 14.0, fontFamily: "Kanit")),
                      SizedBox(
                        width: 360,
                        child: Autocomplete<PincodeData>(
                          optionsBuilder: (TextEditingValue value) {
                            if(value.text.isEmpty){
                              return List.empty();
                            }
                            return addressVM.pincodResponseData.value.pincodeData != null ? addressVM.pincodResponseData.value.pincodeData!.where((element) => element.pincode!.toLowerCase().contains(value.text.toLowerCase()),).toList(): List.empty();
                          },
                          fieldViewBuilder: (context, TextEditingController controller, FocusNode node,Function onSubmit) => TextField(
                            onChanged: (value) {
                              print("onChanged$value");
                              if(value.length > 0){
                                addressVM.pincodeApi(context,value);
                              }
                            },
                            controller: controller,
                            focusNode: node,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                            ],
                            decoration: InputDecoration(
                              hintText: "Enter Pincode...",
                              prefixIcon: Icon(Icons.pin_drop, color: AppColor.graniteGrayColor, size: 20.0),
                              hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                            ),
                          ),
                          optionsViewBuilder: (context, Function onSelected,Iterable<PincodeData> dataList) {
                            return Material(
                              child:ListView.builder(
                                shrinkWrap: true,
                                itemCount: dataList.length,
                                itemBuilder: (context, index) {
                                  PincodeData pincodeData = dataList.elementAt(index);
                                  return ListTile(
                                    onTap: () => onSelected(pincodeData),
                                    title: Text("${pincodeData.officeName.toString()} ${pincodeData.district.toString()}"),
                                    subtitle: Text(pincodeData.pincode.toString()),
                                  );
                                },),
                            );
                          },
                          onSelected: (value) {
                            print(value.officeName);
                            addAddressVM.pinCodeController.value = value.pincode.toString();
                            addAddressVM.pinCodeAddress.value = value.officeName.toString();
                            addAddressVM.pinCodeLandmark.value = value.district.toString();
                            FocusScope.of(context).unfocus();
                          },
                          displayStringForOption: (PincodeData data) => "${data.pincode!}",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: addressController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    enabled: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Address",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.perm_contact_cal_rounded, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: landmarkController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    enabled: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Landmark",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.location_on, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: addAddressVM.emailController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "email",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.email, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop({"": ""});
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            decoration: BoxDecoration(
                                color: AppColor.smokeyGrayColor,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: const Text("Cancel", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (addAddressVM.typeController.value.text.isNotEmpty && addAddressVM.nameController.value.text.isNotEmpty && addAddressVM.mobileController.value.text.isNotEmpty && addAddressVM.alternateMobileController.value.text.isNotEmpty && addressController.value.text.isNotEmpty && landmarkController.value.text.isNotEmpty && addAddressVM.emailController.value.text.isNotEmpty ) {
                              addAddressVM.addAddressApi(context);
                            } else {
                              if (addAddressVM.typeController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage('Type field can not be empty', context);
                              } else if (addAddressVM.nameController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage('Name field can not be empty', context);
                              } else if (addAddressVM.mobileController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage('Mobile field can not be empty', context);
                              } else if (addAddressVM.alternateMobileController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage('Mobile field can not be empty', context);
                              } else if (addressController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage('Address field can not be empty', context);
                              } else if (landmarkController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage('Landmark field can not be empty', context);
                              } else if (addAddressVM.emailController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage('Email field can not be empty', context);
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            decoration: BoxDecoration(
                                color: AppColor.deepSaffronColor,
                                borderRadius: BorderRadius.circular(5.0)
                            ), child: const Text("Save", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500))
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
    ));
  }
}
