import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:justsurprise/model/filter_response_model.dart';
import 'package:justsurprise/view_models/controller/product_view_model.dart';

import '../../data/response/status.dart';
import '../../repository/ApiRepository.dart';
import '../../utils/utils.dart';
import 'just_fragment_view_model.dart';

class FilterViewModel extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt selectedIndex2 = 0.obs;
  final _api = ApiRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final FilterResponseData = FilterResponseModel().obs;

  // final justSurpriseVM = Get.find<JustFragmentViewModel>();
  final productVM = Get.find<ProductScreenViewModel>();
  List<String> valueList = [];
  List<String> keyList = [];
  final RxMap<String, List<String>> filterVal = Map<String, List<String>>().obs;
  isChecked(String value , index , argName){
    String? key;
    String? value;
    if (argName == "category") {
      productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.categoryResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "sameDayDelivery") {
      productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "bestSeller") {
      productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "newArrivals") {
      productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "mostLovedGift") {
      productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "giftInTrend") {
      productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "pickTheirFlowers") {
      productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "bakeryFreshCakes") {
      productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "giftTellStories") {
      productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "searchProduct") {
      productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "giftFinder") {
      productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "getAllSaleProduct") {
      productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(true);
      key = productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    }

    List<String>? valList = filterVal[key];
    print("value:-$valList");
    if(valList == null){
      valList = [];
    }
    valList.add(value!);
    filterVal[key!] = valList;
    print("insideFilterval:-${filterVal}");
  }

  isUncheckAll(argName){
    filterVal.clear();
    if (argName == "category") {
      for (var j = 0; j < productVM.categoryResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.categoryResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.categoryResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "sameDayDelivery") {
      for (var j = 0; j < productVM.sameDayDeliveryResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.sameDayDeliveryResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.sameDayDeliveryResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "bestSeller") {
      for (var j = 0; j < productVM.bestSellerResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.bestSellerResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.bestSellerResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "newArrivals") {
      for (var j = 0; j < productVM.newArrivalsResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.newArrivalsResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.newArrivalsResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "mostLovedGift") {
      for (var j = 0; j < productVM.mostLovedGiftViewAllResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.mostLovedGiftViewAllResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.mostLovedGiftViewAllResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "giftInTrend") {
      for (var j = 0; j < productVM.giftTrendsViewAllResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.giftTrendsViewAllResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.giftTrendsViewAllResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "pickTheirFlowers") {
      for (var j = 0; j < productVM.favFlowerViewAllResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.favFlowerViewAllResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.favFlowerViewAllResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "bakeryFreshCakes") {
      for (var j = 0; j < productVM.bakeryFreshViewAllResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.bakeryFreshViewAllResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.bakeryFreshViewAllResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "giftTellStories") {
      for (var j = 0; j < productVM.giftTellStoriesViewAllResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.giftTellStoriesViewAllResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.giftTellStoriesViewAllResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "searchProduct") {
      for (var j = 0; j < productVM.searchProductViewAllResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.searchProductViewAllResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.searchProductViewAllResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "giftFinder") {
      for (var j = 0; j < productVM.findGiftResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.findGiftResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.findGiftResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    } else if (argName == "getAllSaleProduct") {
      for (var j = 0; j < productVM.getAllSaleProductResponseData.value.filterDetail!.length; j++) {
        for (var i = 0; i < productVM.getAllSaleProductResponseData.value.filterDetail![j].list_data!.length; i++) {
          productVM.getAllSaleProductResponseData.value.filterDetail![j].list_data![i].setChecked(false);
        }
      }
    }
  }

  isunChecked(String value,index, argName){
    String? key;
    String? value;
    if (argName == "category") {
      productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.categoryResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.categoryResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "sameDayDelivery") {
      productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.sameDayDeliveryResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "bestSeller") {
      productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.bestSellerResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "newArrivals") {
      productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.newArrivalsResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "mostLovedGift") {
      productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.mostLovedGiftViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "giftInTrend") {
      productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.giftTrendsViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "pickTheirFlowers") {
      productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.favFlowerViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "bakeryFreshCakes") {
      productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.bakeryFreshViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "giftTellStories") {
      productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.giftTellStoriesViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "searchProduct") {
      productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.searchProductViewAllResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "giftFinder") {
      productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.findGiftResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    } else if (argName == "getAllSaleProduct") {
      productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].setChecked(false);
      key = productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].title;
      value = productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].name != null ? productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].name : productVM.getAllSaleProductResponseData.value.filterDetail![selectedIndex.value].list_data![index].value;
    }

    List<String>? valList = filterVal[key];
    valList?.remove(value!);
    filterVal[key!] = valList!;
    print("unCheckinsideFilterval:-${filterVal}");
  }
}
