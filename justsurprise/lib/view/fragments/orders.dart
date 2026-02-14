import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/orders_fragment_view_model.dart';

import '../../data/response/status.dart';
import '../../view_models/controller/orders_detail_view_model.dart';

class OrdersFragment extends StatefulWidget {
  const OrdersFragment({super.key});

  @override
  State<OrdersFragment> createState() => _OrdersFragmentState();
}

class _OrdersFragmentState extends State<OrdersFragment> {
  final ordersVM = Get.put(OrdersFragmentViewModel());
  final ordersDetailVM = Get.put(OrdersDetailViewModel());
  final _formKey = GlobalKey<FormState>();
  final ScrollController _Controller = ScrollController();
  int page = 1;


  void onChanged(){
   if(_formKey.currentState!.validate()){
     print("ok");
     ordersVM.addDeliveryReviewsApi(context,
       ordersVM.orderData[index].id.toString(),
       ordersVM.Rating2.value.toString(),
       ordersVM.DescriptionController2.value.text.toString(),
     );
     Get.back();
     ordersVM.DescriptionController2.value.clear();
     ordersVM.Rating2.value = 0.0;
   }else{
     print("error");
   }
  }

  int index = 0;
  @override
  void initState() {
    super.initState();
    _checkConnection();
    ordersVM.viewOrderApi(context,page);
    _Controller.addListener(() {
      if(_Controller.position.maxScrollExtent == _Controller.offset){
        page++;
        if(page <= ordersVM.totalPage.value){
          print("onScroll:-$page");
          ordersVM.viewOrderApi(context,page);
        }
      }
    },);
  }

  Future<void> _checkConnection() async {
    ordersVM.isConnected.value = await Utils.isConnected();
  }

  manageBottomLoder(index1){
    if(int.parse(ordersVM.currentPage.value) == ordersVM.totalPage.value){
      return SizedBox(width: 0);
    }else{
      return index1 == ordersVM.orderData.length-1 ? Center(child: CircularProgressIndicator()) : SizedBox(width: 0);
    }
  }

  bool getIsLoading() {
    if(ordersVM.rxRequestStatus.value == Status.LOADING) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ordersVM.isConnected.value ? getIsLoading() ? Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.lavenderColor,
          automaticallyImplyLeading: false,
          title: const Text("Orders", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
          centerTitle: true,
          leading:  InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: AppColor.lavenderColor,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: const Image(image: AssetImage(IconAssets.threeVerticalLine), width: 28.0, height: 28.0),
            ),
          ),
        ),

        body: Container(
          color: AppColor.whiteColor,
          child: ListView.builder(
            controller: _Controller,
            itemBuilder: (context, index1) {
              if(ordersVM.orderData.length > 0){
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          color: AppColor.brightGrayColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap:() {
                              ordersDetailVM.orderDetailApi(context, ordersVM.orderData[index1].id.toString());
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Placed On: ", style: TextStyle(color: AppColor.doveGrayColor, fontSize: 18, fontFamily: "Kanit")),
                                        Text(ordersVM.orderData[index1].placeDate.toString(), style: TextStyle(color: AppColor.blackEelColor, fontSize: 18, fontFamily: "Kanit"))
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          ordersVM.deleteOrderApi(context, ordersVM.orderData[index1].id.toString() , index1);
                                        });
                                      },
                                      child: Container(
                                        height: 22,
                                        width: 22,
                                        child: Image(image: AssetImage(IconAssets.delete), width: 20.0, height: 20.0))
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Gift For: ", style: TextStyle(color: AppColor.doveGrayColor, fontSize: 18, fontFamily: "Kanit")),
                                        Text(ordersVM.orderData[index1].senderName.toString(), style: TextStyle(color: AppColor.blackEelColor, fontSize: 18, fontFamily: "Kanit"))
                                      ],
                                    ),
                                    ElevatedButton(onPressed: () {
                                      RatingDialog(index1);
                                    }, child: Text("Delivery Feedback",style: TextStyle(color: AppColor.whiteColor, fontFamily: "Kanit")),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.deepSaffronColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8)
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: AppColor.whiteColor,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 7.5,bottom: 7.5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          color: AppColor.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.1),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3), // changes position of shadow
                                            ),
                                          ]
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, right: 10.0, top: 15.0, bottom: 15.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image(
                                                    image: NetworkImage(Utils.imageUrl+ordersVM.orderData[index1].productData![index].image!), width: 80.0, height: 80.0)
                                            ),
                                          ),
                                          Expanded(child: Padding(
                                            padding: EdgeInsets.only(right: 10.0),
                                            child: Text(ordersVM.orderData[index1].productData![index].productName!, style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit")),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: ordersVM.orderData[index1].productData?.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    manageBottomLoder(index1)
                  ],
                );
              }else{
                return SizedBox(width: 0);
              }
            },
            itemCount: ordersVM.orderData.length,
          ),
        ),
    ) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)) :Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(IconAssets.noSignal), width: 80.0, height: 80.0),
          const SizedBox(height: 15.0),
          const Text('No internet connection', style: TextStyle(color: AppColor.blackColor, fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15.0),
          SizedBox(
            width: Get.width * 0.7,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shadowColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                onPressed: () {
                  _checkConnection();
                  },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(IconAssets.retry), width: 20.0, height: 20.0),
                    SizedBox(width: 5.0),
                    Text('Retry', style: TextStyle(color: AppColor.whiteColor, fontWeight: FontWeight.bold))
                  ],
                )
            ),
          )
        ],
      ),
    ));
  }

  Future<void> RatingDialog(var index) async{
    return showDialog(context: context, builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: Container(
          height: 310,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(10.0)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Delivery Feedback",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                    CloseButton(),
                  ],
                ),
                Divider(),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Product Rating :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                    )
                ),
                Obx(() {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: RatingStars(
                      maxValue: 5,
                      value: ordersVM.Rating2.value,
                      onValueChanged: (value) {
                        ordersVM.Rating2.value = value;
                        print(value);
                      },
                      starSize: 25,
                      starColor: AppColor.deepSaffronColor,
                      starOffColor: Colors.grey,
                    ),
                  );
                }),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Message :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                    )
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Required")
                    ]),
                    controller: ordersVM.DescriptionController2.value,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1
                          )
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: () {
                          onChanged();
                        }, child: Text("Submit",style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor:AppColor.deepSaffronColor,
                          ),
                        )
                    )
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}
