import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/faq_response_model.dart';
import 'package:justsurprise/repository/ApiRepository.dart';
import 'package:justsurprise/utils/utils.dart';

class FaqViewModel extends GetxController {
  final _api = ApiRepository();
  RxBool isExpanded = false.obs;
  RxInt selectedIndex = 0.obs;
  final faqResponseData = FaqResponseModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setFaqDetail(FaqResponseModel responseModel) {
    faqResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> faqApi(BuildContext context) async {
    _api.faqApi().then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if(value.status == 1) {
        setFaqDetail(value);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}