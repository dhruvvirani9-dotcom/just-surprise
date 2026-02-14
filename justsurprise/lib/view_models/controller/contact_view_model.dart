import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/contact_response_model.dart';
import 'package:justsurprise/repository/ApiRepository.dart';
import 'package:justsurprise/utils/utils.dart';

class ContactViewModel extends GetxController {
  final _api = ApiRepository();
  final contactResponseData = ContactResponseModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setContactDetail(ContactResponseModel responseModel) {
    contactResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> contactApi(BuildContext context) async {
    _api.contactApi().then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if(value.status == 1) {
        setContactDetail(value);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}