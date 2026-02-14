import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/assets/image_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/home_view_model.dart';
import 'package:justsurprise/view_models/controller/product_detail_view_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../view_models/controller/just_fragment_view_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final productDetailVM = Get.put(ProductDetailViewModel());
  final homeVM = Get.find<HomeViewModel>();
  final _formKey = GlobalKey<FormState>();
  final methodController = Get.put(selectdMethod());
  final timeController = Get.put(selectdTime());
  final justSurpriseVM = Get.find<JustFragmentViewModel>();
  final pincodeController = TextEditingController(text: JustFragmentViewModel().selectedPincodeValue.value.toString()).obs;
  bool isChecked = false;
  var Period = "";
  var Month = "";
  var date = "";
  int id = 0;



  void onChanged(){
    if(_formKey.currentState!.validate()){
      print("ok");
      Get.offAndToNamed(RoutesName.makeItExtraSpecialScreen);
    }else{
      print("Erorr");
    }
  }

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      id = Get.arguments;
    }
    homeVM.ShippingResponseApi(context);
    homeVM.ShippingTimeResponseApi(context);
    productDetailVM.productDetailApi(context, id.toString());
  }

  months(var pickedDate){
    if(pickedDate!.month == 01){
      return Month = "Jan";
    } else if(pickedDate!.month == 2){
      return Month = "Feb";
    } else if(pickedDate!.month == 3){
      return Month = "Mar";
    } else if(pickedDate!.month == 4){
      return Month = "Apr";
    } else if(pickedDate!.month == 5){
      return Month = "May";
    } else if(pickedDate!.month == 6){
      return Month = "Jun";
    } else if(pickedDate!.month == 7){
      return Month = "Jul";
    } else if(pickedDate!.month == 8){
      return Month = "Aug";
    } else if(pickedDate!.month == 9){
      return Month = "Sep";
    } else if(pickedDate!.month == 10){
      return Month = "Oct";
    } else if(pickedDate!.month == 11){
      return Month = "Nov";
    } else if(pickedDate!.month == 12){
      return Month = "Dec";
    }
  }

  dates(var pickedDate){
    if(pickedDate == 01 || pickedDate == 02 || pickedDate == 03 ||  pickedDate == 04 ||  pickedDate == 05 ||  pickedDate == 06 ||  pickedDate == 07 ||  pickedDate == 08 ||  pickedDate == 09){
      return date = "0";
    } else {
      return date = "";
    }
  }

  bool getIsLoading() {
    if(productDetailVM.rxRequestStatus.value == Status.LOADING) {
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(text: productDetailVM.deliveryDate.value).obs;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.blackEelColor),
        title: const Image(image: AssetImage(ImageAssets.justSurprise), width: 120.0, height: 40.0),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  radius: 3,
                  colors: [
                    AppColor.catskillWhiteColor,
                    AppColor.lavenderMistColor,
                    AppColor.ghostColor
                  ]
              )
          ),
        ),
        actions: [
          IconButton(icon: const Image(image: AssetImage(IconAssets.search), color: AppColor.graniteGrayColor, width: 25.0, height: 25.0),
            onPressed: () {},
          )
        ],
      ),
      body: Obx(() => getIsLoading() ? productDetailVM.productDetailResponseData.value.productData != null ? SafeArea(
        child: Container(
          color: AppColor.whiteColor,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image(image: NetworkImage(Utils.imageUrl + productDetailVM.productDetailResponseData.value.productData!.image!)),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  print(productDetailVM.productDetailResponseData.value.productData!.shareUrl!);
                                  Share.share(productDetailVM.productDetailResponseData.value.productData!.shareUrl!);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    color: AppColor.whiteColor,
                                    shape: BoxShape.circle
                                  ),
                                  child: const Image(image: AssetImage(IconAssets.share), width: 20.0, height: 20.0),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              // Container(
                              //   padding: const EdgeInsets.all(10.0),
                              //   decoration: const BoxDecoration(
                              //       color: AppColor.whiteColor,
                              //       shape: BoxShape.circle
                              //   ),
                              //   child: const Image(image: AssetImage(IconAssets.heart), width: 20.0, height: 20.0),
                              // ),
                              // const SizedBox(height: 20.0),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesName.webViewScreen,arguments: 'productInfo');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                      color: AppColor.whiteColor,
                                      shape: BoxShape.circle
                                  ), child: const Image(image: AssetImage(IconAssets.info), width: 20.0, height: 20.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productDetailVM.productDetailResponseData.value.productData!.productName!, style: const TextStyle(color: AppColor.blackEelColor, fontSize: 17, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                                    decoration: BoxDecoration(
                                        color: AppColor.mediumGreenColor,
                                        borderRadius: BorderRadius.circular(2.0)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(productDetailVM.productDetailResponseData.value.productData!.productRating!, style: const TextStyle(color: AppColor.whiteColor, fontSize: 10.0, fontFamily: "Kanit")),
                                        const SizedBox(width: 1.0),
                                        const Icon(Icons.star, color: AppColor.whiteColor, size: 10.0)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text("${productDetailVM.productDetailResponseData.value.productData!.productReview!} Reviews", style: const TextStyle(color: AppColor.windowsBlueColor, fontSize: 10, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              const Image(image: AssetImage(IconAssets.rupees), color: AppColor.blackEelColor, width: 18.0, height: 18.0),
                              const SizedBox(width: 5.0),
                              productDetailVM.productDetailResponseData.value.productData!.isOnSale == "1" ? Row(
                                children: [
                                  Text("${getdiscountProductPrice()}/- ", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 30, fontFamily: "Readex Pro", fontWeight: FontWeight.w300)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("₹${productDetailVM.productDetailResponseData.value.productData!.mrp!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 18, fontFamily: "Readex Pro", fontWeight: FontWeight.w300,decoration: TextDecoration.lineThrough)),
                                          Text(" (${productDetailVM.productDetailResponseData.value.productData!.saleDiscount!}%)OFF", style: const TextStyle(color: Colors.green, fontSize: 18, fontFamily: "Readex Pro", fontWeight: FontWeight.w300,decoration: TextDecoration.lineThrough)),
                                        ],
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Text("₹${getdiscount()}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 17, fontFamily: "Readex Pro", fontWeight: FontWeight.w300)),
                                      //     Text(" (${productDetailVM.productDetailResponseData.value.productData!.saleDiscount!}%)OFF ON SALE", style: const TextStyle(color: Colors.green, fontSize: 17, fontFamily: "Readex Pro", fontWeight: FontWeight.w300)),
                                      //   ],
                                      // ),
                                    ],
                                  ),

                                ],
                              )
                                  : Row(
                                children: [
                                  Text("${productDetailVM.productDetailResponseData.value.productData!.price!}/- ", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 24, fontFamily: "Readex Pro", fontWeight: FontWeight.w300)),
                                  Text("${productDetailVM.productDetailResponseData.value.productData!.mrp!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 24, fontFamily: "Readex Pro", fontWeight: FontWeight.w300,decoration: TextDecoration.lineThrough)),
                                  const SizedBox(width: 10.0),
                                  const Image(image: AssetImage(IconAssets.infoMore), color: AppColor.blackEelColor, width: 20.0, height: 20.0)
                                ],
                              ),
                              const SizedBox(width: 10.0),
                              // const Image(image: AssetImage(IconAssets.infoMore), color: AppColor.blackEelColor, width: 20.0, height: 20.0)
                            ],
                          ),
                          const Text("Inclusive of all taxes", style: TextStyle(color: AppColor.vampireGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Row(
                              children: [
                                Obx(() => Radio(
                                  value: "With Egg",
                                  activeColor: AppColor.blackEelColor,
                                  groupValue: productDetailVM.radioButtonValue.value,
                                  onChanged: (value) {productDetailVM.setRadioText(value!);},
                                )),
                                const Text("With Egg", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                const SizedBox(width: 10.0),
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.orangeyRedColor),
                                      shape: BoxShape.rectangle
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(7.0),
                                    decoration: const BoxDecoration(
                                        color: AppColor.portLandOrangeColor,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                                Obx(() => Radio(
                                  value: "Eggless",
                                  activeColor: AppColor.blackEelColor,
                                  groupValue: productDetailVM.radioButtonValue.value,
                                  toggleable: false,
                                  onChanged: (value) {productDetailVM.setRadioText(value!);},
                                )),
                                const Text("Eggless", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                const SizedBox(width: 10.0),
                                Container(
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.darkPastelGreenColor),
                                      shape: BoxShape.rectangle
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(7.0),
                                    decoration: const BoxDecoration(
                                        color: AppColor.darkPastelGreenColor,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const Text("Pick an upgrade", style: TextStyle(color: AppColor.blackEelColor, fontSize: 14, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                          // const SizedBox(height: 15.0),
                          // SizedBox(
                          //   height: 100,
                          //   child: ListView.builder(
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     itemBuilder: (context, index) {
                          //       return Padding(
                          //         padding: const EdgeInsets.only(right: 10.0),
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             ClipRRect(
                          //                 borderRadius: BorderRadius.circular(8.0),
                          //                 child: const Image(image: AssetImage(ImageAssets.chocolateCake), width: 70.0, height: 70.0)),
                          //             const Text("1/2", style: TextStyle(color: AppColor.blackEelColor, fontSize: 10)),
                          //             const Text("₹ 599", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 10)),
                          //           ],
                          //         ),
                          //       );
                          //     }, itemCount: 4,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      color: AppColor.dullOrangeColor,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
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
                                      padding: const EdgeInsets.all(6.0),
                                      child: CountryListPick(
                                        theme: CountryTheme(
                                          isShowFlag: false,
                                          isShowTitle: true,
                                          isShowCode: false,
                                          isDownIcon: true,
                                          showEnglishName: true,
                                        ),
                                        initialSelection: '+91',
                                        onChanged: (code) {
                                          // print(code?.name);
                                          // print(code?.code);
                                        },
                                      ),
                                    ),
                                    const VerticalDivider(color: AppColor.cloudColor, thickness: 1.0),
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (value) {
                                          if(value.length == 6){
                                            productDetailVM.pincodeCheckApi(context,
                                                productDetailVM.productDetailResponseData.value.productData!.id.toString(),
                                                pincodeController.value.text.toString()
                                            );
                                          }else if(value.length == 0){
                                            setState(() {
                                              productDetailVM.pincodeCheckApiResponseData.value.message = null;
                                              productDetailVM.setPincodeCheck(productDetailVM.pincodeCheckApiResponseData.value);
                                            });
                                          }
                                        },
                                        controller: pincodeController.value,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(6),
                                        ],
                                        validator: MultiValidator([
                                          RequiredValidator(errorText: "Pincode Required"),
                                          MinLengthValidator(6, errorText: "6 character Required"),
                                        ]),
                                        style: TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 13.0),
                                        decoration: InputDecoration(
                                          hintText: "Enter Pincode",
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
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
                            productDetailVM.pincodeCheckApiResponseData.value.message != null ? Align(alignment : Alignment.centerLeft,child: Text(productDetailVM.pincodeCheckApiResponseData.value.message.toString(),style: TextStyle(color: Colors.red,fontSize: 14),)) : const SizedBox(height: 0.0),
                            const SizedBox(height: 20.0),
                            InkWell(
                                onTap: ()  async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2080),
                                  );

                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if(pickedTime!.period == DayPeriod.am){
                                    Period = "am";
                                  }else if(pickedTime.period == DayPeriod.pm){
                                    Period = "pm";
                                  }

                                  if (pickedDate != null) {
                                    productDetailVM.deliveryDate.value = '${dates(pickedDate.day)}${pickedDate.day} ${months(pickedDate)} ${pickedDate.year.toString().padLeft(2, '0')} ${pickedTime.hourOfPeriod.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')} ${Period}';
                                  }
                                  print(productDetailVM.deliveryDate.value);

                                  Get.defaultDialog(
                                    title: "Select Shipping Method",
                                    backgroundColor: Colors.white,
                                    content: Container(
                                      height: 450,
                                      width: 500,
                                      color: Colors.white,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            semanticContainer: true,
                                            color: Color(0xFFFAFAFA),
                                            child: Container(
                                              height: 90,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                 Radio(
                                                    value: homeVM.ShippingResponseData.value.shippingData![index].name,
                                                    groupValue: methodController.selectdMethodType.value,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        Get.back();
                                                        methodController.onChanged(value);
                                                        selectTimeSlot(context);
                                                        methodController.selectdPriceType.value = homeVM.ShippingResponseData.value.shippingData![index].price!;
                                                        print(methodController.selectdMethodType.value.toString());
                                                        print(methodController.selectdPriceType.value.toString());
                                                      });
                                                    },
                                                  ),
                                                 SizedBox(height: 10),
                                                 Column(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Text(homeVM.ShippingResponseData.value.shippingData![index].name!, style: TextStyle(color: AppColor.blackEelColor, fontSize: 14, overflow: TextOverflow.ellipsis ,fontFamily: "Kanit", fontWeight: FontWeight.w600)),

                                                     Container(
                                                       width: 150,
                                                         child: Text(homeVM.ShippingResponseData.value.shippingData![index].description!, style: TextStyle(color: AppColor.blackEelColor, /*overflow: TextOverflow.ellipsis,*/ fontSize: 12.25, fontFamily: "Kanit", fontWeight: FontWeight.w400))
                                                     ),
                                                   ],
                                                 ),
                                                 Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF79C29),
                                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12))
                                                    ),
                                                    width: 90,
                                                    child: Center(
                                                      child: Text("₹ ${homeVM.ShippingResponseData.value.shippingData![index].price!}",style: TextStyle(color: Colors.white),),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // child: ListTile(
                                            //   leading: Radio(
                                            //     value: homeVM.ShippingResponseData.value.shippingData![index].name,
                                            //     groupValue: methodController.selectdMethodType.value,
                                            //     onChanged: (value) {
                                            //       setState(() {
                                            //         Get.back();
                                            //         methodController.onChanged(value);
                                            //         selectTimeSlot(context);
                                            //         methodController.selectdPriceType.value = homeVM.ShippingResponseData.value.shippingData![index].price!;
                                            //         print(methodController.selectdMethodType.value.toString());
                                            //         print(methodController.selectdPriceType.value.toString());
                                            //       });
                                            //     },
                                            //   ),
                                            //   title: Text(homeVM.ShippingResponseData.value.shippingData![index].name!, style: TextStyle(color: AppColor.blackEelColor, fontSize: 14, overflow: TextOverflow.ellipsis ,fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                                            //   subtitle: Text(homeVM.ShippingResponseData.value.shippingData![index].description!, style: TextStyle(color: AppColor.blackEelColor, overflow: TextOverflow.ellipsis, fontSize: 12.25, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                                            //   trailing: Container(
                                            //     height: 100,
                                            //     width: 80,
                                            //     color: Color(0xFFF79C29),
                                            //     child: Center(
                                            //       child: Text("₹ ${homeVM.ShippingResponseData.value.shippingData![index].price!}",style: TextStyle(color: Colors.white),),
                                            //     ),
                                            //   ),
                                            // ),
                                          );
                                        },
                                        itemCount: homeVM.ShippingResponseData.value.shippingData?.length,
                                      ),
                                    ),
                                  );
                                },
                                child: Obx(() => TextFormField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  controller: textController.value,
                                  validator: MultiValidator(
                                      [
                                        RequiredValidator(errorText: "Please Select Delivery Date"),
                                      ]
                                  ),
                                  enabled: false,
                                  cursorOpacityAnimates: false,
                                  decoration: InputDecoration(
                                    hintText: "Select Delivery Date",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    fillColor: Color(0xFFFAFAFA),
                                    filled: true,
                                    hoverColor: Colors.black,
                                    prefixIcon: Icon(Icons.calendar_month_outlined, color: AppColor.outerSpaceColor, size: 20.0),
                                    suffixIcon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColor.blackEelColor, size: 15.0),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:BorderSide(
                                        color: AppColor.deepSaffronColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide:BorderSide(
                                        color: AppColor.deepSaffronColor,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),)
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontWeight: FontWeight.w300),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFFAFAFA),
                                filled: true,
                                isDense: true,
                                hintText: "Message On Cake",
                                hintStyle: const TextStyle(color: AppColor.smokeyGrayColor),
                                border:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(color: AppColor.portLandOrangeColor)),
                                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColor.portLandOrangeColor, width: 1.5)),
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColor.portLandOrangeColor, width: 1.5)),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          productDetailVM.productDetailResponseData.value.offerData != null ?
                          Column(
                            children: [
                              const Row(
                                children: [
                                  Image(image: AssetImage(IconAssets.offerTag), width: 12.0, height: 12.0),
                                  SizedBox(width: 5.0),
                                  Text("Offers Available", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit", fontWeight: FontWeight.w400))
                                ],
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                padding: const EdgeInsets.only(right: 10.0, top: 15.0, bottom: 15.0),
                                decoration: BoxDecoration(
                                    color: AppColor.alabasterColor,
                                    borderRadius: BorderRadius.circular(7.0),
                                    border: Border.all(color: AppColor.cottonSeedColor, width: 1.0)
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(image: AssetImage(ImageAssets.justSurprise), width: 120.0, height: 40.0),
                                    Expanded(child: Text("15% Off* on 1st Order Code: FIRSTORDER", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300))),
                                    Text("*T&C", style: TextStyle(color: AppColor.frenchBlueColor, fontFamily: "Kanit", fontWeight: FontWeight.w300))
                                  ],
                                ),
                              ),
                            ],
                          ) :
                          const SizedBox(),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 10.0,
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: const Image(image: AssetImage(ImageAssets.chocolateCake), width: 50.0, height: 50.0)),
                            title: Text(productDetailVM.productDetailResponseData.value.offerHeading!.offetTitle!, style: const TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                            subtitle: Text(productDetailVM.productDetailResponseData.value.offerHeading!.offerDescription!, style: const TextStyle(color: AppColor.outerSpaceBlackColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                          ),
                          productDetailVM.productDetailResponseData.value.offerData != null ?
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.lavenderPinocchioColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      return Checkbox(
                                        value: productDetailVM.isChecked.value,
                                        onChanged: (value) {
                                          productDetailVM.isChecked.value = value!;
                                        },
                                      );
                                    },),
                                    Expanded(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        horizontalTitleGap: 10.0,
                                        leading: ClipRRect(
                                            borderRadius: BorderRadius.circular(5.0),
                                            child: const Image(image: AssetImage(ImageAssets.chocolateCake), width: 50.0, height: 50.0)),
                                        title: const Text("Sparkle Candle 1pc", style: TextStyle(color: AppColor.davyGrayColor, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                        subtitle: const Text("₹ 1500", style: TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro", fontWeight: FontWeight.w300)),
                                        trailing: const Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Image(image: AssetImage(IconAssets.info), width: 15.0, height: 15.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }, itemCount: 2,
                              separatorBuilder: (context, index) {
                                return const Divider(color: AppColor.platinumColor, thickness: 0.6);
                              },
                            ),
                          ) :
                          const SizedBox(),
                          const SizedBox(height: 10.0),
                          getDescription() != "" ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Description :", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                              const Divider(color: AppColor.dawnColor, thickness: 0.6),
                              Text(getDescription() ?? "", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                            ],
                          ) : const SizedBox()
                        ],
                      ),
                    ),
                     productDetailVM.productReviewResponseData.value.data != null ?
                     Container(
                       width: Get.width,
                       padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                       color: AppColor.neonBlueColor,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text("What Customers Are Saying", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            height: 155,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: Get.width * 0.90,
                                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 5.0),
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    border: Border.all(color: AppColor.cottonSeedColor, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: AppColor.lavenderWebColor, width: 1.0),
                                                shape: BoxShape.circle
                                            ),
                                            child: Image(image: NetworkImage("${Utils.imageUrl}${productDetailVM.productReviewResponseData.value.data![index].image!}"), width: 70.0, height: 70.0),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(productDetailVM.productReviewResponseData.value.data![index].title!, style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit", fontWeight: FontWeight.w400))
                                        ]
                                      ),
                                      const SizedBox(width: 3.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 40,
                                              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                                              decoration: BoxDecoration(color: AppColor.darkPastelGreenColor, borderRadius: BorderRadius.circular(2.0)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(productDetailVM.productReviewResponseData.value.data![index].rating!, style: const TextStyle(color: AppColor.whiteColor, fontSize: 10.0, fontFamily: "Kanit")),
                                                  const SizedBox(width: 3.0),
                                                  const Icon(Icons.star, color: AppColor.whiteColor, size: 12.0)
                                                ],
                                              ),
                                            ),
                                            Text(productDetailVM.productReviewResponseData.value.data![index].description!, style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit", fontStyle: FontStyle.italic, fontWeight: FontWeight.w300)),
                                            Text(productDetailVM.productReviewResponseData.value.data![index].reviewDateTime!, style: const TextStyle(color: AppColor.blackEelColor, fontSize: 10, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                            Text("Delivered At : ${productDetailVM.productReviewResponseData.value.data![index].delivery!}", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 10, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                            Text("Occasion : ${productDetailVM.productReviewResponseData.value.data![index].occasion!}", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 10, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }, itemCount: productDetailVM.productReviewResponseData.value.data?.length,
                            ),
                          )
                         ],
                       ),
                     ) :
                     const SizedBox(),
                      productDetailVM.recentProduceViewResponseData.value.productData != null ? Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text("Recently Viewed By You", style: TextStyle(color: AppColor.blackEelColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          height: 265.0,
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.dullGrayColor,
                                  blurRadius: 21,
                                ),
                              ]
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(left: 10.0),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  productDetailVM.recentProductAddApi(context, productDetailVM.recentProduceViewResponseData.value.productData![index].id.toString());
                                },
                                child: Container(
                                  width: 160,
                                  margin: const EdgeInsets.only(right: 10.0),
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
                                          child: Image(image: NetworkImage(Utils.imageUrl + productDetailVM.recentProduceViewResponseData.value.productData![index].image!))),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(productDetailVM.recentProduceViewResponseData.value.productData![index].productName!, maxLines: 1, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis, fontSize: 12, fontFamily: "Kanit")),
                                            const SizedBox(height: 2.0),
                                            Row(
                                              children: [
                                                Text("₹ ${productDetailVM.recentProduceViewResponseData.value.productData![index].mrp!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                                const SizedBox(width: 2.0),
                                                Text("₹ ${productDetailVM.recentProduceViewResponseData.value.productData![index].price!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                                const SizedBox(width: 2.0),
                                                Text(getDiscount(productDetailVM.recentProduceViewResponseData.value.productData![index].mrp!, productDetailVM.recentProduceViewResponseData.value.productData![index].price!), style: const TextStyle(color: AppColor.seaGreenColor, fontSize: 12, fontFamily: "Readex Pro")),
                                              ],
                                            ),
                                            const SizedBox(height: 5.0),
                                            Row(
                                              children: [
                                                productDetailVM.recentProduceViewResponseData.value.productData![index].isSameDayDelivery! == "1" ?
                                                const Text("Earliest Delivery:Today", style: TextStyle(color: AppColor.graniteGrayColor, fontSize: 12, fontFamily: "Kanit")) :
                                                const Text("", style: TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit")),
                                              ],
                                            ),
                                            const SizedBox(height: 5.0),
                                            Container(
                                              width: 40,
                                              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                                              decoration: BoxDecoration(
                                                  color: AppColor.mediumGreenColor,
                                                  borderRadius: BorderRadius.circular(2.0)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(productDetailVM.recentProduceViewResponseData.value.productData![index].rating!, style: const TextStyle(color: AppColor.whiteColor, fontSize: 10.0, fontFamily: "Kanit")),
                                                  const SizedBox(width: 3.0),
                                                  const Icon(Icons.star, color: AppColor.whiteColor, size: 12.0)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }, itemCount: productDetailVM.recentProduceViewResponseData.value.productData?.length,
                          ),
                        )
                      ],
                    ):
                    const SizedBox(),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("You May Also Like", style: TextStyle(color: AppColor.blackEelColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                    ),
                    productDetailVM.mayAlsoLikeResponseData.value.productData != null ?
                    Container(
                      height: 265,
                      margin: const EdgeInsets.only(bottom: 100.0),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.dullGrayColor,
                              blurRadius: 21,
                            ),
                          ]
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 10.0),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print(productDetailVM.mayAlsoLikeResponseData.value.productData![index].id!);
                              Get.offAndToNamed(RoutesName.productDetailScreen, arguments: productDetailVM.mayAlsoLikeResponseData.value.productData![index].id!);
                            },
                            child: Container(
                              width: 160,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
                                      child: Image(image: NetworkImage(Utils.imageUrl + productDetailVM.mayAlsoLikeResponseData.value.productData![index].image!))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(productDetailVM.mayAlsoLikeResponseData.value.productData![index].productName!, maxLines: 1, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis, fontSize: 12, fontFamily: "Kanit")),
                                        const SizedBox(height: 2.0),
                                        Row(
                                          children: [
                                            Text("₹ ${productDetailVM.mayAlsoLikeResponseData.value.productData![index].price!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                            const SizedBox(width: 2.0),
                                            Text("₹ ${productDetailVM.mayAlsoLikeResponseData.value.productData![index].mrp!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                            const SizedBox(width: 2.0),
                                            Text(getMayAlsoLikeDiscount(productDetailVM.mayAlsoLikeResponseData.value.productData![index].mrp!, productDetailVM.mayAlsoLikeResponseData.value.productData![index].price!), style: const TextStyle(color: AppColor.seaGreenColor, fontSize: 12, fontFamily: "Readex Pro")),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0),
                                        Row(
                                          children: [
                                            productDetailVM.mayAlsoLikeResponseData.value.productData![index].isSameDayDelivery! == "1" ?
                                            const Text("Earliest Delivery:Today", style: TextStyle(color: AppColor.graniteGrayColor, fontSize: 12, fontFamily: "Kanit")) :
                                            const Text("", style: TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit")),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0),
                                        Container(
                                          width: 40,
                                          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                                          decoration: BoxDecoration(
                                              color: AppColor.mediumGreenColor,
                                              borderRadius: BorderRadius.circular(2.0)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(productDetailVM.mayAlsoLikeResponseData.value.productData![index].rating!, style: const TextStyle(color: AppColor.whiteColor, fontSize: 10.0, fontFamily: "Kanit")),
                                              const SizedBox(width: 3.0),
                                              const Icon(Icons.star, color: AppColor.whiteColor, size: 12.0)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }, itemCount: productDetailVM.mayAlsoLikeResponseData.value.productData?.length,
                      ),
                    ) :
                    const SizedBox()
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blackBeanColor,
                          blurRadius: 15,
                          offset: Offset(5, 0), // changes position of shadow
                        ),
                      ]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            onChanged();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            decoration: BoxDecoration(
                                color: AppColor.seaShellColor,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: const Text("Add To Cart", textAlign: TextAlign.center, style: TextStyle(color: AppColor.charlestonGreenColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            onChanged();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            decoration: BoxDecoration(
                                color: AppColor.deepSaffronColor,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: const Text("Gift Now", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)))
    );
  }

  Future<void> selectTimeSlot(BuildContext context) async {
    Get.defaultDialog(
      title: "Select Time Slot",
      content: Container(
        width: 400,
        height: 450,
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return Radio(
                      value: homeVM.ShippingTimeResponseData.value.shippingTimeData![index].time,
                      groupValue: timeController.selectdTimeType.value,
                      onChanged: (value) {
                        timeController.onChanged(value);
                        Get.back();
                        print(timeController.selectdTimeType.value.toString());
                      },
                    );
                  },),
                  SizedBox(width: 10),
                  Text(homeVM.ShippingTimeResponseData.value.shippingTimeData![index].time!),
                ],
              ),
            ),
          );
        },
          itemCount: homeVM.ShippingTimeResponseData.value.shippingTimeData?.length,
        ),
      )
    );
  }

  String? getDescription() {
    var document = parse(productDetailVM.productDetailResponseData.value.productData?.description);
    String? parsedString = parse(document.body?.text).documentElement?.text;
    return parsedString;
  }

  String getDateTime(int index) {
    var dateTime = productDetailVM.productReviewResponseData.value.data![index].createdAt!;
    String date = dateTime.split("T")[0];
    String time = dateTime.split("T")[1].split(".")[0];
    return "$date-$time";
  }

  String getDiscount(String mrp, String price) {
    var discount = ((double.parse(mrp) - double.parse(price)) / double.parse(mrp) * 100);
    return "${discount.toInt()}% off";
  }

  String getMayAlsoLikeDiscount(String mrp, String price) {
    var discount = ((double.parse(mrp) - double.parse(price)) / double.parse(mrp) * 100);
    return "${discount.toInt()}% off";
  }

  String? getdiscountProductPrice() {
    var salDiscount = int.parse(productDetailVM.productDetailResponseData.value.productData!.saleDiscount!);
    var price = int.parse(productDetailVM.productDetailResponseData.value.productData!.price!);
    var dicount = (price*salDiscount)/100;
    return "${price-dicount}";
  }

  String? getdiscount() {
    var salDiscount = int.parse(productDetailVM.productDetailResponseData.value.productData!.saleDiscount!);
    var price = int.parse(productDetailVM.productDetailResponseData.value.productData!.price!);
    var dicount = (price*salDiscount)/100;
    return "${dicount}";
  }

}
