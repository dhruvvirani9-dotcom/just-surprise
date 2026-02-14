import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/model/add_cart_response_model.dart';
import 'package:justsurprise/view/fragments/cart.dart';
import 'package:justsurprise/view_models/controller/addon_response_model.dart';
import 'package:justsurprise/view_models/controller/product_detail_view_model.dart';
import '../../repository/ApiRepository.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import 'home_view_model.dart';

class MakeItExtraSpecialViewModel extends GetxController {
  final _api = ApiRepository();
  RxBool isConnected = false.obs;
  final addonResponseData = AddoneResponseModel().obs;
  RxBool isSearchLoading = false.obs;
  RxBool checkboxValue = false.obs;
  final addCartResponsedata = AddCartResponseModel().obs;
  final homeVM = Get.find<HomeViewModel>();
  final productDetailVM = Get.find<ProductDetailViewModel>();
  final methodController = Get.find<selectdMethod>();
  final timeController = Get.find<selectdTime>();
  final addonProductData = <ProductData>[].obs;
  int page = 1;
  RxBool isBottom = false.obs;
  final totalPage = 1.obs;
  final currentPage = "1".obs;

  void addon(AddoneResponseModel responseModel) {
    // for (var i = 0; i < responseModel.productData!.length; i++) {
    //   print("befor:-${responseModel.productData![i].quantity}");
    //
    //   print("after:-${responseModel.productData![i].quantity}");
    // }
    // addonResponseData.value = responseModel;

    if(int.parse(responseModel.currentPage!) == 1){
      addonProductData.clear();
    }
    totalPage.value = responseModel.totalPage!;
    currentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        responseModel.productData![i].quantity = 1;
        addonProductData.add(responseModel.productData![i]);
      }
    }


  }

  void addCartResponce(AddCartResponseModel responseModel) {
    addCartResponsedata.value = responseModel;
  }

  Future<void> addonApi(BuildContext context, int page) async {
    Map data = {
      "product_page" : page.toString(),
    };
    isSearchLoading.value = true;
    checkboxValue.value = false;
    _api.addon(data).then((value) {
      isSearchLoading.value = false;
      addon(value);
      print(value);
    },).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }

  Future<void> addCartApi(bool isAddon,BuildContext context,String datetime ,String product_id, String shipping_method, String shipping_price, String shipping_slot_time) async {
    Map data = {
      "product_id" : product_id,
      "quantity" : "1",
      "delivery_date_time" : datetime,
      "shipping_method" : shipping_method,
      "shipping_price" : shipping_price,
      "shipping_slot_time" : shipping_slot_time,
    };
    isSearchLoading.value = true;
    _api.addCart(data).then((value) {
      if(!isAddon){
        Get.offNamed(RoutesName.cartFragmentScreen);
        isSearchLoading.value = false;
        addCartResponce(value);
        Utils.flushBarErrorMessage(addCartResponsedata.value.message!, context);
        methodController.selectdMethodType.value = "";
        timeController.selectdTimeType.value = "";
        productDetailVM.deliveryDate.value = "";
        productDetailVM.pincodeCheckApiResponseData.value.message == null;
      }

      // homeVM.selectTab.value = 1;
    },).onError((error, stackTrace) {
      isSearchLoading.value = false;
     // print(error.toString());
     // Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }

  Future<void> addonCartApi(int? quantity,bool isAddon,BuildContext context,String datetime ,String product_id, String shipping_method, String shipping_price, String shipping_slot_time) async {
    Map data = {
      "product_id" : product_id,
      "quantity" : quantity.toString(),
      "delivery_date_time" : datetime,
      "shipping_method" : shipping_method,
      "shipping_price" : shipping_price,
      "shipping_slot_time" : shipping_slot_time,
    };
    isSearchLoading.value = true;
    _api.addCart(data).then((value) {
      // homeVM.selectTab.value = 1;
    },).onError((error, stackTrace) {
      isSearchLoading.value = false;
      // print(error.toString());
      // Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }
}

class productSelected extends GetxController {
  var selectdType = "".obs;

  onChanged(var type){
    selectdType.value = type;
  }
}
