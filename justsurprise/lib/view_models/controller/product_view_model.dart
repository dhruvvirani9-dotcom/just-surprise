import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/model/bakery_fresh_cake_response_model.dart';
import 'package:justsurprise/model/best_seller_response_model.dart';
import 'package:justsurprise/model/category_click_response_model.dart';
import 'package:justsurprise/model/fav_flower_response_model.dart';
import 'package:justsurprise/model/gift_tell_stories_response_model.dart';
import 'package:justsurprise/model/gift_trends_response_model.dart';
import 'package:justsurprise/model/most_loved_gift_response_model.dart';
import 'package:justsurprise/model/new_arrivals_response_model.dart';
import 'package:justsurprise/model/same_day_delivery_response_model.dart';
import 'package:justsurprise/view_models/controller/get_all_sale_product_response_model.dart';
import '../../model/find_gift_response_model.dart';
import '../../model/search_product_response_model.dart';
import '../../repository/ApiRepository.dart';
import 'package:flutter/material.dart';
import 'just_fragment_view_model.dart';

class ProductScreenViewModel extends GetxController {
  final _api = ApiRepository();
  RxString sortingValue = "Recommended".obs;
  RxBool isConnected = false.obs;
  final categoryResponseData = CategoryClickResponseModel().obs;
  final sameDayDeliveryResponseData = SameDayDeliveryResponseModel().obs;
  final bestSellerResponseData = BestSellerResponseModel().obs;
  final newArrivalsResponseData = NewArrivalsResponseModel().obs;
  final mostLovedGiftViewAllResponseData = MostLoveGiftViewAllResponseModel().obs;
  final giftTrendsViewAllResponseData = GiftTrendsViewAllResponseModel().obs;
  final favFlowerViewAllResponseData = FavFlowerViewAllResponseModel().obs;
  final bakeryFreshViewAllResponseData = BakeryFreshCakeViewAllResponseModel().obs;
  final giftTellStoriesViewAllResponseData = GiftTellStoriesViewAllResponseModel().obs;
  final searchProductViewAllResponseData = searchProductResponseModel().obs;
  final getAllSaleProductResponseData = getAllSaleProductResponseModel().obs;
  final justSurpriseVM = Get.find<JustFragmentViewModel>();
  final categoryProductData = <CategoryProductData>[].obs;
  final sameDayDeliveryProductData = <SameDayDeliveryProductData>[].obs;
  final bestSellerProductData = <BestSellerProductData>[].obs;
  final newArrivalsProductData = <NewArrivalsProductData>[].obs;
  final mostLovedGiftProductData = <MostLovedGiftProductData>[].obs;
  final giftTrendsProductData = <GiftTrendsProductData>[].obs;
  final favFlowerProductData = <FavFlowerProductData>[].obs;
  final bakeryProductData = <BakeryProductData>[].obs;
  final giftTellStoriesProductData = <GiftTellStoriesProductData>[].obs;
  final searchProductData = <SearchProductData>[].obs;
  final findGiftProductData = <FindGiftProductData>[].obs;
  final getAllSaleProductData = <GetAllSaleProductData>[].obs;
  final categoryTotalPage = 1.obs;
  final categoryCurrentPage = "1".obs;
  final sameDayDeliveryTotalPage = 1.obs;
  final sameDayDeliveryCurrentPage = "1".obs;
  final bestSellerTotalPage = 1.obs;
  final bestSellerCurrentPage = "1".obs;
  final newArrivalsTotalPage = 1.obs;
  final newArrivalsCurrentPage = "1".obs;
  final mostLovedGiftTotalPage = 1.obs;
  final mostLovedGiftCurrentPage = "1".obs;
  final giftTrendsTotalPage = 1.obs;
  final giftTrendsCurrentPage = "1".obs;
  final favFlowerTotalPage = 1.obs;
  final favFlowerCurrentPage = "1".obs;
  final bakeryTotalPage = 1.obs;
  final bakeryCurrentPage = "1".obs;
  final giftTellStoriesTotalPage = 1.obs;
  final giftTellStoriesCurrentPage = "1".obs;
  final searchTotalPage = 1.obs;
  final searchCurrentPage = "1".obs;
  final getAllSaleProductTotalPage = 1.obs;
  final getAllSaleProductCurrentPage = "1".obs;
  final findGiftTotalPage = 1.obs;
  final findGiftCurrentPage = "1".obs;
  final productIndex = 0.obs;
  RxBool isBottom = false.obs;
  final rxRequestStatus = Status.LOADING.obs;
  String categoryId = "";
  String is_same_day_delivery = "";
  String occation_id = "";
  String product_types = "";
  String filter_value = "";
  String sort_type = "";
  int page = 1;
 // RxBool isLoading = false.obs;


