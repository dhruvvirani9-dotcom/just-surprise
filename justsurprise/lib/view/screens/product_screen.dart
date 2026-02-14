import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/data/response/status.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/just_fragment_view_model.dart';
import 'package:justsurprise/view_models/controller/product_view_model.dart';
import '../../view_models/controller/filter_view_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productVM = Get.put(ProductScreenViewModel());
  final justSurpriseVM = Get.find<JustFragmentViewModel>();
  final filterVM = Get.put(FilterViewModel());
  final ScrollController _Controller = ScrollController();
  var argName = "";
  var slugName = "";

  @override
  void initState() {
    super.initState();
    productVM.isBottom.value = false;
    _checkConnection();
    if (Get.arguments != null) {
      argName = Get.arguments[0];
      slugName = Get.arguments[1];
      productVM.categoryId = Get.arguments[2];
    }

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
      productVM.is_same_day_delivery = "1";
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
      productVM.product_types = "Most Loved Gifts";
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
      productVM.product_types = "Gifts In Trend";
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
      productVM.product_types = "Pick Their Fav Flowers";
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
      productVM.product_types = "Bakery-Fresh Cakes";
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
      productVM.product_types = "Gifts That Tell Stories";
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
      productVM.occation_id = justSurpriseVM.occasionId!.value.toString();
      productVM.categoryId = justSurpriseVM.giftTypeId!.value.toString();
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
      productVM.product_types = justSurpriseVM.searchController.value.text;
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
      productVM.product_types = "Gifts In Trend";
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

    _Controller.addListener(() {
      if(_Controller.position.maxScrollExtent == _Controller.offset){
        productVM.page++;
        productVM.isBottom.value = true;
          if (argName == "category") {
            if(productVM.page <= productVM.categoryTotalPage.value){
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
            }
          } else if (argName == "sameDayDelivery") {
            if(productVM.page <= productVM.sameDayDeliveryTotalPage.value){
              productVM.sameDayDeliveryApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "bestSeller") {
            if(productVM.page <= productVM.bestSellerTotalPage.value){
              productVM.bestSellerApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "newArrivals") {
            if(productVM.page <= productVM.newArrivalsTotalPage.value){
              productVM.newArrivalsApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "mostLovedGift") {
            if(productVM.page <= productVM.mostLovedGiftTotalPage.value){
              productVM.mostLovedGiftViewAllApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "giftInTrend") {
            if(productVM.page <= productVM.giftTrendsTotalPage.value){
              productVM.giftTrendsViewAllApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "pickTheirFlowers") {
            if(productVM.page <= productVM.favFlowerTotalPage.value){
              productVM.favFlowerViewAllApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "bakeryFreshCakes") {
            if(productVM.page <= productVM.bakeryTotalPage.value){
              productVM.bakeryFreshCakeViewAllApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "giftTellStories") {
            if(productVM.page <= productVM.giftTellStoriesTotalPage.value){
              productVM.giftTellStoriesViewAllApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "searchProduct") {
            if(productVM.page <= productVM.searchTotalPage.value){
              productVM.searchProductApi(context,
                  productVM.page,
                  productVM.filter_value,
                  productVM.sort_type,
                  productVM.product_types,
                  productVM.is_same_day_delivery,
                  productVM.categoryId,
                  productVM.occation_id
              );
            }
          } else if (argName == "giftFinder") {
            if(productVM.page <= productVM.findGiftTotalPage.value){
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
            }
          } else if (argName == "getAllSaleProduct") {
            if(productVM.page <= productVM.getAllSaleProductTotalPage.value){
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
      }else{
        productVM.isBottom.value = false;
      }
    },);
  }

  manageSpace(){
    if (argName == "category") {
      double space = int.parse(productVM.categoryCurrentPage.value) == productVM.categoryTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "sameDayDelivery") {
      double space = int.parse(productVM.sameDayDeliveryCurrentPage.value) == productVM.sameDayDeliveryTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "bestSeller") {
      double space = int.parse(productVM.bestSellerCurrentPage.value) == productVM.bestSellerTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "newArrivals") {
      double space = int.parse(productVM.newArrivalsCurrentPage.value) == productVM.newArrivalsTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "mostLovedGift") {
      double space = int.parse(productVM.mostLovedGiftCurrentPage.value) == productVM.mostLovedGiftTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "giftInTrend") {
      double space = int.parse(productVM.giftTrendsCurrentPage.value) == productVM.giftTrendsTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "pickTheirFlowers") {
      double space = int.parse(productVM.favFlowerCurrentPage.value) == productVM.favFlowerTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "bakeryFreshCakes") {
      double space = int.parse(productVM.bakeryCurrentPage.value) == productVM.bakeryTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "giftTellStories") {
      double space = int.parse(productVM.giftTellStoriesCurrentPage.value) == productVM.giftTellStoriesTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "searchProduct") {
      double space = int.parse(productVM.searchCurrentPage.value) == productVM.searchTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "giftFinder") {
      double space = int.parse(productVM.findGiftCurrentPage.value) == productVM.findGiftTotalPage.value? 10.0 : 60.0;
      return space;
    } else if (argName == "getAllSaleProduct") {
      double space = int.parse(productVM.getAllSaleProductCurrentPage.value) == productVM.getAllSaleProductTotalPage.value? 10.0 : 60.0;
      return space;
    }
  }

  manageBottomLoder(){
    if (argName == "category") {
      if(int.parse(productVM.categoryCurrentPage.value) == productVM.categoryTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "sameDayDelivery") {
      if(int.parse(productVM.sameDayDeliveryCurrentPage.value) == productVM.sameDayDeliveryTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "bestSeller") {
      if(int.parse(productVM.bestSellerCurrentPage.value) == productVM.bestSellerTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "newArrivals") {
      if(int.parse(productVM.newArrivalsCurrentPage.value) == productVM.newArrivalsTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "mostLovedGift") {
      if(int.parse(productVM.mostLovedGiftCurrentPage.value) == productVM.mostLovedGiftTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "giftInTrend") {
      if(int.parse(productVM.giftTrendsCurrentPage.value) == productVM.giftTrendsTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "pickTheirFlowers") {
      if(int.parse(productVM.favFlowerCurrentPage.value) == productVM.favFlowerTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "bakeryFreshCakes") {
      if(int.parse(productVM.bakeryCurrentPage.value) == productVM.bakeryTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "giftTellStories") {
      if(int.parse(productVM.giftTellStoriesCurrentPage.value) == productVM.giftTellStoriesTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "searchProduct") {
      if(int.parse(productVM.searchCurrentPage.value) == productVM.searchTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "giftFinder") {
      if(int.parse(productVM.findGiftCurrentPage.value) == productVM.findGiftTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    } else if (argName == "getAllSaleProduct") {
      if(int.parse(productVM.getAllSaleProductCurrentPage.value) == productVM.getAllSaleProductTotalPage.value){
        return SizedBox(width: 0);
      }else{
        return productVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
      }
    }
  }

  Future<void> _checkConnection() async {
    productVM.isConnected.value = await Utils.isConnected();
  }

  loading(){
    if (argName == "category") {
      return productVM.categoryProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "searchProduct") {
      return productVM.searchProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "giftFinder") {
      return productVM.findGiftProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData.length == 0 ? const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0));
    }
  }

  bool getIsLoading() {
    if (argName == "getAllSaleProduct" || argName == "category" || argName == "sameDayDelivery" || argName == "bestSeller" || argName == "newArrivals" || argName == "mostLovedGift" || argName == "giftInTrend" || argName == "pickTheirFlowers" || argName == "bakeryFreshCakes" || argName == "giftTellStories" || argName == "searchProduct" || argName == "giftFinder") {
      if(productVM.rxRequestStatus.value == Status.LOADING) {
        return false;
      }
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
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
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(RoutesName.filterScreen,arguments: [argName, slugName,]);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(IconAssets.filter), width: 20.0, height: 20.0),
                          SizedBox(width: 5.0),
                          Text("Filter", style: TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w300)),
                          Obx(() => checkIcon(),)
                        ]
                    ),
                  ),
                ),
              ),
              const VerticalDivider(color: AppColor.lightGrayColor, thickness: 0.5),
              Expanded(
                child: InkWell(
                  onTap: () => sortingDialog(),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(IconAssets.sort), width: 18.0, height: 18.0),
                        SizedBox(width: 5.0),
                        Text("Sort", style: TextStyle(color: AppColor.blackEelColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w300))
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: AppColor.lavenderColor,
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          title: Text(getTitle(), style: const TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
          centerTitle: true
        ),
        body: Obx(() => productVM.isConnected.value ? getIsLoading() ? checkNullData() ? SafeArea(
          child: Stack(
            children: [
              GridView.builder(
                controller: _Controller,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: manageSpace()),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 18 / 30, crossAxisCount: 2, crossAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      productVM.productIndex.value = index;
                      moveToNextScreen(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.dullGrayColor,
                              blurRadius: 22,
                            ),
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
                              child: Image(image: NetworkImage(getProduceImage(index)))),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(getProductName(index), maxLines: 1, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis, fontSize: 12, fontFamily: "Kanit")),
                                const SizedBox(height: 2.0),
                                Row(
                                  children: [
                                    getProductIsOnSale(index) == "1" ? Row(
                                      children: [
                                        Text("₹${getdiscountProductPrice(index)}/- ", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                        Text("₹${getProductMrp(index)}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro",decoration: TextDecoration.lineThrough)),
                                        Text(" (${getProductSale(index)}%)OFF", style: const TextStyle(color: Colors.green, fontSize: 12, fontFamily: "Readex Pro",decoration: TextDecoration.lineThrough)),
                                      ],
                                    ) : Row(
                                      children: [
                                        Text("₹${getProductPrice(index)}/- ", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                        Text("₹${getProductMrp(index)}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro",decoration: TextDecoration.lineThrough)),
                                      ],
                                    )
                                    // SizedBox(width: 2.0),
                                    // Text("₹ 6999/-", style: TextStyle(color: Color(0xFF454443), fontSize: 12, fontFamily: "Readex Pro")),
                                    // SizedBox(width: 2.0),
                                    // Text("25% off", style: TextStyle(color: Color(0xFF34A853), fontSize: 12, fontFamily: "Readex Pro")),
                                  ],
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    getSameDayDelivery(index) == "1" ?
                                    const Text("Earliest Delivery:Today", maxLines: 1, style: TextStyle(color: AppColor.blackEelColor, fontSize: 12, overflow: TextOverflow.ellipsis, fontFamily: "Kanit")) :
                                    const Text("", style: TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit")),
                                  ],
                                ),
                                const SizedBox(height: 5.0),
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
                                          Text(getProductRating(index), style: const TextStyle(color: AppColor.whiteColor, fontSize: 10.0, fontFamily: "Kanit")),
                                          const SizedBox(width: 3.0),
                                          const Icon(Icons.star, color: AppColor.whiteColor, size: 12.0)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                    getProductRating(index) == "" ? Text("0 Reviews", style: TextStyle(color: AppColor.blackEelColor, fontSize: 10, fontFamily: "Kanit")) :
                                    Text("${getProductRating(index)} Reviews", style: TextStyle(color: AppColor.blackEelColor, fontSize: 10, fontFamily: "Kanit")),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }, itemCount: getProductLength(),
              ),
              manageBottomLoder(),
            ],
          ),
        ) : loading() : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)) : Center(
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
        ),
      )
    );
  }

  Future<void> sortingDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              decoration: BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: const BoxDecoration(
                      color: AppColor.lightGrayColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.dullGrayColor,
                            spreadRadius: 5,
                            blurRadius: 21,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Sort By", style: TextStyle(color: AppColor.blackEelColor, fontSize: 18, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                        InkWell(
                            onTap: () {
                            Get.back(closeOverlays: true);
                          }, child: const Image(image: AssetImage(IconAssets.dialogSortCancelIcon), width: 17, height: 17))
                      ],
                    ),
                  ),
                  Obx(() => ListTile(
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -3),
                      leading: const Text('Recommended', style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Readex Pro", fontSize: 14, fontWeight: FontWeight.w300)),
                      trailing: Radio(
                        value: "Recommended",
                        groupValue: productVM.sortingValue.value,
                        activeColor: AppColor.mangoTangoColor,
                        onChanged: (value) {
                          productVM.setSortingText(value!);
                          productVM.page = 1;
                          productVM.sort_type = productVM.sortingValue.value;
                          GetsortingApis();
                          // productVM.sortingApi(context,
                          //     productVM.sortingValue.value.toString(),
                          //     argName,
                          //     productVM.page,
                          //     productVM.categoryId,
                          //     productVM.is_same_day_delivery,
                          //     productVM.occation_id,
                          //     productVM.product_types,
                          // );
                          print(productVM.sortingValue.toString());
                          Get.back(closeOverlays: true);
                          },
                      )
                  )),
                  Obx(() => ListTile(
                    contentPadding: const EdgeInsets.only(left: 10.0),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Text('New', style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Readex Pro", fontSize: 14, fontWeight: FontWeight.w300)),
                    trailing: Radio(
                      value: "New",
                      groupValue: productVM.sortingValue.value,
                      activeColor: AppColor.mangoTangoColor,
                      onChanged: (value) {
                        productVM.setSortingText(value!);
                        Get.back(closeOverlays: true);
                        productVM.page = 1;
                        productVM.sort_type = productVM.sortingValue.value;
                        GetsortingApis();
                        print(productVM.sortingValue.toString());
                        },
                    ),
                  )),
                  Obx(() => ListTile(
                    contentPadding: const EdgeInsets.only(left: 10.0),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Text('Price : Low To High', style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Readex Pro", fontSize: 14, fontWeight: FontWeight.w300)),
                    trailing: Radio(
                      value: "Price : Low To High",
                      groupValue: productVM.sortingValue.value,
                      activeColor: AppColor.mangoTangoColor,
                      onChanged: (value) {
                        productVM.setSortingText(value!);
                        Get.back(closeOverlays: true);
                        productVM.page = 1;
                        productVM.sort_type = productVM.sortingValue.value;
                        GetsortingApis();
                        print(productVM.sortingValue.toString());
                        },
                    ),
                  )),
                  Obx(() => ListTile(
                    contentPadding: const EdgeInsets.only(left: 10.0),
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Text('Price : High To Low', style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Readex Pro", fontSize: 14, fontWeight: FontWeight.w300)),
                    trailing: Radio(
                      value: "Price : High To Low",
                      groupValue: productVM.sortingValue.value,
                      activeColor: AppColor.mangoTangoColor,
                      onChanged: (value) {
                        productVM.setSortingText(value!);
                        Get.back(closeOverlays: true);
                        productVM.page = 1;
                        productVM.sort_type = productVM.sortingValue.value;
                        GetsortingApis();
                        print(productVM.sortingValue.toString());
                        },
                    ),
                  )),
                ],
              ),
            ),
          );
        }
    );
  }

  GetsortingApis(){
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

  String getProduceImage(int index) {
    if (argName == "giftFinder") {
      return Utils.imageUrl + productVM.findGiftProductData[index].image!;
    } else if (argName == "category") {
      return Utils.imageUrl + productVM.categoryProductData[index].image!;
    } else if (argName == "mostLovedGift") {
      return Utils.imageUrl + productVM.mostLovedGiftProductData[index].image!;
    } else if (argName == "sameDayDelivery") {
      return Utils.imageUrl + productVM.sameDayDeliveryProductData[index].image!;
    } else if (argName == "bestSeller") {
      return Utils.imageUrl + productVM.bestSellerProductData[index].image!;
    } else if (argName == "newArrivals") {
      return Utils.imageUrl + productVM.newArrivalsProductData[index].image!;
    } else if (argName == "giftInTrend") {
      return Utils.imageUrl + productVM.giftTrendsProductData[index].image!;
    } else if (argName == "pickTheirFlowers") {
      return Utils.imageUrl + productVM.favFlowerProductData[index].image!;
    } else if (argName == "bakeryFreshCakes") {
      return Utils.imageUrl + productVM.bakeryProductData[index].image!;
    } else if (argName == "giftTellStories") {
      return Utils.imageUrl + productVM.giftTellStoriesProductData[index].image!;
    } else if (argName == "searchProduct") {
      return Utils.imageUrl+productVM.searchProductData[index].image!;
    } else if (argName == "getAllSaleProduct") {
      return Utils.imageUrl+productVM.getAllSaleProductData[index].image!;
    }
    return "";
  }

  String getProductName(int index) {
    if (argName == "giftFinder") {
      return productVM.findGiftProductData[index].productName!;
    } else if (argName == "category") {
      return productVM.categoryProductData[index].productName!;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData[index].productName!;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData[index].productName!;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData[index].productName!;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData[index].productName!;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData[index].productName!;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData[index].productName!;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData[index].productName!;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData[index].productName!;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData[index].productName!;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData[index].productName!;
    }
    return "";
  }

  String getProductMrp(int index) {
    if (argName == "giftFinder") {
      return productVM.findGiftProductData[index].mrp!;
    } else if (argName == "category") {
      return productVM.categoryProductData[index].mrp!;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData[index].mrp!;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData[index].mrp!;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData[index].mrp!;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData[index].mrp!;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData[index].mrp!;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData[index].mrp!;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData[index].mrp!;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData[index].mrp!;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData[index].mrp!;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData[index].mrp!;
    }
    return "";
  }

  String getdiscountProductPrice(int index) {
    if (argName == "giftFinder") {
      var salDiscount = int.parse(productVM.findGiftProductData[index].saleDiscount!);
      var price = int.parse(productVM.findGiftProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "category") {
      var salDiscount = int.parse(productVM.categoryProductData[index].saleDiscount!);
      var price = int.parse(productVM.categoryProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "mostLovedGift") {
      var salDiscount = int.parse(productVM.mostLovedGiftProductData[index].saleDiscount!);
      var price = int.parse(productVM.mostLovedGiftProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "sameDayDelivery") {
      var salDiscount = int.parse(productVM.sameDayDeliveryProductData[index].saleDiscount!);
      var price = int.parse(productVM.sameDayDeliveryProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "bestSeller") {
      var salDiscount = int.parse(productVM.bestSellerProductData[index].saleDiscount!);
      var price = int.parse(productVM.bestSellerProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "newArrivals") {
      var salDiscount = int.parse(productVM.newArrivalsProductData[index].saleDiscount!);
      var price = int.parse(productVM.newArrivalsProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "giftInTrend") {
      var salDiscount = int.parse(productVM.giftTrendsProductData[index].saleDiscount!);
      var price = int.parse(productVM.giftTrendsProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "pickTheirFlowers") {
      var salDiscount = int.parse(productVM.favFlowerProductData[index].saleDiscount!);
      var price = int.parse(productVM.favFlowerProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "bakeryFreshCakes") {
      var salDiscount = int.parse(productVM.bakeryProductData[index].saleDiscount!);
      var price = int.parse(productVM.bakeryProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "giftTellStories") {
      var salDiscount = int.parse(productVM.giftTellStoriesProductData[index].saleDiscount!);
      var price = int.parse(productVM.giftTellStoriesProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "searchProduct") {
      var salDiscount = int.parse(productVM.searchProductData[index].saleDiscount!);
      var price = int.parse(productVM.searchProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    } else if (argName == "getAllSaleProduct") {
      var salDiscount = int.parse(productVM.getAllSaleProductData[index].saleDiscount!);
      var price = int.parse(productVM.getAllSaleProductData[index].price!);
      var dicount = (price*salDiscount)/100;
      return "${price-dicount}";
    }
    return "";
  }

  String getProductPrice(int index) {
    if (argName == "giftFinder") {
      return productVM.findGiftProductData[index].price!;
    } else if (argName == "category") {
      return productVM.categoryProductData[index].price!;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData[index].price!;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData[index].price!;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData[index].price!;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData[index].price!;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData[index].price!;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData[index].price!;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData[index].price!;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData[index].price!;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData[index].price!;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData[index].price!;
    }
    return "";
  }

  String getProductSale(int index) {
    if (argName == "giftFinder") {
      return productVM.findGiftProductData[index].saleDiscount!;
    } else if (argName == "category") {
      return productVM.categoryProductData[index].saleDiscount!;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData[index].saleDiscount!;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData[index].saleDiscount!;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData[index].saleDiscount!;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData[index].saleDiscount!;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData[index].saleDiscount!;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData[index].saleDiscount!;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData[index].saleDiscount!;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData[index].saleDiscount!;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData[index].saleDiscount!;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData[index].saleDiscount!;
    }
    return "";
  }

  String getProductIsOnSale(int index) {
    if (argName == "giftFinder") {
      return productVM.findGiftProductData[index].isOnSale!;
    } else if (argName == "category") {
      return productVM.categoryProductData[index].isOnSale!;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData[index].isOnSale!;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData[index].isOnSale!;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData[index].isOnSale!;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData[index].isOnSale!;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData[index].isOnSale!;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData[index].isOnSale!;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData[index].isOnSale!;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData[index].isOnSale!;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData[index].isOnSale!;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData[index].isOnSale!;
    }
    return "";
  }

  String getSameDayDelivery(int index) {
    if (argName == "giftFinder") {
      return productVM.findGiftProductData[index].isSameDayDelivery!;
    } else if (argName == "category") {
      return productVM.categoryProductData[index].isSameDayDelivery!;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData[index].isSameDayDelivery!;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData[index].isSameDayDelivery!;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData[index].isSameDayDelivery!;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData[index].isSameDayDelivery!;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData[index].isSameDayDelivery!;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData[index].isSameDayDelivery!;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData[index].isSameDayDelivery!;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData[index].isSameDayDelivery!;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData[index].isSameDayDelivery!;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData[index].isSameDayDelivery!;
    }
    return "";
  }

  String getProductRating(int index) {
    if (argName == "giftFinder") {
      return productVM.findGiftProductData[index].rating!;
    } else if (argName == "category") {
      return productVM.categoryProductData[index].rating!;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData[index].rating!;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData[index].rating!;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData[index].rating!;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData[index].rating!;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData[index].rating!;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData[index].rating!;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData[index].rating!;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData[index].rating!;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData[index].rating!;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData[index].rating!;
    }
    return "";
  }

 int? getProductLength() {
    if (argName == "giftFinder") {
     return productVM.findGiftProductData.length;
    } else if (argName == "category") {
      return productVM.categoryProductData.length;
    } else if (argName == "mostLovedGift") {
      return productVM.mostLovedGiftProductData.length;
    } else if (argName == "sameDayDelivery") {
      return productVM.sameDayDeliveryProductData.length;
    } else if (argName == "bestSeller") {
      return productVM.bestSellerProductData.length;
    } else if (argName == "newArrivals") {
      return productVM.newArrivalsProductData.length;
    } else if (argName == "giftInTrend") {
      return productVM.giftTrendsProductData.length;
    } else if (argName == "pickTheirFlowers") {
      return productVM.favFlowerProductData.length;
    } else if (argName == "bakeryFreshCakes") {
      return productVM.bakeryProductData.length;
    } else if (argName == "giftTellStories") {
      return productVM.giftTellStoriesProductData.length;
    } else if (argName == "searchProduct") {
      return productVM.searchProductData.length;
    } else if (argName == "getAllSaleProduct") {
      return productVM.getAllSaleProductData.length;
    }
    return 0;
  }

  bool checkNullData() {
    if (argName == "giftFinder") {
      if (productVM.findGiftProductData.length == 0) {
        return false;
      }
    } else if (argName == "category") {
      if (productVM.categoryProductData.length == 0) {
        return false;
      }
    } else if (argName == "mostLovedGift") {
      if (productVM.mostLovedGiftProductData.length == 0) {
        return false;
      }
    } else if (argName == "sameDayDelivery") {
      if (productVM.sameDayDeliveryProductData.length == 0) {
        return false;
      }
    } else if (argName == "bestSeller") {
      if (productVM.bestSellerProductData.length == 0) {
        return false;
      }
    } else if (argName == "newArrivals") {
      if (productVM.newArrivalsProductData.length == 0) {
        return false;
      }
    } else if (argName == "giftInTrend") {
      if (productVM.giftTrendsProductData.length == 0) {
        return false;
      }
    } else if (argName == "pickTheirFlowers") {
      if (productVM.favFlowerProductData.length == 0) {
        return false;
      }
    } else if (argName == "bakeryFreshCakes") {
      if (productVM.bakeryProductData.length == 0) {
        return false;
      }
    } else if (argName == "giftTellStories") {
      if (productVM.giftTellStoriesProductData.length == 0) {
        return false;
      }
    } else if (argName == "searchProduct") {
      if (productVM.searchProductData.length == 0) {
        return false;
      }
    } else if (argName == "getAllSaleProduct") {
      if (productVM.getAllSaleProductData.length == 0) {
        return false;
      }
    }
    return true;
  }

  String getTitle() {
    if (argName == "giftFinder") {
      return "Gift Finder";
    } else if (argName == "category") {
      return slugName;
    } else if (argName == "mostLovedGift") {
      return "Most Loved Gifts";
    } else if (argName == "sameDayDelivery") {
      return "Same Day Delivery";
    } else if (argName == "bestSeller") {
      return "Best Sellers";
    } else if (argName == "newArrivals") {
      return "New Arrivals";
    } else if (argName == "giftInTrend") {
      return "Gifts in Trends";
    } else if (argName == "pickTheirFlowers") {
      return "Pick Their Fav Flowers";
    } else if (argName == "bakeryFreshCakes") {
      return "Bakery Fresh Cakes";
    } else if (argName == "giftTellStories") {
      return "Gifts That Tell Stories";
    } else if (argName == "searchProduct") {
      return "${justSurpriseVM.searchController.value.text}";
    } else if (argName == "getAllSaleProduct") {
      return "Get All Sale Product";
    }
    return "";
  }

  void moveToNextScreen(int index) {
    if (argName == "giftFinder") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.findGiftProductData[index].id!);
    } else if (argName == "category") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.categoryProductData[index].id!);
    } else if (argName == "mostLovedGift") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.mostLovedGiftProductData[index].id!);
    } else if (argName == "sameDayDelivery") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.sameDayDeliveryProductData[index].id!);
    } else if (argName == "bestSeller") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.bestSellerProductData[index].id!);
    } else if (argName == "newArrivals") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.newArrivalsProductData[index].id!);
    } else if (argName == "giftInTrend") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.giftTrendsProductData[index].id!);
    } else if (argName == "pickTheirFlowers") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.favFlowerProductData[index].id!);
    } else if (argName == "bakeryFreshCakes") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.bakeryProductData[index].id!);
    } else if (argName == "giftTellStories") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.giftTellStoriesProductData[index].id!);
    } else if (argName == "searchProduct") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.searchProductData[index].id!);
    } else if (argName == "getAllSaleProduct") {
      Get.toNamed(RoutesName.productDetailScreen, arguments: productVM.getAllSaleProductData[index].id!);
    }
  }

  Widget checkIcon() {
    print("FilterVal Langth:-${filterVM.filterVal.length}");
   return filterVM.filterVal.length > 0 ?
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(
       width: 20,
       height: 20,
       decoration: BoxDecoration(
         color: Colors.green,
         shape: BoxShape.circle
       ),
       child: Center(child: Text("${filterVM.filterVal.length}",style: TextStyle(color: Colors.white,fontSize: 10),)),
     ),
   ) : SizedBox(width: 0,);
  }

}

