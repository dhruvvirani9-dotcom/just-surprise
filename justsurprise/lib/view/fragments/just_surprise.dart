import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/model/gift_type_response_model.dart';
import 'package:justsurprise/model/occasion_response_model.dart';
import 'package:justsurprise/model/pincode_response_model.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/assets/image_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/components/view_all_button.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/just_fragment_view_model.dart';
import 'package:justsurprise/view_models/controller/product_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../data/response/status.dart';
import '../../view_models/controller/address_view_model.dart';

class JustSurpriseFragment extends StatefulWidget {
  const JustSurpriseFragment({super.key});

  @override
  State<JustSurpriseFragment> createState() => _JustSurpriseFragmentState();
}

class _JustSurpriseFragmentState extends State<JustSurpriseFragment> {
  final justSurpriseVM = Get.put(JustFragmentViewModel());
  final pageController = PageController();
  final addressVM = Get.put(AddressViewModel());
  final saleDataPageController = PageController();
  OccationData? occasionValue;
  GiftTypeData? giftTypeValue;
  @override
  void initState() {
    super.initState();
    _checkConnection();
    justSurpriseVM.justSurpriseApi(context);
  }

  Future<void> _checkConnection() async {
    justSurpriseVM.isConnected.value = await Utils.isConnected();
  }

