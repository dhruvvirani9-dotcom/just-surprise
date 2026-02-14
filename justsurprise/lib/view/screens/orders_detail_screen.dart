import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/assets/image_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/orders_detail_view_model.dart';

import '../../view_models/controller/cart_fragment_view_model.dart';

class OrdersDetailScreen extends StatefulWidget {
  const OrdersDetailScreen({super.key});

  @override
  State<OrdersDetailScreen> createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<OrdersDetailScreen> {
  final ordersDetailVM = Get.put(OrdersDetailViewModel());
  final cartVM = Get.put(CartFragmentViewModel());
  ImagePickerController imagePicker = Get.put(ImagePickerController());
  int index = 0;
  final _formKey = GlobalKey<FormState>();

  void onChanged(){
    if(_formKey.currentState!.validate()){
      print("ok");
      Get.back();
      ordersDetailVM.addProductReviewsApi(context,
          ordersDetailVM.orderDetailResponseData.value.productData![index].categoryId.toString(),
          ordersDetailVM.orderDetailResponseData.value.productData![index].id.toString(),
          ordersDetailVM.Rating1.value.toString(),
          imagePicker.imapgePath.value,
          ordersDetailVM.TitleController.value.text.toString(),
          ordersDetailVM.DescriptionController1.value.text.toString(),
          ordersDetailVM.orderDetailResponseData.value.orderData!.senderCity.toString(),
          ordersDetailVM.orderDetailResponseData.value.orderData!.occasion.toString()
      );
      ordersDetailVM.TitleController.value.clear();
      ordersDetailVM.DescriptionController1.value.clear();
      ordersDetailVM.Rating1.value = 0.0;
      imagePicker.imapgePath.value = "";
    }else{
      print("Erorr");
    }
  }


  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    ordersDetailVM.isConnected.value = await Utils.isConnected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("Orders Details", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ),
      body: Obx(() => ordersDetailVM.isConnected.value ? SafeArea(
          child: Container(
            color: AppColor.whiteColor,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                              return Container(
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image(image: NetworkImage(Utils.imageUrl+ordersDetailVM.orderDetailResponseData.value.productData![index].image!), width: 80.0, height: 80.0)),
                                            const SizedBox(width: 5.0),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(right: 10.0),
                                                    child: Container(
                                                        width: 210,
                                                        child: Text(ordersDetailVM.orderDetailResponseData.value.productData![index].productName.toString(), style: TextStyle(color: AppColor.blackEelColor,fontFamily: "Kanit"))),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  // Text("₹ 449 X 1     Eggless", style: TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit"))
                                                  ordersDetailVM.orderDetailResponseData.value.productData![index].indicator! == "0" ?
                                                  Text("₹ ${ordersDetailVM.orderDetailResponseData.value.productData![index].price!} X 1", style: const TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")) :
                                                  ordersDetailVM.orderDetailResponseData.value.productData![index].indicator! == "1" ?
                                                  Text("₹ ${ordersDetailVM.orderDetailResponseData.value.productData![index].price!} X 1 Eggless", style: const TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")) :
                                                  ordersDetailVM.orderDetailResponseData.value.productData![index].indicator! == "2" ?
                                                  Text("₹ ${ordersDetailVM.orderDetailResponseData.value.productData![index].price! } X 1 With Egg", style: const TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")) :
                                                  const SizedBox(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                ReviewsDialog(index);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                alignment: Alignment.center,
                                                backgroundColor: AppColor.deepSaffronColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0)
                                                )
                                              ),
                                              child:Text("Product Feedback", textAlign: TextAlign.center, style: const TextStyle(color: AppColor.whiteColor, fontSize: 16, fontWeight: FontWeight.w700, fontFamily: "ProductSans"))),
                                            // ${ordersDetailVM.orderDetailResponseData.value.productData![index].id}
                                        ),
                                        SizedBox(height: 10,),
                                      ],
                                    ),
                                    // Align(
                                    //   alignment: Alignment.topRight,
                                    //   child: Container(
                                    //     padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
                                    //     decoration: BoxDecoration(
                                    //         border: Border.all(color: AppColor.carbonGreyColor, width: 1.0),
                                    //         borderRadius: BorderRadius.circular(5.0)
                                    //     ),
                                    //     child: const Text("Delete", style: TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")),
                                    //   ),
                                    // ),
                                    SizedBox(height: 90),
                                  ],
                                ),
                              );
                            },
                              itemCount: ordersDetailVM.orderDetailResponseData.value.productData?.length,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(image: AssetImage(IconAssets.location), width: 25.0, height: 25.0),
                                    SizedBox(width: 5.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Delivery to", style: TextStyle(color: AppColor.carbonGrayColor, fontSize: 16, fontFamily: "Kanit")),
                                        Text(ordersDetailVM.orderDetailResponseData.value.orderData!.senderName.toString(), style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                                        Container(
                                          width: 250,
                                            child: Text(ordersDetailVM.orderDetailResponseData.value.addressData!.address.toString(), style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit"))),
                                        Text("Mobile: ${ordersDetailVM.orderDetailResponseData.value.orderData!.senderMobile.toString()}", style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                            //   decoration: BoxDecoration(
                            //       color: AppColor.alabasterColor,
                            //       borderRadius: BorderRadius.circular(7.0),
                            //       border: Border.all(color: AppColor.grayChateauColor, width: 1.0)
                            //   ),
                            //   child: const Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Image(image: AssetImage(IconAssets.star), width: 20.0, height: 20.0),
                            //           SizedBox(width: 10.0),
                            //           Text("Select Occasion", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                            //         ],
                            //       ),
                            //       Icon(Icons.arrow_forward_ios_outlined, color: AppColor.blackEelColor, size: 14.0)
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(height: 10.0),
                            // Container(
                            //   padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                            //   decoration: BoxDecoration(
                            //       color: AppColor.alabasterColor,
                            //       borderRadius: BorderRadius.circular(7.0),
                            //       border: Border.all(color: AppColor.grayChateauColor, width: 1.0)
                            //   ),
                            //   child: const Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Image(image: AssetImage(IconAssets.envelopeEmailIcon), width: 20.0, height: 20.0),
                            //           SizedBox(width: 10.0),
                            //           Text("Free Message Card", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                            //         ],
                            //       ),
                            //       Icon(Icons.arrow_forward_ios_outlined, color: AppColor.blackEelColor, size: 14.0)
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(height: 10.0),
                            // Container(
                            //   padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                            //   decoration: BoxDecoration(
                            //       color: AppColor.alabasterColor,
                            //       borderRadius: BorderRadius.circular(7.0),
                            //       border: Border.all(color: AppColor.grayChateauColor, width: 1.0)
                            //   ),
                            //   child: const Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Image(image: AssetImage(IconAssets.birthdayCake), width: 20.0, height: 20.0),
                            //           SizedBox(width: 10.0),
                            //           Text("Message On cake", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                            //         ],
                            //       ),
                            //       Icon(Icons.arrow_forward_ios_outlined, color: AppColor.blackEelColor, size: 14.0)
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Sender Details", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            const Text("It is a long established fact that a reader will be distracted by the readable content.", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                            const SizedBox(height: 10.0),
                            Text("${ordersDetailVM.orderDetailResponseData.value.orderData!.senderName.toString()}, ${ordersDetailVM.orderDetailResponseData.value.orderData!.senderMobile.toString()}", style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                            const SizedBox(height: 5.0),
                            Text(ordersDetailVM.orderDetailResponseData.value.orderData!.senderEmail.toString(), style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                            const SizedBox(height: 5.0),
                            Text("${ordersDetailVM.orderDetailResponseData.value.orderData!.senderCity.toString()}, ${ordersDetailVM.orderDetailResponseData.value.addressData!.pincode.toString()} ", style: TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                            const SizedBox(height: 20.0),
                            const Text("Price Details", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                            const SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Product Price", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                Text("₹ ${ordersDetailVM.orderDetailResponseData.value.allProductPrice.toString()}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text("Delivery Charges", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                Text("₹ ${ordersDetailVM.orderDetailResponseData.value.extraChargeData!.shippingCharge.toString()}", style: TextStyle(color: AppColor.mediumGreenColor, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Convenience Charge", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                Text("₹ ${ordersDetailVM.orderDetailResponseData.value.extraChargeData!.convenienceCharge.toString()}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Image(image: AssetImage(ImageAssets.horizontalLine)),
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total", style: TextStyle(color: AppColor.eerieBlackColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                            Text("₹ ${ordersDetailVM.orderDetailResponseData.value.totalPrice.toString()}", style: TextStyle(color: AppColor.portlandOrangeColor, fontSize: 15, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Image(image: AssetImage(ImageAssets.horizontalLine)),
                      // const SizedBox(height: 15.0),
                      // const Align(alignment: Alignment.center, child: Text("Have a Discount Coupon?", style: TextStyle(color: AppColor.clearBlueColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w400))),
                      // const SizedBox(height: 15.0),
                      // const Divider(color: AppColor.silverColor, thickness: 0.5, height: 0.0),
                      // const SizedBox(height: 10.0),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 15.0, bottom: 100.0),
                      //   child: RichText(
                      //     text: const TextSpan(
                      //       text: "By continuing you agree to our. ", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300),
                      //       children: <TextSpan>[
                      //         TextSpan(text: "T&C/Disclaimer", style: TextStyle(color: AppColor.azureColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     width: Get.width,
                //     padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                //     color: AppColor.deepSaffronColor,
                //     child: const Text("Proceed to Pay", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 18, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                //   ),
                // )
              ],
            ),
          ),
        ) :
      Center(
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
      ))
    );
  }

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        ordersDetailVM.deliveryDate.value = '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
        final fullDateTime = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
        final format = DateFormat.jm();
        var time = format.format(fullDateTime);
        ordersDetailVM.deliveryTime.value = time;
      }
    }
  }

  Future<void> ReviewsDialog(var index) async{
    return showDialog(context: context, builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        child: Container(
          height: 495,
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
                      child: Text("Product Feedback",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                    CloseButton(),
                  ],
                ),
                Divider(),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Title :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                    )
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                        ]),
                        controller: ordersDetailVM.TitleController.value,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
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
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Image :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                          )
                      ),
                      Obx(() {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.whiteSmokeColor,
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(color: AppColor.cloudColor, width: 1.0)
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                          onTap: () async {
                                            imagePicker.getImage();
                                          },
                                          child: Text("Choose File")
                                      ),
                                    ),
                                    const VerticalDivider(color: AppColor.cloudColor, thickness: 1.0),
                                    Expanded(
                                      child: TextFormField(
                                        enabled: false,
                                        style: TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 13.0),
                                        decoration: InputDecoration(
                                            hintText: "${imagePicker.imapgePath.toString()}",
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                            )
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Image(image: AssetImage(IconAssets.close), width: 20.0, height: 20.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Product Rating :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                                )
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RatingStars(
                                maxValue: 5,
                                value: ordersDetailVM.Rating1.value,
                                onValueChanged: (value) {
                                  ordersDetailVM.Rating1.value = value;
                                  print(value);
                                },
                                starSize: 25,
                                starColor: AppColor.deepSaffronColor,
                                starOffColor: Colors.grey,
                              ),
                            ),
                          ],
                        );
                      }),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Message :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                          )
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required")
                        ]),
                        controller: ordersDetailVM.DescriptionController1.value,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2
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
                      // Image(image: image)
                    ],
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
