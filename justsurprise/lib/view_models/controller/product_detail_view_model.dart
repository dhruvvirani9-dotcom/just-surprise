import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/may_also_like_response_model.dart';
import 'package:justsurprise/model/pincode_check_response_model.dart';
import 'package:justsurprise/model/pincode_response_model.dart';
import 'package:justsurprise/model/product_detail_response_model.dart';
import 'package:justsurprise/model/product_review_response_model.dart';
import 'package:justsurprise/model/recent_product_add_response_model.dart';
import 'package:justsurprise/model/recent_product_view_response_model.dart';
import 'package:justsurprise/repository/ApiRepository.dart';
import 'package:justsurprise/utils/utils.dart';

class ProductDetailViewModel extends GetxController {
  final _api = ApiRepository();
 // RxString radioButtonValue = "With Egg".obs;
  RxString radioButtonValue = "".obs;
  RxBool isConnected = false.obs;
  RxString deliveryDate = ''.obs;
  final productDetailResponseData = ProductDetailResponseModel().obs;
  final productReviewResponseData = ProductReviewResponseModel().obs;
  final pincodeCheckApiResponseData = PincodeCheckResponseModel().obs;
  final recentProduceViewResponseData = RecentProductViewResponseModel().obs;
  final mayAlsoLikeResponseData = MayAlsoLikeResponseModel().obs;
  final recentProductAddResponseData = RecentProductAddResponseModel().obs;
  RxBool isChecked = false.obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRadioText(String value) {
    radioButtonValue.value = value;
  }

  void setProductDetail(ProductDetailResponseModel responseModel) {
    productDetailResponseData.value = responseModel;
  }

  void setProductReview(ProductReviewResponseModel responseModel) {
    productReviewResponseData.value = responseModel;
  }

  void setRecentProductView(RecentProductViewResponseModel responseModel) {
    recentProduceViewResponseData.value = responseModel;
  }

  void setMayAlsoLike(MayAlsoLikeResponseModel responseModel) {
    mayAlsoLikeResponseData.value = responseModel;
  }

  void setRecentProductAdd(RecentProductAddResponseModel responseModel) {
    recentProductAddResponseData.value = responseModel;
  }

  void setPincodeCheck(PincodeCheckResponseModel responseModel){
    pincodeCheckApiResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> productDetailApi(BuildContext context, String id) async {
    Map data = {
      "id" : id,
    };
    print(data);
    _api.productDetailApi(data).then((value) async {
      print("start");
      if (value.status == 1) {
        print("in if");
        setProductDetail(value);
        print("middele");
        productReviewApi(context, id);
        print("end");
      } else {
        print("in else");
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      print("error:-$error");
      print("error:-$stackTrace");
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> productReviewApi(BuildContext context, String id) async {
    Map data = {
      "id" : id,
    };
    _api.productReviewApi(data).then((value) async {
      if (value.status == 1) {
        setProductReview(value);
      }
      recentProductViewApi(context, id);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> recentProductViewApi(BuildContext context, String id) async {
    Map data = {
      "page" : "1",
    };
    _api.recentProductViewApi(data).then((value) async {
      setRecentProductView(value);
      mayAlsoLikeApi(context, id);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> mayAlsoLikeApi(BuildContext context, String id) async {
    Map data = {
      "id" : id,
      "page" : "1",
    };
    _api.mayAlsoLikeApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      if (value.status == 1) {
        setMayAlsoLike(value);
      }
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> recentProductAddApi(BuildContext context, String id) async {
    setRxRequestStatus(Status.LOADING);
    Map data = {
      "product_id" : id,
    };
    _api.recentProductAddApi(data).then((value) async {
      if (value.status == 1) {
        setRecentProductAdd(value);
        productDetailApi(context, id);
        setRxRequestStatus(Status.COMPLETED);
      } else {
        Utils.flushBarErrorMessage(value.message!, context);
      }
    }).onError((error, stackTrace) {
      print(error);
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> pincodeCheckApi(BuildContext context, String product_id, String pincode)async {
    Map data = {
      "product_id" : product_id,
      "pincode" : pincode,
    };
    _api.pincodeCheckApi(data).then((value) {
      setPincodeCheck(value);
    },).onError((error, stackTrace) {

    },);

  }
}

class selectdMethod extends GetxController {
  var selectdMethodType = "".obs;
  var selectdPriceType = "".obs;
  onChanged(var type){
    selectdMethodType.value = type;
    selectdPriceType.value = type;
  }
}

class selectdTime extends GetxController {
  var selectdTimeType = "".obs;
  onChanged(var type){
    selectdTimeType.value = type;
  }
}