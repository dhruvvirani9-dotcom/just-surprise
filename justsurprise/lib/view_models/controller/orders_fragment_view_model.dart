import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:justsurprise/model/delete_order_response_model.dart';
import 'package:justsurprise/model/view_order_response_model.dart';
import 'package:justsurprise/repository/ApiRepository.dart';

import '../../data/response/status.dart';
import '../../utils/utils.dart';
import 'add_delivery_reviews_view_model.dart';

class OrdersFragmentViewModel extends GetxController {
  final _api = ApiRepository();
  RxBool isConnected = false.obs;
  final rxRequestStatus = Status.LOADING.obs;
  final viewOrderResponseData = ViewOrderResponseModel().obs;
  final deleteOrderResponseData = DeleteOrderResponseModel().obs;
  final addDeliveryReviewsVM = AddDeliveryReviewsViewModel().obs;
  final DescriptionController2 = TextEditingController().obs;
  final orderData = <OrderData>[].obs;
  final totalPage = 1.obs;
  final currentPage = "1".obs;
  RxDouble Rating2 = 0.0.obs;


  void setViewOrder(ViewOrderResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      orderData.clear();
    }
    totalPage.value = responseModel.totalPage!;
    currentPage.value = responseModel.currentPage!;
    if(responseModel.orderData != null && responseModel.orderData!.isNotEmpty){
      for (var i = 0; i < responseModel.orderData!.length; i++) {
        orderData.add(responseModel.orderData![i]);
      }
    }
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  void setDeleteOrder(DeleteOrderResponseModel responseModel){
    deleteOrderResponseData.value = responseModel;
  }

  void setAddDeliveryReviews(AddDeliveryReviewsViewModel responseModel){
    addDeliveryReviewsVM.value = responseModel;
  }

  Future<void> viewOrderApi(BuildContext context, int page) async{
    Map data = {
      "page" : page.toString()
    };
    print("viewOrderApi:-$page");
    _api.viewOrderApi(data).then((value) {
      setViewOrder(value);
      setRxRequestStatus(Status.COMPLETED);
    },).onError((error, stackTrace) {
      print("viewOrderApierror:-$error");
      Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }
  
  Future<void> deleteOrderApi(BuildContext context , String id ,int index) async {
    Map data = {
      "id" : id,
    };
    _api.deleteOrderApi(data).then((value) {
      setDeleteOrder(value);
      orderData.removeAt(index);
      orderData.refresh();
      Utils.flushBarErrorMessage(value.message.toString(), context);
    },).onError((error, stackTrace) {
      print(error);
    },);
  }

  Future<void> addDeliveryReviewsApi(BuildContext context,String order_id, String rating, String description) async{
    Map data = {
      "order_id" : order_id,
      "rating" : rating,
      "description" : description,
    };
    _api.addDeliveryReviewsApi(data).then((value) {
      setAddDeliveryReviews(value);
      print(value.message);
      Utils.flushBarErrorMessage(value.message!, context);
      print(value.message);
    },).onError((error, stackTrace) {
      // Utils.flushBarErrorMessage(error.toString(), context);
    },);

  }

}
