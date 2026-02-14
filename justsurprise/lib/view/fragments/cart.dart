import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/gift_type_response_model.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/cart_fragment_view_model.dart';

import '../../model/just_surprise_response_model.dart';
import '../../utils/shared_preferences_services.dart';
import '../../view_models/controller/address_view_model.dart';
import '../../view_models/controller/just_fragment_view_model.dart';
import '../../view_models/controller/product_detail_view_model.dart';

class CartFragment extends StatefulWidget {
  const CartFragment({super.key});

  @override
  State<CartFragment> createState() => _CartFragmentState();
}

class _CartFragmentState extends State<CartFragment> {
  final cartVM = Get.put(CartFragmentViewModel());
  final productDetailVM = Get.put(ProductDetailViewModel());
  final justSurpriseVM = Get.find<JustFragmentViewModel>();
  final radioController = RadioButton();
  final typeController = paymentType();
  final _formKey = GlobalKey<FormState>();
  final methodController = Get.put(selectdMethod());
  final timeController = Get.put(selectdTime());
  OccationData? occasionValue;
  GiftTypeData? giftTypeValue;
  int? giftTypeId = 0;
  int index = 0;
  var id;

  void onChanged(){
    if(_formKey.currentState!.validate()){
      print("ok");
      String pids= "";
      for (var i = 0; i < cartVM.viewCartResponseData.value.cartViewData!.length; i++) {
        if(cartVM.viewCartResponseData.value.cartViewData!.length - 1 == i){
          pids = pids+cartVM.viewCartResponseData.value.cartViewData![i].productId.toString();
        }else{
          pids = pids+cartVM.viewCartResponseData.value.cartViewData![i].productId.toString()+",";
        }
      }

      String cartids = "";
      for (var i = 0; i < cartVM.viewCartResponseData.value.cartViewData!.length; i++) {
        if(cartVM.viewCartResponseData.value.cartViewData!.length - 1 == i){
          cartids = cartids+cartVM.viewCartResponseData.value.cartViewData![i].id.toString();
        }else{
          cartids = cartids+cartVM.viewCartResponseData.value.cartViewData![i].id.toString()+",";
        }
      }
      cartVM.addOrderApi(
          context,
          pids,
          cartVM.viewCartResponseData.value.totalPrice.toString(),
          giftTypeId.toString(),
          cartVM.nameController.value.text.toString(),
          cartVM.emailController.value.text.toString(),
          cartVM.mobileNoController.value.text.toString(),
          cartVM.cityController.value.text.toString(),
          typeController.selectType.value.toString(),
          radioController.selectedButton.value.toString(),
          cartids,
      );
    }else{
      print("error");
    }
  }

  @override
  void initState() {
    super.initState();
    print("in cart inet");
    _checkConnection();
    cartVM.viewCartApi(context);
    getData();
  }

  getData() async {
    id = await SharedPref.getUserid();
    print(id);
  }

  Future<void> _checkConnection() async {
    cartVM.isConnected.value = await Utils.isConnected();
  }

