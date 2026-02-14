import 'package:justsurprise/data/network/network_api_services.dart';
import 'package:justsurprise/model/add_address_response_model.dart';
import 'package:justsurprise/model/add_cart_response_model.dart';
import 'package:justsurprise/model/add_order_response_model.dart';
import 'package:justsurprise/model/address_response_model.dart';
import 'package:justsurprise/model/bakery_fresh_cake_response_model.dart';
import 'package:justsurprise/model/best_seller_response_model.dart';
import 'package:justsurprise/model/category_click_response_model.dart';
import 'package:justsurprise/model/category_response_model.dart';
import 'package:justsurprise/model/contact_response_model.dart';
import 'package:justsurprise/model/delete_address_response_model.dart';
import 'package:justsurprise/model/delete_cart_response_model.dart';
import 'package:justsurprise/model/edit_address_response_model.dart';
import 'package:justsurprise/model/faq_response_model.dart';
import 'package:justsurprise/model/fav_flower_response_model.dart';
import 'package:justsurprise/model/gift_tell_stories_response_model.dart';
import 'package:justsurprise/model/gift_trends_response_model.dart';
import 'package:justsurprise/model/gift_type_response_model.dart';
import 'package:justsurprise/model/just_surprise_response_model.dart';
import 'package:justsurprise/model/may_also_like_response_model.dart';
import 'package:justsurprise/model/most_loved_gift_response_model.dart';
import 'package:justsurprise/model/new_arrivals_response_model.dart';
import 'package:justsurprise/model/occasion_response_model.dart';
import 'package:justsurprise/model/pincode_response_model.dart';
import 'package:justsurprise/model/product_detail_response_model.dart';
import 'package:justsurprise/model/product_review_response_model.dart';
import 'package:justsurprise/model/recent_product_add_response_model.dart';
import 'package:justsurprise/model/recent_product_view_response_model.dart';
import 'package:justsurprise/model/same_day_delivery_response_model.dart';
import 'package:justsurprise/model/shipping_data_response_model.dart';
import 'package:justsurprise/model/shipping_time_response_model.dart';
import 'package:justsurprise/model/view_cart_response_model.dart';
import 'package:justsurprise/model/view_order_response_model.dart';
import 'package:justsurprise/res/app_url/app_url.dart';
import 'package:justsurprise/view_models/controller/add_delivery_reviews_view_model.dart';
import 'package:justsurprise/view_models/controller/addon_response_model.dart';

import '../model/delete_order_response_model.dart';
import '../model/filter_response_model.dart';
import '../model/find_gift_response_model.dart';
import '../model/order_detail_response-model.dart';
import '../model/pincode_check_response_model.dart';
import '../model/search_product_response_model.dart';
import '../view_models/controller/add_product_review_view_model.dart';
import '../view_models/controller/get_all_sale_product_response_model.dart';

class ApiRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> signUpApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.signUpApi);
    return response;
  }

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.loginApi);
    return response;
  }

  Future<JustSurpriseResponseModel> justSurpriseApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.justSurpriseFragApi);
    return JustSurpriseResponseModel.fromJson(response);
  }

  Future<OccasionResponseModel> occasionApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.occasionApi);
    return OccasionResponseModel.fromJson(response);
  }

  Future<GiftTypeResponseModel> giftTypeApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.giftTypeApi);
    return GiftTypeResponseModel.fromJson(response);
  }

  Future<FindGiftResponseModel> findGiftApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.findGiftApi);
    return FindGiftResponseModel.fromJson(response);
  }

  Future<CategoryResponseModel> categoryApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.categoryApi);
    return CategoryResponseModel.fromJson(response);
  }

  Future<CategoryClickResponseModel> categoryClickApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.categoryClickApi);
    return CategoryClickResponseModel.fromJson(response);
  }

  Future<SameDayDeliveryResponseModel> sameDayDeliveryApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sameDayDeliveryApi);
    return SameDayDeliveryResponseModel.fromJson(response);
  }

  Future<BestSellerResponseModel> bestSellerApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.bestSellerApi);
    return BestSellerResponseModel.fromJson(response);
  }

  Future<NewArrivalsResponseModel> newArrivalsApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.newArrivalsApi);
    return NewArrivalsResponseModel.fromJson(response);
  }

  Future<FaqResponseModel> faqApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.faqApi);
    return FaqResponseModel.fromJson(response);
  }

  Future<ContactResponseModel> contactApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.contactApi);
    return ContactResponseModel.fromJson(response);
  }

  Future<AddressResponseModel> viewAddressApi(var data) async {
    dynamic response = await _apiServices.postApi(data,AppUrl.viewAddressApi);
    return AddressResponseModel.fromJson(response);
  }

  Future<EditResponseModel> editAddressApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.editAddressApi);
    return EditResponseModel.fromJson(response);
  }

  Future<DeleteAddressResponseModel> deleteAddressApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.deleteAddressApi);
    return DeleteAddressResponseModel.fromJson(response);
  }

  Future<AddAddressResponseModel> addAddressApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.addAddressApi);
    return AddAddressResponseModel.fromJson(response);
  }

  Future<MostLoveGiftViewAllResponseModel> mostLovedGiftViewAllApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.mostLovedGiftViewAllApi);
    return MostLoveGiftViewAllResponseModel.fromJson(response);
  }

  Future<GiftTrendsViewAllResponseModel> giftTrendsViewAllApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.giftTrendsViewAllApi);
    return GiftTrendsViewAllResponseModel.fromJson(response);
  }

  Future<FavFlowerViewAllResponseModel> favFlowerViewAllApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.favFlowerViewAllApi);
    return FavFlowerViewAllResponseModel.fromJson(response);
  }

  Future<BakeryFreshCakeViewAllResponseModel> bakeryFreshCakeViewAllApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.bakeryFreshCakeViewAllApi);
    return BakeryFreshCakeViewAllResponseModel.fromJson(response);
  }

  Future<GiftTellStoriesViewAllResponseModel> giftTellStoriesViewAllApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.giftTellStoriesViewAllApi);
    return GiftTellStoriesViewAllResponseModel.fromJson(response);
  }

  Future<ProductDetailResponseModel> productDetailApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.productDetailApi);
    return ProductDetailResponseModel.fromJson(response);
  }

  Future<ProductReviewResponseModel> productReviewApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.productReviewApi);
    return ProductReviewResponseModel.fromJson(response);
  }

  Future<RecentProductViewResponseModel> recentProductViewApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.recentProductViewApi);
    return RecentProductViewResponseModel.fromJson(response);
  }

  Future<MayAlsoLikeResponseModel> mayAlsoLikeApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.mayAlsoLikeApi);
    return MayAlsoLikeResponseModel.fromJson(response);
  }

  Future<RecentProductAddResponseModel> recentProductAddApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.recentProductAddApi);
    return RecentProductAddResponseModel.fromJson(response);
  }

  Future<dynamic> forgotPasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.forgotPasswordApi);
    return response;
  }

  Future<dynamic> updateProfileApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.updateProfileApi);
    return response;
  }

  Future<dynamic> changePasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.changePasswordApi);
    return response;
  }

  Future<ViewCartResponseModel> viewCartApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.viewCartApi);
    return ViewCartResponseModel.fromJson(response);
  }

  Future<searchProductResponseModel> searchProduct(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.searchProductApi);
    return searchProductResponseModel.fromJson(response);
  }

  Future<PincodeResponseModel> pincodeApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.pincodeApi);
    return PincodeResponseModel.fromJson(response);
  }

  Future<AddoneResponseModel> addon(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.addonApi);
    return AddoneResponseModel.fromJson(response);
  }

  Future<AddCartResponseModel> addCart(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.addCartApi);
    return AddCartResponseModel.fromJson(response);
  }

  Future<ShippingDataResponseModel> ShippingApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.justSurpriseFragApi);
    return ShippingDataResponseModel.fromJson(response);
  }

  Future<ShippingTimeDataResponseModel> ShippingTimeApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.justSurpriseFragApi);
    return ShippingTimeDataResponseModel.fromJson(response);
  }

  Future<DeleteCartResponseModel> deleteCartApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.deleteCartApi);
    return DeleteCartResponseModel.fromJson(response);
  }

  Future<AddOrderResponseModel> addOrderApi(var data) async {
    dynamic responce = await _apiServices.postApi(data,AppUrl.addorderApi);
    return AddOrderResponseModel.fromJson(responce);
  }

  Future<ViewOrderResponseModel> viewOrderApi(var data) async {
    dynamic responce = await _apiServices.postApi(data,AppUrl.viewOrderApi);
    return ViewOrderResponseModel.fromJson(responce);
  }

  Future<OrderDetailResponseModel> orderDetailApi(var data) async {
    dynamic responce = await _apiServices.postApi(data, AppUrl.orderDetailApi);
    return OrderDetailResponseModel.fromJson(responce);
  }

  Future<DeleteOrderResponseModel> deleteOrderApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.deleteOrderApi);
    return DeleteOrderResponseModel.fromJson(response);
  }

  Future<FilterResponseModel> filterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return FilterResponseModel.fromJson(response);
  }
  
  Future<AddProductReviewsViewModel> addProductReviewsApi(var data) async {
    dynamic response = await _apiServices.postApiWithImage(data, AppUrl.addProductReviewsApi);
    return AddProductReviewsViewModel.fromJson(response);
  }

  Future<AddDeliveryReviewsViewModel> addDeliveryReviewsApi (var data) async{
    dynamic response = await _apiServices.postApi(data, AppUrl.addDeliveryReviewsApi);
    return AddDeliveryReviewsViewModel.fromJson(response);
  }

  Future<GiftTellStoriesViewAllResponseModel> giftTellStoriesSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return GiftTellStoriesViewAllResponseModel.fromJson(response);
  }

  Future<CategoryClickResponseModel> categoryClickSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return CategoryClickResponseModel.fromJson(response);
  }

  Future<MostLoveGiftViewAllResponseModel> mostLovedGiftSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return MostLoveGiftViewAllResponseModel.fromJson(response);
  }

  Future<SameDayDeliveryResponseModel> sameDayDeliverySortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return SameDayDeliveryResponseModel.fromJson(response);
  }

  Future<BestSellerResponseModel> bestSellerSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return BestSellerResponseModel.fromJson(response);
  }

  Future<NewArrivalsResponseModel> newArrivalSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return NewArrivalsResponseModel.fromJson(response);
  }

  Future<GiftTrendsViewAllResponseModel> giftTrendsSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return GiftTrendsViewAllResponseModel.fromJson(response);
  }

  Future<FavFlowerViewAllResponseModel> favFlowerSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return FavFlowerViewAllResponseModel.fromJson(response);
  }

  Future<BakeryFreshCakeViewAllResponseModel> bakeryFreshCakeSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return BakeryFreshCakeViewAllResponseModel.fromJson(response);
  }

  Future<FindGiftResponseModel> findGiftSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return FindGiftResponseModel.fromJson(response);
  }

  Future<searchProductResponseModel> searchProductSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return searchProductResponseModel.fromJson(response);
  }

  Future<getAllSaleProductResponseModel> getAllSaleProductSortingApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.sortingApi);
    return getAllSaleProductResponseModel.fromJson(response);
  }

  Future<PincodeCheckResponseModel> pincodeCheckApi(var data)async{
    dynamic responce = await _apiServices.postApi(data, AppUrl.pincodeCheckApi);
    return PincodeCheckResponseModel.fromJson(responce);
  }

  Future<GiftTellStoriesViewAllResponseModel> giftTellStoriesFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return GiftTellStoriesViewAllResponseModel.fromJson(response);
  }

  Future<CategoryClickResponseModel> categoryClickFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return CategoryClickResponseModel.fromJson(response);
  }

  Future<MostLoveGiftViewAllResponseModel> mostLovedGiftFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return MostLoveGiftViewAllResponseModel.fromJson(response);
  }

  Future<SameDayDeliveryResponseModel> sameDayDeliveryFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return SameDayDeliveryResponseModel.fromJson(response);
  }

  Future<BestSellerResponseModel> bestSellerFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return BestSellerResponseModel.fromJson(response);
  }

  Future<NewArrivalsResponseModel> newArrivalFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return NewArrivalsResponseModel.fromJson(response);
  }

  Future<GiftTrendsViewAllResponseModel> giftTrendsFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return GiftTrendsViewAllResponseModel.fromJson(response);
  }

  Future<FavFlowerViewAllResponseModel> favFlowerFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return FavFlowerViewAllResponseModel.fromJson(response);
  }

  Future<BakeryFreshCakeViewAllResponseModel> bakeryFreshCakeFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return BakeryFreshCakeViewAllResponseModel.fromJson(response);
  }

  Future<getAllSaleProductResponseModel> getAllSaleProductFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return getAllSaleProductResponseModel.fromJson(response);
  }

  Future<FindGiftResponseModel> findGiftFilterApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.filterApi);
    return FindGiftResponseModel.fromJson(response);
  }

  Future<getAllSaleProductResponseModel> getAllSaleProductApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.getAllSaleProductApi);
    return getAllSaleProductResponseModel.fromJson(response);
  }
}
