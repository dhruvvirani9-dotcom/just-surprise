import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/add_order_response_model.dart';
import 'package:justsurprise/model/delete_cart_response_model.dart';
import 'package:justsurprise/model/view_cart_response_model.dart';
import 'package:justsurprise/repository/ApiRepository.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/checkout_view_model.dart';

class CartFragmentViewModel extends GetxController {
  final _api = ApiRepository();
  RxBool isConnected = false.obs;
  final viewCartResponseData = ViewCartResponseModel().obs;
  final rxRequestStatus = Status.LOADING.obs;
  final deleteCartResponseData = DeleteCartResponseModel().obs;
  final addOrderResponseData = AddOrderResponseModel().obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final mobileNoController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final checkoutViewModel = CheckoutViewModel();


  void setViewCart(ViewCartResponseModel responseModel) {
    viewCartResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  void setDeleteCartDetail(DeleteCartResponseModel responseModel) {
    deleteCartResponseData.value = responseModel;
  }

  void setAddOrderDetails(AddOrderResponseModel responseModel) {
    addOrderResponseData.value = responseModel;
  }

  Future<void> viewCartApi(BuildContext context) async {
    _api.viewCartApi().then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      setViewCart(value);
      // Utils.flushBarErrorMessage(value.message!, context);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> deleteCartApi(BuildContext context ,int index, String id) async {
    Map data = {
      "id" : id,
    };
    _api.deleteCartApi(data).then((value) {
      if(value.status == 1){
        setDeleteCartDetail(value);
        viewCartResponseData.value.cartViewData?.removeAt(index);
        viewCartResponseData.refresh();
        Utils.flushBarErrorMessage(value.message!, context);
      }else{
        Utils.flushBarErrorMessage(value.message!, context);
      }
    },).onError((error, stackTrace) {
      print(error.toString());
      Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }

  Future<void> addOrderApi(BuildContext context,String product_ids ,String total_amount,String occasion ,String sender_name ,String sender_email ,String sender_mobile,String sender_city, String payment_type ,String address_id, String cart_id) async{
    rxRequestStatus.value = Status.LOADING;
    Map data = {
      "product_ids" : product_ids,
      "total_amount" : total_amount,
      "discount_price" : "0",
      "occasion" : occasion,
      "sender_name" : sender_name,
      "sender_email" : sender_email,
      "sender_mobile" : sender_mobile,
      "sender_city" : sender_city,
      "order_status" : "0",
      "payment_status" : "0",
      "payment_type" : payment_type,
      "address_id" : address_id,
      "cart_id" : cart_id,
    };
    _api.addOrderApi(data).then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      if(value.status == 1){
        setAddOrderDetails(value);
        if(payment_type == "0"){
          print("pay1");
          checkoutViewModel.startTransaction(checkoutViewModel.callBackUrl, checkoutViewModel.packageName, context ,viewCartResponseData.value.totalPrice.toString());
        }
        nameController.value.clear();
        emailController.value.clear();
        mobileNoController.value.clear();
        cityController.value.clear();
        Get.offNamed(RoutesName.thankYouScreen);
        Utils.flushBarErrorMessage(value.message!, context);
      }else{
        Utils.flushBarErrorMessage(value.message!, context);
      }
    },).onError((error, stackTrace) {
      rxRequestStatus.value = Status.COMPLETED;
      print(error.toString());
      Utils.flushBarErrorMessage("Select Address & Payment Method", context);
    },);
  }
}

class RadioButton extends GetxController {
  var selectedButton = "".obs;

  onchangedRadio(var Radio){
    selectedButton.value = Radio;
  }
}

class paymentType extends GetxController {
  var selectType = "".obs;

  onChanged(var type){
    selectType.value = type;
  }
}
