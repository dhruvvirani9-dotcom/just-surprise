import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/add_address_response_model.dart';
import 'package:justsurprise/repository/ApiRepository.dart';
import 'package:flutter/material.dart';
import 'package:justsurprise/utils/utils.dart';

class AddAddressViewModel extends GetxController {
  final _api = ApiRepository();
  final addAddressResponseData = AddAddressResponseModel().obs;
 // final editResponseData = EditResponseModel().obs;
  final typeController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final alternateMobileController = TextEditingController().obs;
  // final addressController = TextEditingController().obs;
  // final landmarkController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  RxString pinCodeController = "".obs;
  RxString pinCodeAddress = "".obs;
  RxString pinCodeLandmark = "".obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setAddAddressDetail(AddAddressResponseModel responseModel) {
    addAddressResponseData.value = responseModel;
  }

  // void setEditAddressDetail(EditResponseModel responseModel) {
  //   editResponseData.value = responseModel;
  // }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> addAddressApi(BuildContext context) async {
    Map data = {
      "type" : typeController.value.text,
      "name" : nameController.value.text,
      "mobile" : mobileController.value.text,
      "alternate_mobile" : alternateMobileController.value.text,
      "address" : pinCodeAddress.value,
      "landmark" : pinCodeLandmark.value,
      "email" : emailController.value.text,
      "pincode" : pinCodeController.value,
    };
    print(data);
    _api.addAddressApi(data).then((value) async {
      if(value.status == 1) {
        setAddAddressDetail(value);
        Navigator.of(context).pop({"selection": ""});
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  // Future<void> editAddressApi(BuildContext context, String id, String type, String name, String mobile, String alterNetMobile, String address, String landMark, String email, String pinCode, String isDefault) async {
  // Map data = {
  //   "id" : id,
  //   "type" : type,
  //   "name" : name,
  //   "mobile" : mobile,
  //   "alternate_mobile" : alterNetMobile,
  //   "address" : address,
  //   "landmark" : landMark,
  //   "email" : email,
  //   "pincode" : pinCode,
  //   "is_default" : isDefault,
  // };
  // _api.editAddressApi(data).then((value) async {
  //   if(value.status == 1) {
  //     setEditAddressDetail(value);
  //   } else {
  //     Utils.flushBarErrorMessage(value.message!, context);
  //   }
  // }).onError((error, stackTrace) {
  //   Utils.flushBarErrorMessage(error.toString(), context);
  // });
  // }
}
