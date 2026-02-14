import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/components/round_button.dart';
import 'package:justsurprise/view_models/controller/add_address_view_model.dart';
import 'package:justsurprise/view_models/controller/address_view_model.dart';

import '../../model/pincode_response_model.dart';


class EditAddressScreen extends StatefulWidget {
   final index;
   EditAddressScreen( this.index);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final addAddressVM = Get.find<AddAddressViewModel>();

  final addressVM = Get.find<AddressViewModel>();


  RxBool Loading = false.obs;

  @override
  Widget build(BuildContext context) {
    final typeController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].type);
    final nameController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].name);
    final mobileController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].mobile);
    final alternateMobileController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].alternateMobile);
    final addressController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].address);
    final landmarkController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].landmark);
    final emailController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].email);
    final pincodeController = TextEditingController(text: addressVM.viewAddressResponseData.value.data![widget.index].pincode);
    final id = addressVM.viewAddressResponseData.value.data![widget.index].id;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.lavenderColor,
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          title: const Text("Edit Address", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            color: AppColor.whiteColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // TypeAheadField<PincodeData>(
                    //   textFieldConfiguration: TextFieldConfiguration(
                    //     autofocus: true,
                    //     controller: addressVM.pincodeController.value,
                    //     decoration: const InputDecoration(
                    //       contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    //       hintText: "pinCode",
                    //       hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                    //       prefixIcon: Icon(Icons.pin_drop, color: AppColor.graniteGrayColor, size: 20.0),
                    //       enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    //       focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    //     ),
                    //   ),
                    //   // suggestionsCallback: (pattern) {
                    //   //   //var aa = addressVM.pincodResponseData.value.pincodeData!.where((element) => element.officeName.toString().toLowerCase().contains(pattern.toLowerCase())).toList();
                    //   //   addressVM.pincodeApi(context);
                    //   //   print("hello");
                    //   //   return addressVM.pincodResponseData.value.pincodeData!.where((element) => element.officeName.toString().toLowerCase().contains(pincodeController.value.text.toLowerCase())).toList();
                    //   // },
                    //   suggestionsCallback: addressVM.pincodeApi(context),
                    //   itemBuilder: (context,PincodeData? itemData) {
                    //     final user = itemData;
                    //     return ListTile(
                    //       title: Text(user!.officeName!),
                    //     );
                    //   },
                    //   onSuggestionSelected: (suggestion) {
                    //     print('Selected country: $suggestion');
                    //     addressVM.pincodeController.value.text = suggestion.toString();
                    //   },
                    // ),
                    TextField(
                      controller: typeController,
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
                      controller: nameController,
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
                      controller: mobileController,
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
                      controller: alternateMobileController,
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
                                hintText: addressVM.viewAddressResponseData.value.data![widget.index].pincode,
                                prefixIcon: Icon(Icons.pin_drop, color: AppColor.graniteGrayColor, size: 20.0),
                                hintStyle: TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
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
                              addressVM.viewAddressResponseData.value.data![widget.index].pincode = value.pincode.toString();
                              addressVM.viewAddressResponseData.value.data![widget.index].address = value.officeName.toString();
                              addressVM.viewAddressResponseData.value.data![widget.index].landmark = value.district.toString();
                              FocusScope.of(context).unfocus();
                            },
                            displayStringForOption: (PincodeData data) {
                              return "${addressVM.viewAddressResponseData.value.data![widget.index].pincode}";
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    TextField(
                      controller: addressController,
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
                      controller: landmarkController,
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
                      controller: emailController,
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
                          child: Obx(() => Container(
                            decoration: BoxDecoration(
                                color: AppColor.smokeyGrayColor,
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: RoundButton(
                              title: "Cancel",
                              loading: Loading.value,
                              buttonColor: AppColor.smokeyGrayColor,
                              onPress: () {
                                Navigator.of(context).pop({"": ""});
                              },),
                          ),),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Obx(() => Container(
                            decoration: BoxDecoration(
                                color: AppColor.deepSaffronColor,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: RoundButton(
                              title: "Save",
                              loading: addressVM.Loading.value,
                              onPress: () {
                                print(id.toString());
                                addressVM.editAddressApi(
                                    context,
                                    id.toString(),
                                    typeController.text.toString(),
                                    nameController.text.toString(),
                                    mobileController.text.toString(),
                                    alternateMobileController.text.toString(),
                                    addressController.text.toString(),
                                    landmarkController.text.toString(),
                                    emailController.text.toString(),
                                    pincodeController.text.toString(),
                                );
                                // addressVM.viewAddressResponseData.value.data![widget.index].type!,
                                // addressVM.viewAddressResponseData.value.data![widget.index].name!,
                                // addressVM.viewAddressResponseData.value.data![widget.index].mobile!,
                                // addressVM.viewAddressResponseData.value.data![widget.index].alternateMobile!,
                                // addressVM.viewAddressResponseData.value.data![widget.index].address!,
                                // addressVM.viewAddressResponseData.value.data![widget.index].landmark!,
                                // addressVM.viewAddressResponseData.value.data![widget.index].email!,
                                // addressVM.viewAddressResponseData.value.data![widget.index].pincode!
                              },),
                          ),),
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
