import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:justsurprise/model/find_gift_response_model.dart';
import 'package:justsurprise/model/gift_type_response_model.dart';
import 'package:justsurprise/model/just_surprise_response_model.dart';
import 'package:justsurprise/model/occasion_response_model.dart';
import '../../data/response/status.dart';
import '../../repository/ApiRepository.dart';
import 'package:flutter/material.dart';
import '../../res/app_url/app_url.dart';
import '../../utils/shared_preferences_services.dart';
import '../../utils/utils.dart';
import 'package:http/http.dart' as http;

class JustFragmentViewModel extends GetxController {
  final _api = ApiRepository();
  RxBool isConnected = false.obs;
  RxString selectedPincodeValue = "".obs;
  RxString sortingValue = "Recommended".obs;
  final justSurpriseResponseData = JustSurpriseResponseModel().obs;
  final occasionResponseData = OccasionResponseModel().obs;
  final giftTypeResponseData = GiftTypeResponseModel().obs;
  final rxRequestStatus = Status.LOADING.obs;
  final suggestionController = TextEditingController().obs;
  final selectDeliveryController = TextEditingController().obs;
  final searchController = TextEditingController().obs;
  RxInt? occasionId = 0.obs;
  RxInt? giftTypeId = 0.obs;
  RxBool isLoading = false.obs;

  void setJustSurpriseDetail(JustSurpriseResponseModel responseModel) {
    justSurpriseResponseData.value = responseModel;
  }

  void occasionDetail(OccasionResponseModel responseModel) {
    occasionResponseData.value = responseModel;
  }

  void giftTypeDetail(GiftTypeResponseModel responseModel) {
    giftTypeResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> justSurpriseApi(BuildContext context) async {
    _api.justSurpriseApi().then((value) async {
      if (value.status == 1) {
        setJustSurpriseDetail(value);
        occasionApi(context);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> occasionApi(BuildContext context) async {
    _api.occasionApi().then((value) async {
      if (value.status == 1) {
        occasionDetail(value);
        giftTypeApi(context);

      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> giftTypeApi(BuildContext context) async {
    _api.giftTypeApi().then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if (value.status == 1) {
        giftTypeDetail(value);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }


}
