import 'package:get/get.dart';
import 'package:justsurprise/model/category_response_model.dart';
import '../../data/response/status.dart';
import '../../repository/ApiRepository.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class CategoriesViewModel extends GetxController {
  final _api = ApiRepository();
  RxBool isConnected = false.obs;
  final categoryResponseData = CategoryResponseModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setCategoryDetail(CategoryResponseModel responseModel) {
    categoryResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> categoryApi(BuildContext context) async {
    Map data = {
      "cat_page" : "1"
    };
    _api.categoryApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if(value.status == 1) {
        setCategoryDetail(value);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}

