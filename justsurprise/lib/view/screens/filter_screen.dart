
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/view_models/controller/filter_view_model.dart';
import '../../view_models/controller/just_fragment_view_model.dart';
import '../../view_models/controller/product_view_model.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final filterVM = Get.find<FilterViewModel>();
  final justSurpriseVM = Get.find<JustFragmentViewModel>();
  final productVM = Get.find<ProductScreenViewModel>();

  var argName = "";
  var slugName = "";
  var checkIndex1;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      argName = Get.arguments[0];
      slugName = Get.arguments[1];
    }

    // for (var i = 0; i < justSurpriseVM.justSurpriseResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].length; i++) {
    //   print("befor:-${responseModel.productData![i].quantity}");
    //   responseModel.productData![i].quantity = 0;
    //   print("after:-${responseModel.productData![i].quantity}");
    // }
  }

  bool? isChecked(int index){
    if (argName == "giftFinder") {
      return productVM.findGiftResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.findGiftResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "category") {
      return productVM.categoryResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.categoryResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.mostLovedGiftViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.sameDayDeliveryResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.bestSellerResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.newArrivalsResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.giftTrendsViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.favFlowerViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryFreshViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.bakeryFreshViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.giftTellStoriesViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked  : false;
    } else if (argName == "searchProduct") {
      return productVM.searchProductViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.searchProductViewAllResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked != null ? productVM.getAllSaleProductResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].isChecked : false;
    }
  }

  GetfilterApis(){
    if (argName == "category") {
      productVM.categoryClickApi(context,
          slugName,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "sameDayDelivery") {
      productVM.sameDayDeliveryApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "bestSeller") {
      productVM.bestSellerApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "newArrivals") {
      productVM.newArrivalsApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "mostLovedGift") {
      productVM.mostLovedGiftViewAllApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "giftInTrend") {
      productVM.giftTrendsViewAllApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "pickTheirFlowers") {
      productVM.favFlowerViewAllApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "bakeryFreshCakes") {
      productVM.bakeryFreshCakeViewAllApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "giftTellStories") {
      productVM.giftTellStoriesViewAllApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "giftFinder") {
      productVM.findGiftApi(context,
          justSurpriseVM.occasionId!.value.toString() ,
          justSurpriseVM.giftTypeId!.value.toString(),
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "searchProduct") {
      productVM.searchProductApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    } else if (argName == "getAllSaleProduct") {
      productVM.getAllSaleProductApi(context,
          productVM.page,
          productVM.filter_value,
          productVM.sort_type,
          productVM.product_types,
          productVM.is_same_day_delivery,
          productVM.categoryId,
          productVM.occation_id
      );
    }
  }

  String? setInnerTitle(int index){
    return justSurpriseVM.justSurpriseResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].name != null ? justSurpriseVM.justSurpriseResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].name : justSurpriseVM.justSurpriseResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data![index].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("Filter", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    print("clearall:-${filterVM.filterVal}");
                    filterVM.isUncheckAll(argName);
                  });
                },
                child: const Text("Clear All", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit"))
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: AppColor.whiteColor,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 0.45,
                    height: Get.height,
                    color: AppColor.whiteSmokeColor,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index1) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              filterVM.selectedIndex.value = index1;
                            });
                          },
                            child: Obx(() => filterVM.selectedIndex.value == index1 ?
                              Container(
                                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                                decoration: const BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border(bottom: BorderSide(color: AppColor.lavenderColor, width: 2.0))
                                ), child: Text(justSurpriseVM.justSurpriseResponseData.value.filterDetail![index1].title!, style: TextStyle(color: AppColor.mangoTangoColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w300))) :
                              Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                                child: Text(justSurpriseVM.justSurpriseResponseData.value.filterDetail![index1].title!, style: TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                              ),
                            )
                        );
                      }, itemCount: justSurpriseVM.justSurpriseResponseData.value.filterDetail?.length,
                    ),
                  ),
                  Obx(() => Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
                            child: ListTile(
                              leading: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isChecked(index) == true){
                                      filterVM.isunChecked(setInnerTitle(index).toString(),index,argName);
                                    } else {
                                      filterVM.isChecked(setInnerTitle(index).toString(),index,argName);
                                    }
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(0.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.smokeyGrayColor, width: 1.0),
                                      color: isChecked(index) == true
                                          ? Colors.green
                                          : Colors.white,
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Icon(Icons.check,color: Colors.white,size: 15,)
                                ),
                              ),
                              title: Text(setInnerTitle(index).toString(),style: TextStyle(fontSize: 15),),
                            )
                        );
                      }, itemCount: justSurpriseVM.justSurpriseResponseData.value.filterDetail![filterVM.selectedIndex.value].list_data?.length,
                    ),
                  ),),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    productVM.page = 1;
                    String filterJson = json.encode(filterVM.filterVal);
                    print("FilterVal:-${filterVM.filterVal}");
                    print("FilterJson:-$filterJson");
                    productVM.filter_value = filterJson;
                    GetfilterApis();
                    // if (argName == "category") {
                    //   productVM.categoryClickApi(context,
                    //       slugName,
                    //       productVM.page,
                    //       productVM.filter_value,
                    //       productVM.sort_type,
                    //       productVM.product_types,
                    //       productVM.is_same_day_delivery,
                    //       productVM.categoryId,
                    //       productVM.occation_id
                    //   );
                    // }
                    // productVM.filterApi(context,
                    //     filterJson, argName,
                    //     productVM.page,
                    //     productVM.categoryId,
                    //     productVM.is_same_day_delivery,
                    //     productVM.occation_id,
                    //     productVM.product_types
                    // );
                    Get.back();
                    print(filterVM.filterVal);
                  },
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    color: AppColor.deepSaffronColor,
                    child: const Text("Show Results", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 18, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