  bool getIsLoading() {
    if(justSurpriseVM.rxRequestStatus.value == Status.LOADING) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => justSurpriseVM.isConnected.value ? getIsLoading() ? SingleChildScrollView(
      child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      radius: 1.5,
                      colors: [
                        AppColor.catskillWhiteColor,
                        AppColor.lavenderMistColor,
                        AppColor.ghostColor,
                      ]
                  )
              ),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CountryListPick(
                              theme: CountryTheme(
                                isShowFlag: true,
                                isShowTitle: false,
                                isShowCode: false,
                                isDownIcon: false,
                                showEnglishName: false,
                              ),
                              initialSelection: '+91',
                              onChanged: (code) {
                               // print(code?.name);
                               // print(code?.code);
                              },
                            ),
                            const VerticalDivider(color: AppColor.deepSaffronColor, thickness: 0.4, width: 5.0),
                            Row(
                              children: [
                                Image(image: AssetImage(IconAssets.location), width: 22.0, height: 22.0),
                                SizedBox(width: 5.0),
                                // Text("Select Delivery Location", style: TextStyle(color: AppColor.carbonGreyColor, fontSize: 14.0, fontFamily: "Kanit")),
                                SizedBox(
                                  width: 270,
                                  child: Autocomplete<PincodeData>(
                                    optionsBuilder: (TextEditingValue value) {
                                      if(value.text.isEmpty){
                                        return List.empty();
                                      }
                                      return addressVM.pincodResponseData.value.pincodeData != null ? addressVM.pincodResponseData.value.pincodeData!.where((element) => element.pincode!.toLowerCase().contains(value.text.toLowerCase()),).toList(): List.empty();
                                  },
                                    fieldViewBuilder: (context, TextEditingController controller, FocusNode node,Function onSubmit) => TextField(
                                      onChanged: (value) {
                                        print("onChanged$value");
                                        if(value.length > 0){
                                          addressVM.pincodeApi(context,value);
                                        }
                                      },
                                      controller: controller,
                                      focusNode: node,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Enter Pincode...",
                                      ),
                                    ),
                                    optionsViewBuilder: (context, Function onSelected,Iterable<PincodeData> dataList) {
                                      return Material(
                                        child:ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: dataList.length,
                                          itemBuilder: (context, index) {
                                            PincodeData pincodeData = dataList.elementAt(index);
                                            return ListTile(
                                              onTap: () => onSelected(pincodeData),
                                              title: Text("${pincodeData.officeName.toString()} ${pincodeData.district.toString()}"),
                                              subtitle: Text(pincodeData.pincode.toString()),
                                            );
                                          },),
                                      );
                                    },
                                    onSelected: (value) {
                                      print(value.officeName);
                                      justSurpriseVM.selectedPincodeValue.value = value.pincode.toString();
                                      FocusScope.of(context).unfocus();
                                    },
                                    displayStringForOption: (PincodeData data) => "${data.officeName!},${data.district!},${data.pincode!}",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(alignment: Alignment.centerRight, child: Image(image: AssetImage(IconAssets.rightArrow), width: 14.0, height: 14.0)),
                        )
                        ],
                      ),
                    ),
                  const Divider(color: AppColor.deepSaffronColor, thickness: 0.4, height: 0.0),
                  Row(
                    children: [
                      InkWell(
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
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: AppColor.chardonnayColor, width: 1.0),
                            boxShadow: const [
                              BoxShadow(color: AppColor.seashellColor),
                              BoxShadow(
                                color: AppColor.dullGrayColor,
                                spreadRadius: 0.0,
                                offset: Offset(-6, 7),
                                blurRadius: 25.0,
                              )
                            ]
                          ),
                          child: TextField(
                            controller: justSurpriseVM.searchController.value,
                            decoration: InputDecoration (
                                contentPadding: const EdgeInsets.all(13.0),
                                isDense: true,
                                hintText: "Search...",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      // Get.toNamed(RoutesName.searchListscreen);
                                      Get.offAndToNamed(RoutesName.productScreen, arguments: ["searchProduct", "", ""]);
                                }, icon: const Icon(Icons.search, size: 20.0, color: AppColor.spanishGrayColor)),
                                hintStyle: const TextStyle(color: AppColor.spanishGrayColor, fontSize: 13, fontFamily: "Inter"),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: AppColor.lavenderColor,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.offAndToNamed(RoutesName.productScreen, arguments: ["sameDayDelivery", "",""]);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage(IconAssets.calender), width: 18.0, height: 18.0),
                                SizedBox(width: 5.0),
                                Text("Same Day Delivery", style: TextStyle(color: AppColor.whiteColor, fontSize: 13, fontFamily: "Kanit", fontWeight: FontWeight.w600))
                              ]
                          ),
                        ),
                      ),
                    ),
                    // const VerticalDivider(color: AppColor.whiteColor, thickness: 0.8),
                    // const Expanded(
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image(image: AssetImage(IconAssets.capture), width: 20.0, height: 20.0),
                    //         SizedBox(width: 5.0),
                    //         Text("Capture the moment", style: TextStyle(color: AppColor.whiteColor, fontSize: 13, fontFamily: "Kanit", fontWeight: FontWeight.w600))
                    //       ]
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Categories", style: TextStyle(color: AppColor.jakartaColor, fontSize: 16.0, fontFamily: "Kanit")),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.toNamed(RoutesName.categoriesScreen);
                            }, child: const Text("See All", style: TextStyle(color: AppColor.jakartaColor, fontSize: 16.0, fontFamily: "Kanit")))
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.toNamed(RoutesName.productScreen, arguments: ["category", justSurpriseVM.justSurpriseResponseData.value.categorydata![index].slugUrl,justSurpriseVM.justSurpriseResponseData.value.categorydata![index].id.toString()]);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage("${Utils.imageUrl}${justSurpriseVM.justSurpriseResponseData.value.categorydata![index].image!}"),
                          ),
                          const SizedBox(height: 3.0),
                          Text(justSurpriseVM.justSurpriseResponseData.value.categorydata![index].name!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11.0, fontFamily: "Kanit"))
                        ],
                      ),
                    );
                  }, itemCount: justSurpriseVM.justSurpriseResponseData.value.categorydata?.length  // 8
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 160,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {},
                    itemBuilder: (BuildContext context, int index) {
                      return buildPage(index);
                    }, itemCount: justSurpriseVM.justSurpriseResponseData.value.bannerdata?.length,
                  ),
                ),
                const SizedBox(height: 5.0),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: justSurpriseVM.justSurpriseResponseData.value.bannerdata!.length,
                    effect: const ScaleEffect(
                        spacing: 10,
                        dotColor: AppColor.cloudColor,
                        activeDotColor: AppColor.bistreColor,
                        dotWidth: 7,
                        dotHeight: 7
                    ),
                    onDotClicked: (index) => pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Most Loved Gifts", style: TextStyle(color: AppColor.jakartaColor, fontWeight: FontWeight.bold, fontSize: 16.0, fontFamily: "Kanit")),
                      ViewAllButton(
                        title: "View All",
                        onPress: () {
                          Get.toNamed(RoutesName.productScreen, arguments: ["mostLovedGift", "",""]);
                        }
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 24/30, crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.toNamed(RoutesName.productDetailScreen, arguments: justSurpriseVM.justSurpriseResponseData.value.mostLoveGiftProducts![index].id!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.dullGrayColor,
                                blurRadius: 15.0,
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                child: Image(image: NetworkImage(Utils.imageUrl + justSurpriseVM.justSurpriseResponseData.value.mostLoveGiftProducts![index].image!))),
                            const SizedBox(height: 5.0),
                            Text(justSurpriseVM.justSurpriseResponseData.value.mostLoveGiftProducts![index].productName!, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis ,fontSize: 10, fontFamily: "Kanit", fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    );
                  }, itemCount: justSurpriseVM.justSurpriseResponseData.value.mostLoveGiftProducts?.length  // 9
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Popular in Gifting", style: TextStyle(color: AppColor.jakartaColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.toNamed(RoutesName.productScreen, arguments: ["sameDayDelivery", "",""]);
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(25.0),
                              decoration: const BoxDecoration(
                                color: AppColor.fandangoColor,
                                shape: BoxShape.circle
                              ),
                              child: const Image(image: AssetImage(ImageAssets.sameDayDelivery), width: 45.0, height: 45.0),
                            ),
                            const SizedBox(height: 10.0),
                            const Text("Same Day Delivery", style: TextStyle(color: AppColor.charlestonGreenColor, fontSize: 12, fontFamily: "Kanit"))
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.toNamed(RoutesName.productScreen, arguments: ["bestSeller", "",""]);
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(25.0),
                              decoration: const BoxDecoration(
                                  color: AppColor.fandangoColor,
                                  shape: BoxShape.circle
                              ),
                              child: const Image(image: AssetImage(ImageAssets.bestSeller), width: 45.0, height: 45.0),
                            ),
                            const SizedBox(height: 10.0),
                            const Text("Best Sellers", style: TextStyle(color: AppColor.charlestonGreenColor, fontSize: 12, fontFamily: "Kanit"))
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.toNamed(RoutesName.productScreen, arguments: ["newArrivals", "",""]);
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(25.0),
                              decoration: const BoxDecoration(
                                  color: AppColor.fandangoColor,
                                  shape: BoxShape.circle
                              ),
                              child: const Image(image: AssetImage(ImageAssets.newArrivals), width: 45.0, height: 45.0),
                            ),
                            const SizedBox(height: 10.0),
                            const Text("New Arrivals", style: TextStyle(color: AppColor.charlestonGreenColor, fontSize: 12, fontFamily: "Kanit"))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              color: AppColor.harpColor,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage(IconAssets.gift), width: 20.0, height: 20.0),
                          SizedBox(width: 10.0),
                          Text("Gift Finder", style: TextStyle(color: AppColor.blackEelColor, fontSize: 17.0, fontFamily: "Kanit"))
                        ],
                      ),
                      // Text("Clear All", style: TextStyle(color: AppColor.purpleTaupeColor, fontFamily: "Kanit"))
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonFormField<OccationData>(
                            decoration: const InputDecoration(prefixIcon: Image(image: AssetImage(IconAssets.person)), border: InputBorder.none),
                            value: occasionValue,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            hint: const Text("Occasion", style: TextStyle(color: AppColor.blackEelColor, fontSize: 15, fontFamily: "Kanit")),
                            onChanged: (OccationData? newValue) {
                              justSurpriseVM.occasionId?.value = newValue!.id!;
                            },
                            items: justSurpriseVM.occasionResponseData.value.occationData?.map((item) {
                              return DropdownMenuItem<OccationData>(
                                value: item,
                                child: Text(item.name.toString(), style: const TextStyle(color: AppColor.blackEelColor, fontSize: 15, fontFamily: "Kanit")),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: DecoratedBox(
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
                              justSurpriseVM.giftTypeId?.value = newValue!.id!;
                            },
                            items: justSurpriseVM.giftTypeResponseData.value.giftTypeData?.map((item) {
                              return DropdownMenuItem<GiftTypeData>(
                                value: item,
                                child: Text(item.name.toString(), style: const TextStyle(color: AppColor.blackEelColor, fontSize: 15, fontFamily: "Kanit"))
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      if (justSurpriseVM.occasionId?.value != 0 && justSurpriseVM.giftTypeId?.value != 0) {
                        // justSurpriseVM.findGiftApi(context, justSurpriseVM.occasionId!.value.toString() , justSurpriseVM.giftTypeId!.value.toString());
                        Get.toNamed(RoutesName.productScreen, arguments: ["giftFinder", "",""]);
                        print(justSurpriseVM.occasionId?.value.toString());
                        print(justSurpriseVM.giftTypeId?.value.toString());
                      } else {
                        if (justSurpriseVM.occasionId?.value == 0) {
                          Utils.flushBarErrorMessage('Please Select Occasion', context);
                        } else if (justSurpriseVM.giftTypeId?.value == 0) {
                          Utils.flushBarErrorMessage('Please Select giftType', context);
                        }
                      }
                     },
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      decoration: BoxDecoration(
                        color: AppColor.deepSaffronColor,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Obx(() => justSurpriseVM.isLoading.value ? const Center(child: SizedBox(width: 25.0, height: 25.0, child: CircularProgressIndicator(color: AppColor.whiteColor, strokeWidth: 3.0))) : const Text("Submit", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontFamily: "Kanit", fontWeight: FontWeight.bold)))
                    ),
                  )
                ]
              )
            ),
            const SizedBox(height: 10.0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Gifts in Trend", style: TextStyle(color: AppColor.jakartaColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.bold)),
                      ViewAllButton(
                          title: "View All",
                          onPress: () {
                            Get.toNamed(RoutesName.productScreen, arguments: ["giftInTrend", "",""]);
                          }
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 265,
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
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          // Get.toNamed(RoutesName.productScreen, arguments: ["giftInTrend", "",""]);
                          Get.toNamed(RoutesName.productDetailScreen, arguments: justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].id!);
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
                                  child: Image(image: NetworkImage(Utils.imageUrl + justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].image!))),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].productName!, maxLines: 1, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis, fontSize: 12, fontFamily: "Kanit")),
                                    const SizedBox(height: 2.0),
                                    Row(
                                      children: [
                                        Text("₹ ${justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].price!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                        const SizedBox(width: 2.0),
                                        Text("₹ ${justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].mrp!}/-", style: const TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Readex Pro")),
                                        const SizedBox(width: 2.0),
                                        Text(getDiscount(justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].mrp!, justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].price!), style: const TextStyle(color: AppColor.seaGreenColor, fontSize: 12, fontFamily: "Readex Pro")),
                                      ],
                                    ),
                                    const SizedBox(height: 5.0),
                                    Row(
                                      children: [
                                       // const Text("Earliest Delivery:", style: TextStyle(color: AppColor.graniteGrayColor, fontSize: 12, fontFamily: "Kanit")),
                                        justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].isSameDayDelivery! == "1" ?
                                        const Text("Earliest Delivery:Today", style: TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit")) :
                                        const Text("", style: TextStyle(color: AppColor.blackEelColor, fontSize: 12, fontFamily: "Kanit"))
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
                                          Text(justSurpriseVM.justSurpriseResponseData.value.giftTrendsData![index].rating!, style: const TextStyle(color: AppColor.whiteColor, fontSize: 10.0, fontFamily: "Kanit")),
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
                    }, itemCount: justSurpriseVM.justSurpriseResponseData.value.giftTrendsData?.length,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 140,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: saleDataPageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {},
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(RoutesName.productScreen, arguments: ["getAllSaleProduct", "",""]);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: const RadialGradient(
                                radius: 1.5,
                                colors: [
                                  AppColor.catskillWhiteColor,
                                  AppColor.lavenderMistColor,
                                  AppColor.ghostColor
                                ]
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Image(image: AssetImage(ImageAssets.justSurprise), width: 150.0, height: 50.0),
                            Image(image: NetworkImage("${Utils.imageUrl}${justSurpriseVM.justSurpriseResponseData.value.saledata![index].image!}"), width: 180.0, height: 100.0),
                          ],
                        )
                    ),
                  );
                }, itemCount: justSurpriseVM.justSurpriseResponseData.value.saledata?.length,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Pick Their Fav Flowers", style: TextStyle(color: AppColor.jakartaColor, fontWeight: FontWeight.bold, fontSize: 16.0, fontFamily: "Kanit")),
                      ViewAllButton(
                          title: "View All",
                          onPress: () {
                            Get.toNamed(RoutesName.productScreen, arguments: ["pickTheirFlowers", "",""]);
                          }
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 24/30, crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          // Get.toNamed(RoutesName.productScreen, arguments: ["pickTheirFlowers", "",""]);
                          Get.toNamed(RoutesName.productDetailScreen, arguments: justSurpriseVM.justSurpriseResponseData.value.favFlowerData![index].id!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.dullGrayColor,
                                  blurRadius: 15.0,
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                  child: Image(image: NetworkImage(Utils.imageUrl + justSurpriseVM.justSurpriseResponseData.value.favFlowerData![index].image!))),
                              const SizedBox(height: 5.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                                child: Text(justSurpriseVM.justSurpriseResponseData.value.favFlowerData![index].productName!, textAlign: TextAlign.center, maxLines: 1, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis, fontSize: 10, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                      );
                    }, itemCount: justSurpriseVM.justSurpriseResponseData.value.favFlowerData?.length,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Bakery Fresh Cakes", style: TextStyle(color: AppColor.jakartaColor, fontWeight: FontWeight.bold, fontSize: 16.0, fontFamily: "Kanit")),
                      ViewAllButton(
                          title: "View All",
                          onPress: () {
                            Get.toNamed(RoutesName.productScreen, arguments: ["bakeryFreshCakes", "",""]);
                          }
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 24/30, crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          // Get.toNamed(RoutesName.productScreen, arguments: ["bakeryFreshCakes", "",""]);
                          Get.toNamed(RoutesName.productDetailScreen, arguments: justSurpriseVM.justSurpriseResponseData.value.bakeryData![index].id!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.dullGrayColor,
                                  blurRadius: 15.0,
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                  child: Image(image: NetworkImage(Utils.imageUrl + justSurpriseVM.justSurpriseResponseData.value.bakeryData![index].image!))),
                              const SizedBox(height: 5.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                                child: Text(justSurpriseVM.justSurpriseResponseData.value.bakeryData![index].productName!, maxLines: 1, textAlign: TextAlign.center, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis, fontSize: 10, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                      );
                    }, itemCount: justSurpriseVM.justSurpriseResponseData.value.bakeryData?.length,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Gifts That Tell Stories", style: TextStyle(color: AppColor.jakartaColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.bold)),
                  ViewAllButton(
                      title: "View All",
                      onPress: () {
                        Get.toNamed(RoutesName.productScreen, arguments: ["giftTellStories", "",""]);
                      }
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 140,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.dullGrayColor,
                      blurRadius: 15,
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
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      // Get.toNamed(RoutesName.productScreen, arguments: ["giftTellStories", "",""]);
                      Get.toNamed(RoutesName.productDetailScreen, arguments: justSurpriseVM.justSurpriseResponseData.value.giftTellStoryData![index].id!);
                    },
                    child: Container(
                      width: 110,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                              child: Image(image: NetworkImage(Utils.imageUrl + justSurpriseVM.justSurpriseResponseData.value.giftTellStoryData![index].image!))),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                            child: Text(justSurpriseVM.justSurpriseResponseData.value.giftTellStoryData![index].productName!, maxLines: 1, textAlign: TextAlign.center, style: const TextStyle(color: AppColor.charlestonGreenColor, overflow: TextOverflow.ellipsis, fontSize: 10, fontFamily: "Kanit")),
                          )
                        ],
                      ),
                    ),
                  );
                }, itemCount: justSurpriseVM.justSurpriseResponseData.value.giftTellStoryData?.length,
              ),
            ),
            const SizedBox(height: 20.0),
          ]
      ),
    ) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)) : Center(
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

  String getDiscount(String mrp, String price) {
    var discount = ((double.parse(mrp) - double.parse(price)) / double.parse(mrp) * 100);
    return "${discount.toInt()}% off";
  }

  Widget buildPage(int index) => InkWell(
    onTap: () {
      Get.toNamed(RoutesName.productScreen, arguments: ["category", justSurpriseVM.justSurpriseResponseData.value.bannerdata![index].slugUrl,justSurpriseVM.justSurpriseResponseData.value.bannerdata![index].id.toString()]);
    },
    child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gradient: LinearGradient(
                colors: [
                  AppColor.cinderColor,
                  AppColor.eclipseColor,
                  AppColor.darkJungleGreenColor,
                  AppColor.darkJungleGreenColor
                ]
            )),
        child: Padding(padding: const EdgeInsets.all(15.0),
            child: Stack(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Image(image: AssetImage(IconAssets.tag), width: 15.0, height: 15.0),
                            SizedBox(width: 5.0),
                            Text("New Arrivals", style: TextStyle(color: AppColor.apacheColor, fontSize: 13, fontFamily: "Kanit")),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Text(justSurpriseVM.justSurpriseResponseData.value.bannerdata![index].title!, style: const TextStyle(color: AppColor.whiteColor, fontSize: 15, fontFamily: "Judson", fontWeight: FontWeight.w700)),
                        const SizedBox(height: 5.0),
                        Text(justSurpriseVM.justSurpriseResponseData.value.bannerdata![index].description!, style: const TextStyle(color: AppColor.apacheColor, fontSize: 13, fontFamily: "Kanit")),
                        const SizedBox(height: 5.0),
                        Container(
                          padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                              color: AppColor.deepSaffronColor,
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          child: Text(justSurpriseVM.justSurpriseResponseData.value.bannerdata![index].btnText!, style: const TextStyle(color: AppColor.whiteColor, fontSize: 13, fontFamily: "Kanit")),
                        ),
                      ]
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image(image: NetworkImage("${Utils.imageUrl}${justSurpriseVM.justSurpriseResponseData.value.bannerdata![index].image!}"), width: 150.0, height: 150.0))
                ]
            )
        )
    ),
  );
}