  final findGiftResponseData = FindGiftResponseModel().obs;
  bool isFirstTime = false;
  void setSortingText(String value) {
    sortingValue.value = value;
  }

  void setCategoryClickDetail(CategoryClickResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      categoryProductData.clear();
    }

    if(responseModel.totalPage != null){
      categoryTotalPage.value = responseModel.totalPage!;
    }
    categoryCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        categoryProductData.add(responseModel.productData![i]);
      }
    }
    print("length:-${categoryProductData.length}");
    if(!isFirstTime){
      isFirstTime = true;
      categoryResponseData.value = responseModel;
    }

  }

  void setDeliveryDetail(SameDayDeliveryResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      sameDayDeliveryProductData.clear();
    }
    if(responseModel.totalPage != null){
      sameDayDeliveryTotalPage.value = responseModel.totalPage!;
    }
    sameDayDeliveryCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        sameDayDeliveryProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      sameDayDeliveryResponseData.value = responseModel;
    }
  }

  void bestSellerDetail(BestSellerResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      bestSellerProductData.clear();
    }

    if(responseModel.totalPage != null){
      bestSellerTotalPage.value = responseModel.totalPage!;
    }

    bestSellerCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        bestSellerProductData.add(responseModel.productData![i]);
      }
    }
    print("bestSellerLength:-${bestSellerProductData.length}");
    if(!isFirstTime){
      isFirstTime = true;
      bestSellerResponseData.value = responseModel;
    }
  }

  void newArrivalsDetail(NewArrivalsResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      newArrivalsProductData.clear();
    }
    if(responseModel.totalPage != null){
      newArrivalsTotalPage.value = responseModel.totalPage!;
    }

    newArrivalsCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        newArrivalsProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      newArrivalsResponseData.value = responseModel;
    }
  }

  void setMostLovedGiftViewAllDetail(MostLoveGiftViewAllResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      mostLovedGiftProductData.clear();
    }

    if(responseModel.totalPage != null){
      mostLovedGiftTotalPage.value = responseModel.totalPage!;
    }

    mostLovedGiftCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        mostLovedGiftProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      mostLovedGiftViewAllResponseData.value = responseModel;
    }
  }

  void setGiftTrendsViewAllDetail(GiftTrendsViewAllResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      giftTrendsProductData.clear();
    }

    if(responseModel.totalPage != null){
      giftTrendsTotalPage.value = responseModel.totalPage!;
    }

    giftTrendsCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        giftTrendsProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      giftTrendsViewAllResponseData.value = responseModel;
    }
  }

  void setFavFlowerViewAllDetail(FavFlowerViewAllResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      favFlowerProductData.clear();
    }

    if(responseModel.totalPage != null){
      favFlowerTotalPage.value = responseModel.totalPage!;
    }
    favFlowerCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        favFlowerProductData.add(responseModel.productData![i]);
      }
    }
    print("FavFlowerLanth:-${favFlowerProductData.length}");
    if(!isFirstTime){
      isFirstTime = true;
      favFlowerViewAllResponseData.value = responseModel;
    }
  }

  void setBakeryFreshViewAllDetail(BakeryFreshCakeViewAllResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      bakeryProductData.clear();
    }

    if(responseModel.totalPage != null){
      bakeryTotalPage.value = responseModel.totalPage!;
    }

    bakeryCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        bakeryProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      bakeryFreshViewAllResponseData.value = responseModel;
    }
  }

  void setGiftTellStoriesViewAllDetail(GiftTellStoriesViewAllResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      giftTellStoriesProductData.clear();
    }

    if(responseModel.totalPage != null){
      giftTellStoriesTotalPage.value = responseModel.totalPage!;
    }

    giftTellStoriesCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        giftTellStoriesProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      giftTellStoriesViewAllResponseData.value = responseModel;
    }
  }

  void setSearchProduct(searchProductResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      searchProductData.clear();
    }

    if(responseModel.totalPage != null){
      searchTotalPage.value = responseModel.totalPage!;
    }

    searchCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        searchProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      searchProductViewAllResponseData.value = responseModel;
    }
  }

  void setGetAllSaleProduct(getAllSaleProductResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      getAllSaleProductData.clear();
    }

    if(responseModel.totalPage != null){
      getAllSaleProductTotalPage.value = responseModel.totalPage!;
    }
    getAllSaleProductCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        getAllSaleProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      getAllSaleProductResponseData.value = responseModel;
    }
  }

  void findGiftDetail(FindGiftResponseModel responseModel) {
    if(int.parse(responseModel.currentPage!) == 1){
      findGiftProductData.clear();
    }

    if(responseModel.totalPage != null){
      findGiftTotalPage.value = responseModel.totalPage!;
    }

    findGiftCurrentPage.value = responseModel.currentPage!;
    if(responseModel.productData != null && responseModel.productData!.isNotEmpty){
      for (var i = 0; i < responseModel.productData!.length; i++) {
        findGiftProductData.add(responseModel.productData![i]);
      }
    }
    if(!isFirstTime){
      isFirstTime = true;
      findGiftResponseData.value = responseModel;
    }
    // findGiftResponseData.value = responseModel;
  }

  void setRxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  Future<void> categoryClickApi(BuildContext context, String slugName,int page , String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "slug_url" : slugName,
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };

    _api.categoryClickApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      setCategoryClickDetail(value);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> sameDayDeliveryApi(BuildContext context , int page,String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.sameDayDeliveryApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      setDeliveryDetail(value);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> bestSellerApi(BuildContext context, int page,String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.bestSellerApi(data).then((value) async {
      print("startApi");
      setRxRequestStatus(Status.COMPLETED);
      bestSellerDetail(value);
    }).onError((error, stackTrace) {
      print("error:-$error");
      print("error:-$stackTrace");
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> newArrivalsApi(BuildContext context , int page,String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.newArrivalsApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      newArrivalsDetail(value);
    }).onError((error, stackTrace) {
      print("error:-$error");
      print("error:-$stackTrace");
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> mostLovedGiftViewAllApi(BuildContext context, int page , String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.mostLovedGiftViewAllApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      setMostLovedGiftViewAllDetail(value);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> giftTrendsViewAllApi(BuildContext context , int page, String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.giftTrendsViewAllApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      setGiftTrendsViewAllDetail(value);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> favFlowerViewAllApi(BuildContext context, int page,String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.favFlowerViewAllApi(data).then((value) async {
      print("startpickTheirFlowers");
      setRxRequestStatus(Status.COMPLETED);
      setFavFlowerViewAllDetail(value);
      print("afterpickTheirFlowers");
    }).onError((error, stackTrace) {
      print("errorpickTheirFlowers:-$error");
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> bakeryFreshCakeViewAllApi(BuildContext context,int page,String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.bakeryFreshCakeViewAllApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      setBakeryFreshViewAllDetail(value);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> giftTellStoriesViewAllApi(BuildContext context,int page, String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.giftTellStoriesViewAllApi(data).then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      setGiftTellStoriesViewAllDetail(value);
    }).onError((error, stackTrace) {
      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> searchProductApi(BuildContext context , int page, String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    var data = {
      "search": justSurpriseVM.searchController.value.text,
      "page": page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.searchProduct(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setSearchProduct(value);
      // Utils.flushBarErrorMessage(value.message.toString(), context);
    },
    ).onError(
          (error, stackTrace) {
        // Utils.flushBarErrorMessage(error.toString(), context);
      },
    );
  }

  Future<void> getAllSaleProductApi(BuildContext context , int page,String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    var data = {
      "page" : page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.getAllSaleProductApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setGetAllSaleProduct(value);
    },).onError((error, stackTrace) {
      // Utils.flushBarErrorMessage(error.toString(), context);
    },);
  }

  // Future<void> sortingApi(BuildContext context ,String sortType , String argName , int page , String categoryId, String isSameDayDelivery, String occationId, String productTypes) async {
  //   Map data = {
  //     "sort_type" : sortType,
  //     "page" : page.toString(),
  //     "category_id" : categoryId,
  //     "is_same_day_delivery": isSameDayDelivery,
  //     "occation_id" : occationId,
  //     "product_types" : productTypes,
  //   };
  //
  //   if(argName == "giftFinder"){
  //     _api.findGiftSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       findGiftDetail(value);
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   }else if (argName == "category") {
  //     _api.categoryClickSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setCategoryClickDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "mostLovedGift") {
  //     _api.mostLovedGiftSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setMostLovedGiftViewAllDetail(value);
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "sameDayDelivery") {
  //     _api.sameDayDeliverySortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setDeliveryDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "bestSeller") {
  //     _api.bestSellerSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         bestSellerDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "newArrivals") {
  //     _api.newArrivalSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         newArrivalsDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "giftInTrend") {
  //     _api.giftTrendsSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setGiftTrendsViewAllDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "pickTheirFlowers") {
  //     _api.favFlowerSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setFavFlowerViewAllDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "bakeryFreshCakes") {
  //     _api.bakeryFreshCakeSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setBakeryFreshViewAllDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "giftTellStories") {
  //     _api.giftTellStoriesSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setGiftTellStoriesViewAllDetail(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "searchProduct") {
  //     _api.searchProductSortingApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setSearchProduct(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "getAllSaleProduct") {
  //     _api.getAllSaleProductSortingApi(data).then((value) {
  //       setRxRequestStatus(Status.COMPLETED);
  //       if(value.status == 1) {
  //         setGetAllSaleProduct(value);
  //       } else {
  //         // Utils.flushBarErrorMessage(value.message!, context);
  //       }
  //     },).onError((error, stackTrace) {
  //       // Utils.flushBarErrorMessage(error.toString(), context);
  //     },);
  //   }
  // }
  //
  // Future<void> filterApi(BuildContext context , String filter , String argName , int page, String categoryId, String isSameDayDelivery, String occationId, String productTypes) async {
  //   Map data = {
  //     "filter_value" : filter,
  //     "page" : page.toString(),
  //     "category_id" : categoryId,
  //     "is_same_day_delivery": isSameDayDelivery,
  //     "occation_id" : occationId,
  //     "product_types" : productTypes,
  //   };
  //
  //   if(argName == "giftFinder"){
  //     _api.findGiftFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       findGiftDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   }else if (argName == "category") {
  //     print("starCetagroy");
  //     _api.categoryClickFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       print("befourCategory");
  //       setCategoryClickDetail(value);
  //       print("afterCategory");
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       print(error.toString());
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "mostLovedGift") {
  //     _api.mostLovedGiftFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setMostLovedGiftViewAllDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "sameDayDelivery") {
  //     _api.sameDayDeliveryFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setDeliveryDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "bestSeller") {
  //     _api.bestSellerFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       bestSellerDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "newArrivals") {
  //     _api.newArrivalFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       newArrivalsDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "giftInTrend") {
  //     _api.giftTrendsFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setGiftTrendsViewAllDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "pickTheirFlowers") {
  //     _api.favFlowerFilterApi(data).then((value) async {
  //       print("startpickTheirFlowers");
  //       setRxRequestStatus(Status.COMPLETED);
  //       print("midelpickTheirFlowers");
  //       setFavFlowerViewAllDetail(value);
  //       print("afterpickTheirFlowers");
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       print("errorpickTheirFlowers");
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "bakeryFreshCakes") {
  //     _api.bakeryFreshCakeFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setBakeryFreshViewAllDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "giftTellStories") {
  //     _api.giftTellStoriesFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setGiftTellStoriesViewAllDetail(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   } else if (argName == "getAllSaleProduct") {
  //     _api.getAllSaleProductFilterApi(data).then((value) async {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setGetAllSaleProduct(value);
  //       Get.back();
  //     }).onError((error, stackTrace) {
  //       //Utils.flushBarErrorMessage(error.toString(), context);
  //     });
  //   }
  //
  //
  //
  //
  //   // _api.filterApi(data).then((value) {
  //   //   print("object2");
  //   //   setfilter(value);
  //   //   setRxRequestStatus(Status.COMPLETED);
  //   //   print(value.filterDetail.toString());
  //   //   Utils.flushBarErrorMessage(value.message! , context);
  //   // },).onError((error, stackTrace) {
  //   //   print("object3");
  //   //   Utils.flushBarErrorMessage(error.toString(), context);
  //   //   print(error);
  //   // },);
  // }

  Future<void> findGiftApi(BuildContext context, String occasionId, String giftTypeId , int page,String filterValue, String shortType,String productTypes ,String isSameDayDelivery ,String categoryId, String occationId) async {
    Map data = {
      "occation": occasionId,
      "gift_type": giftTypeId,
      "page": page.toString(),
      "filter_value" : filterValue,
      "sort_type" : shortType,
      "product_types" : productTypes,
      "is_same_day_delivery" : isSameDayDelivery,
      "category_id" : categoryId,
      "occation_id" : occationId,
    };
    _api.findGiftApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      findGiftDetail(value);
    },).onError((error, stackTrace) {

    },);
  }
// Future<void> findGiftApi(BuildContext context, String occasionId, String giftTypeId , int page) async {
//   // isLoading.value == true;
//   print("ocationBefor:-${occasionId}");
//   print("typeBefor:-${giftTypeId}");
//   String? token = await SharedPref.getToken();
//   var headers = {
//     'Authorization': 'Bearer $token',
//     'Accept': 'application/json',
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };
//   var request = http.Request('POST', Uri.parse(AppUrl.findGiftApi));
//   request.bodyFields = {
//     "occation": occasionId,
//     "gift_type": giftTypeId,
//     "page": page.toString(),
//   };
//   request.headers.addAll(headers);
//   http.StreamedResponse response = await request.send();
//   print("request:-$request");
//   if (response.statusCode == 200) {
//     setRxRequestStatus(Status.COMPLETED);
//     print("inside responce");
//     FindGiftResponseModel responseJson = FindGiftResponseModel.fromJson(
//         jsonDecode(await response.stream.bytesToString()));
//     findGiftDetail(responseJson);
//   } else {
//     print(response.reasonPhrase);
//     Utils.flushBarErrorMessage(response.reasonPhrase.toString(), context);
//   }
//   // _api.findGiftApi(data).then((value) async {
//   //   if(value["status"] == 0) {
//   //     findGiftDetail(value);
//   //     isLoading.value == false;
//   //     Get.toNamed(RoutesName.productScreen, arguments: ["giftFinder", ""]);
//   //   } else {
//   //     isLoading.value == false;
//   //     Utils.flushBarErrorMessage(value.message!, context);
//   //   }
//   // }).onError((error, stackTrace) {
//   //   isLoading.value == false;
//   //   print("error");
//   //   print(stackTrace);
//   //   print(error);
//   //   Utils.flushBarErrorMessage(error.toString(), context);
//   // });
// }
}