  bool getIsLoading() {
    if(cartVM.rxRequestStatus.value == Status.LOADING) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        automaticallyImplyLeading: false,
        title: const Text("Cart", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
        leading: InkWell(
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
      body: Obx(() => cartVM.isConnected.value ? getIsLoading() ? cartVM.viewCartResponseData.value.cartViewData != null ? Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cartVM.viewCartResponseData.value.cartViewData != null ?
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image(
                                        image: NetworkImage(Utils.imageUrl+cartVM.viewCartResponseData.value.cartViewData![index].image!), width: 80.0, height: 80.0)),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Container(
                                          width: 190,
                                            child: Text(cartVM.viewCartResponseData.value.cartViewData![index].productName!,overflow: TextOverflow.clip,style: const TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit"))),
                                      ),
                                      const SizedBox(height: 3.0),
                                      cartVM.viewCartResponseData.value.cartViewData![index].foodType! == "0" ?
                                      Text("₹ ${cartVM.viewCartResponseData.value.cartViewData![index].price!} X ${cartVM.viewCartResponseData.value.cartViewData![index].quantity}", style: const TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")) :
                                      cartVM.viewCartResponseData.value.cartViewData![index].foodType! == "1" ?
                                      Text("₹ ${cartVM.viewCartResponseData.value.cartViewData![index].price!} X ${cartVM.viewCartResponseData.value.cartViewData![index].quantity} Eggless", style: const TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")) :
                                      cartVM.viewCartResponseData.value.cartViewData![index].foodType! == "2" ?
                                      Text("₹ ${cartVM.viewCartResponseData.value.cartViewData![index].price!} X ${cartVM.viewCartResponseData.value.cartViewData![index].quantity} With Egg", style: const TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")) :
                                      const SizedBox(),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      cartVM.deleteCartApi(
                                        context,
                                        index,
                                        cartVM.viewCartResponseData.value.cartViewData![index].id.toString(),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: AppColor.carbonGreyColor, width: 1.0),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: const Text("Delete", style: TextStyle(color: AppColor.charlestonGreenColor, fontFamily: "Kanit")),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height:12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80,
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartVM.viewCartResponseData.value.cartViewData![index].shippingMethod.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),),
                                    Text(cartVM.viewCartResponseData.value.cartViewData![index].deliveryDateTime.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),),
                                    Row(
                                      children: [
                                        Text("${cartVM.viewCartResponseData.value.cartViewData![index].shippingMethod.toString()} :- ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16,
                                              color: Colors.black54
                                          ),),
                                        Text("₹ ${cartVM.viewCartResponseData.value.cartViewData![index].shippingPrice.toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),),
                                      ],
                                    ),
                                    Text(cartVM.viewCartResponseData.value.cartViewData![index].shippingSlotTime.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16,
                                          color: Colors.black54
                                      ),),
                                    SizedBox(height:12)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartVM.viewCartResponseData.value.cartViewData?.length,
                  ) :
                  const SizedBox(),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(image: AssetImage(IconAssets.location), width: 25.0, height: 25.0),
                          const SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Delivery to", style: TextStyle(color: AppColor.carbonGrayColor, fontSize: 16, fontFamily: "Kanit")),
                              Text(cartVM.viewCartResponseData.value.addressData![index].name!, style: const TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                              Text("${cartVM.viewCartResponseData.value.addressData![index].landmark!}  ${cartVM.viewCartResponseData.value.addressData![index].pincode!}", style: const TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                              Text("Mobile: ${cartVM.viewCartResponseData.value.addressData![index].mobile!}", style: const TextStyle(color: AppColor.blackCowColor, fontSize: 16, fontFamily: "Kanit")),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Text("Add Address & Edit Address", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit")),
                  const SizedBox(height: 5.0),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RoutesName.addressScreen);
                    },
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                            color: AppColor.seashellColor,
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: const Text("Add Address", textAlign: TextAlign.center, style: TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit")),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Stack(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Obx(() {
                                  return Radio(
                                    value: cartVM.viewCartResponseData.value.addressData![index].id.toString(),
                                    groupValue: radioController.selectedButton.value,
                                    onChanged: (value) {
                                      radioController.onchangedRadio(value);
                                    },
                                  );
                                },),
                                title: Text(cartVM.viewCartResponseData.value.addressData![index].name!, style: const TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                                subtitle: Text(cartVM.viewCartResponseData.value.addressData![index].address!, style: const TextStyle(color: AppColor.smokeyGrayColor, fontSize: 13, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartVM.viewCartResponseData.value.addressData?.length,
                  ),
                  Container(
                    color: const Color(0xFFfff9f2),
                    padding: const EdgeInsets.all(8),
                    // color: Colors.blue,
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Select Occasion", style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: "Inter")),
                          const SizedBox(height: 5,),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DropdownButtonFormField<GiftTypeData>(
                              decoration: const InputDecoration(prefixIcon: Image(image: AssetImage(IconAssets.giftPackage)), border: InputBorder.none),
                              value: giftTypeValue,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              hint: const Text('Gift Type', style: TextStyle(color: AppColor.blackEelColor, fontSize: 15, fontFamily: "Kanit")),
                              onChanged: (GiftTypeData? newValue) {
                                giftTypeId = newValue?.id;
                              },
                              items: justSurpriseVM.giftTypeResponseData.value.giftTypeData?.map((item) {
                                return DropdownMenuItem<GiftTypeData>(
                                    value: item,
                                    child: Text(item.name.toString(), style: const TextStyle(color: AppColor.blackEelColor, fontSize: 15, fontFamily: "Kanit"))
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text("Enter Name", style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: "Inter")),
                          const SizedBox(height: 5,),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Name is Required")
                            ]),
                            controller: cartVM.nameController.value,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter Name",
                              hintStyle: const TextStyle(
                                  color: Color(0xFFa4a4a4),
                                fontWeight:FontWeight.w400
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text("Enter Email", style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: "Inter")),
                          const SizedBox(height: 5,),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Email is Required"),
                              EmailValidator(errorText: "Email not found"),
                            ]),
                            controller: cartVM.emailController.value,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter Email",
                              hintStyle: const TextStyle(
                                  color: Color(0xFFa4a4a4),
                                  fontWeight:FontWeight.w400
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text("Enter Mobile No.", style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: "Inter")),
                          const SizedBox(height: 5,),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Mobile No is Required")
                            ]),
                            controller: cartVM.mobileNoController.value,
                            keyboardType : TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter Mobile No.",
                              hintStyle: const TextStyle(
                                  color: Color(0xFFa4a4a4),
                                  fontWeight:FontWeight.w400
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text("Enter City", style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: "Inter")),
                          const SizedBox(height: 5,),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "City is Required")
                            ]),
                            controller: cartVM.cityController.value,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter City",
                              hintStyle: const TextStyle(
                                  color: Color(0xFFa4a4a4),
                                  fontWeight:FontWeight.w400
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.black,width: 1.2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payment Options",style: TextStyle(color: Colors.black,fontFamily: "Kanit",fontSize: 20)),
                      Row(
                        children: [
                          Radio(
                              value: "0",
                              groupValue: typeController.selectType.value,
                              onChanged: (value) {
                                typeController.onChanged(value);
                                print(typeController.selectType.value);
                              },
                          ),
                          Text("Online Payment",style: TextStyle(color: Colors.black,fontFamily: "Kanit",fontSize: 18)),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: typeController.selectType.value,
                              onChanged: (value) {
                                typeController.onChanged(value);
                                print(typeController.selectType.value);
                              },
                          ),
                          Text("Cash On Delivery",style: TextStyle(color: Colors.black,fontFamily: "Kanit",fontSize: 18)),
                        ],
                      ),
                    ]
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Price Details", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Kanit")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Product Price", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.allProductPrice.toString()}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.extraChargeData!.shippingCharge.toString()}", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Convenience Charge", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.extraChargeData!.convenienceCharge.toString()}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ),
                  cartVM.viewCartResponseData.value.standardDelivery != 0 ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Standard Delivery", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.standardDelivery}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ) : SizedBox(height: 0),
                  cartVM.viewCartResponseData.value.expressdDelivery != 0 ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Express Delivery", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.expressdDelivery}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ) : SizedBox(height: 0),
                  cartVM.viewCartResponseData.value.fixedTimeDelivery != 0 ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fixd Time Delivery", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.fixedTimeDelivery}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ) : SizedBox(height: 0),
                  cartVM.viewCartResponseData.value.preMidnightDelivery != 0 ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pre-Midnight Delivery", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.preMidnightDelivery}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ) : SizedBox(height: 0),
                  cartVM.viewCartResponseData.value.earliestDelivery != 0 ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Earliest Delivery", style: TextStyle(color: AppColor.smokeyGrayColor, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.earliestDelivery}", style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ) : SizedBox(height: 0),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: TextStyle(color: AppColor.eerieBlackColor, fontSize: 16, fontFamily: "Kanit")),
                      Text("₹${cartVM.viewCartResponseData.value.totalPrice.toString()}", style: TextStyle(color: AppColor.portlandOrangeColor, fontSize: 15, fontFamily: "Kanit")),
                    ],
                  ),
                  const SizedBox(height: 37.0),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                onChanged();
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                width: Get.width,
                color: AppColor.deepSaffronColor,
                child: const Text("Proceed to Checkout", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 18, fontFamily: "Kanit")),
              ),
            ),
          )
        ],
      ) : const Center(child: Text("Cart Data Doesn't Exits", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)) : Center(
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
                  onPressed: () {_checkConnection();},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(IconAssets.retry), width: 20.0, height: 20.0),
                      SizedBox(width: 5.0),
                      Text('Retry', style: TextStyle(color: AppColor.whiteColor, fontWeight: FontWeight.bold))
                    ],
                  )
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
