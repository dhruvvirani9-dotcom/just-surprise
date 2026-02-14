import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/add_address_response_model.dart';
import 'package:justsurprise/model/address_response_model.dart';
import 'package:justsurprise/model/delete_address_response_model.dart';
import 'package:justsurprise/model/edit_address_response_model.dart';
import 'package:justsurprise/model/pincode_response_model.dart';
import 'package:justsurprise/repository/ApiRepository.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/shared_preferences_services.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../../res/app_url/app_url.dart';

class AddressViewModel extends GetxController {
  final _api = ApiRepository();
  final viewAddressResponseData = AddressResponseModel().obs;
  final editResponseData = EditResponseModel().obs;
  final deleteResponseData = DeleteAddressResponseModel().obs;
  final addAddressResponseData = AddAddressResponseModel().obs;
  final pincodResponseData = PincodeResponseModel().obs;
  final pincodeController = TextEditingController().obs;
  final rxRequestStatus = Status.LOADING.obs;
  RxString pinCodeController = "".obs;
  RxString pinCodeAddress = "".obs;
  RxString pinCodeLandmark = "".obs;
  RxBool Loading = false.obs;

  void setViewAddressDetail(AddressResponseModel responseModel) {
    viewAddressResponseData.value = responseModel;
  }

  void setEditAddressDetail(EditResponseModel responseModel) {
    editResponseData.value = responseModel;
  }

  void setDeleteAddressDetail(DeleteAddressResponseModel responseModel) {
    deleteResponseData.value = responseModel;
  }

  void setAddAddressDetail(AddAddressResponseModel responseModel) {
    addAddressResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> viewAddressApi(BuildContext context,String id) async {
    Map data = {
      "id" : id,
    };
    _api.viewAddressApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if(value.status == 1) {
        setViewAddressDetail(value);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> editAddressApi(BuildContext context, String id, String type, String name, String mobile, String alterNetMobile, String address, String landMark, String email, String pinCode) async {

    String? token = await SharedPref.getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(AppUrl.editAddressApi));
    print(AppUrl.editAddressApi);
    print(token);
    var data = {
      "id" : id,
    "type" : type,
    "name" : name,
    "mobile" : mobile,
    "alternate_mobile" : alterNetMobile,
    "address" : address,
    "landmark" : landMark,
    "email" : email,
    "pincode" : pinCode
  };
    print(data);
    request.bodyFields = data;
    request.headers.addAll(headers);
    Loading.value = true;
    http.StreamedResponse response = await request.send();
    Loading.value = false;
    if(response.statusCode == 200){
      EditResponseModel responseJson = EditResponseModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      if(responseJson.status == 1){
        print(responseJson.status);
        print(responseJson.message);
        setEditAddressDetail(responseJson);
        // var addressmodel = viewAddressResponseData.value.data![index].updatedAt;
        Get.offAndToNamed(RoutesName.addressScreen);
        print(responseJson);
      }else{
        Utils.flushBarErrorMessage(responseJson.message!, context);
      }
    }else{
      print(response.reasonPhrase);
      Utils.flushBarErrorMessage(response.reasonPhrase.toString(), context);
    }

    // _api.editAddressApi(data).then((value) async {
    //   if(value.status == 1) {
    //     setEditAddressDetail(value);
    //   } else {
    //     Utils.flushBarErrorMessage(value.message!, context);
    //   }
    // }).onError((error, stackTrace) {
    //   print(error);
    //   Utils.flushBarErrorMessage(error.toString(), context);
    // });

  }

  Future<void> deleteAddressApi(BuildContext context, int index, String id) async {
    Map data = {
      "id" : id,
    };
    _api.deleteAddressApi(data).then((value) async {
      if (value.status == 1) {
        setDeleteAddressDetail(value);
        viewAddressResponseData.value.data?.removeAt(index);
        viewAddressResponseData.refresh();
        Utils.flushBarErrorMessage(value.message!, context);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<List<PincodeData>>? pincodeApi(BuildContext context, var pincode) {
    Map data = {
      "pincode" : pincode,
    };
    print("object1");
    _api.pincodeApi(data).then((value) {
      print("object2");
      pincodResponseData.value = value;
      print(value.status);
      print(value.message);
      // return pincodResponseData.value.pincodeData?.where((pincodeApi) {
      //   final nameLower = pincodeApi.officeName!.toLowerCase();
      //   final queryLower = pincodeController.value.text.toLowerCase();
      //   return nameLower.contains(queryLower);
      // },).toList();
    },).onError((error, stackTrace) {
      // return [];
      Utils.flushBarErrorMessage(error.toString(), context);
    },);
    return null;
  }
}