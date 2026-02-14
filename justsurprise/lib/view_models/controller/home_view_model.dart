import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:justsurprise/model/shipping_data_response_model.dart';
import 'package:justsurprise/model/shipping_time_response_model.dart';

import '../../repository/ApiRepository.dart';
import '../../utils/utils.dart';

class HomeViewModel extends GetxController {
  final _api = ApiRepository();
  RxInt selectTab = 0.obs;
  RxString imagePath = ''.obs;
  final ShippingResponseData = ShippingDataResponseModel().obs;
  final ShippingTimeResponseData = ShippingTimeDataResponseModel().obs;

  void ShippingResponse(ShippingDataResponseModel responseModel) {
    ShippingResponseData.value = responseModel;
  }

  void ShippingTimeResponse(ShippingTimeDataResponseModel responseModel) {
    ShippingTimeResponseData.value = responseModel;
  }

  void setSelectedTab(int selectedTab) {
    selectTab.value = selectedTab;
  }

  Future<void> ShippingResponseApi(BuildContext context) async {
    _api.ShippingApi().then((value) {
      if (value.status == 1) {
        ShippingResponse(value);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    },).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }

  Future<void> ShippingTimeResponseApi(BuildContext context) async {
    _api.ShippingTimeApi().then((value) {
      if (value.status == 1) {
        ShippingTimeResponse(value);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    },).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }

}