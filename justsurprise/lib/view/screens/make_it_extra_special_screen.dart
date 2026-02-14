import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/make_it_extra_special_view_model.dart';
import '../../res/assets/icon_assets.dart';
import '../../res/routes/routes_name.dart';
import '../../view_models/controller/home_view_model.dart';
import '../../view_models/controller/product_detail_view_model.dart';

class MakeItExtraSpecialScreen extends StatefulWidget {
  const MakeItExtraSpecialScreen({super.key});

  @override
  State<MakeItExtraSpecialScreen> createState() => _MakeItExtraSpecialScreenState();
}

class _MakeItExtraSpecialScreenState extends State<MakeItExtraSpecialScreen> {
  final makeItExtraVM = Get.put(MakeItExtraSpecialViewModel());
  final productDetailVM = Get.find<ProductDetailViewModel>();
  final homeVM = Get.find<HomeViewModel>();
  final typeController = productSelected();
  final methodController = Get.put(selectdMethod());
  final timeController = Get.put(selectdTime());
  final ScrollController _Controller = ScrollController();
  int selectedIndex = 0;



  increaseNumber(int index){
    setState(() {
      makeItExtraVM.addonProductData[index].quantity = int.parse(makeItExtraVM.addonProductData[index].quantity.toString())+1;
      print("inc:-${makeItExtraVM.addonProductData[index].quantity}");
    });
  }

  decressNumber(int index){
    setState(() {
      if(makeItExtraVM.addonProductData[index].quantity != 0){
        makeItExtraVM.addonProductData[index].quantity = int.parse(makeItExtraVM.addonProductData[index].quantity.toString())-1;
      }
      print("dic:-${makeItExtraVM.addonProductData[index].quantity}");
    });
  }

  @override
  void initState() {
    super.initState();
    makeItExtraVM.isBottom.value = false;
    _checkConnection();
    makeItExtraVM.addonApi(context,makeItExtraVM.page);

    _Controller.addListener(() {
      if(_Controller.position.maxScrollExtent == _Controller.offset){
        makeItExtraVM.page++;
        makeItExtraVM.isBottom.value = true;
        if(makeItExtraVM.page <= makeItExtraVM.totalPage.value){
          makeItExtraVM.addonApi(context,makeItExtraVM.page);
        }
      }else{
        makeItExtraVM.isBottom.value = false;
      }
    },);
  }

  manageBottomLoder(){
    if(int.parse(makeItExtraVM.currentPage.value) == makeItExtraVM.totalPage.value){
      return SizedBox(width: 0);
    }else{
      return makeItExtraVM.isBottom.value ? Align(alignment : Alignment.bottomCenter,child: Padding(padding: const EdgeInsets.all(10.0), child: CircularProgressIndicator())) : SizedBox(width: 0);
    }

  }

  bool checkNullData() {
    if (makeItExtraVM.addonProductData.length == 0) {
      return false;
    }
    return true;
  }

  bool getIsLoading() {
    return !makeItExtraVM.isSearchLoading.value;
  }

  Future<void> _checkConnection() async {
    makeItExtraVM.isConnected.value = await Utils.isConnected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("Make it extra special!", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ),
      body: Obx(() => makeItExtraVM.isConnected.value ? getIsLoading() ? checkNullData() ? SafeArea(
        child: Container(
          color: AppColor.whiteColor,
          child: Stack(
            children: [
              GridView.builder(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 55.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 20 / 34, crossAxisCount: 2, crossAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.cottonSeedColor, width: 0.56),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11.0),
                              child: Image(
                                  image: NetworkImage(Utils.imageUrl+makeItExtraVM.addonProductData[index].image!)
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text(makeItExtraVM.addonProductData[index].productName!, style: TextStyle(color: AppColor.blackEelColor, overflow: TextOverflow.ellipsis, fontSize: 12.25, fontFamily: "Kanit", fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(height: 2.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text("₹ ${makeItExtraVM.addonProductData[index].mrp}/-", style: TextStyle(color: AppColor.blackEelColor, fontSize: 12.25, fontFamily: "Readex Pro", fontWeight: FontWeight.w400)),
                          ),
                          const Divider(color: AppColor.cottonSeedColor, thickness: 0.6),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() {
                                  return Radio(
                                    value: makeItExtraVM.addonProductData[index].id.toString(),
                                    groupValue: typeController.selectdType.value,
                                    onChanged: (value) {
                                      selectedIndex = index;
                                      typeController.onChanged(value);
                                      print(typeController.selectdType.value.toString());
                                    },
                                  );
                                },),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          decressNumber(index);
                                        },
                                        child: Text("-", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Readex Pro", fontSize: 20, fontWeight: FontWeight.w400))),
                                    const SizedBox(width: 5.0),
                                    Text(makeItExtraVM.addonProductData[index].quantity.toString(),style: TextStyle(color: AppColor.smokeyGrayColor, fontSize: 20, fontFamily: "Kanit", fontWeight: FontWeight.w400,)),
                                    const SizedBox(width: 5.0),
                                    InkWell(
                                      onTap: () {
                                        increaseNumber(index);
                                      },
                                        child: Text("+", style: TextStyle(color: AppColor.blackEelColor, fontFamily: "Readex Pro", fontSize: 20, fontWeight: FontWeight.w400)))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  );
                }, itemCount: makeItExtraVM.addonProductData.length,
              ),
              manageBottomLoder(),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                   if(typeController.selectdType.value != ""){
                     makeItExtraVM.addonCartApi(
                         makeItExtraVM.addonProductData[selectedIndex].quantity,true,context,
                         productDetailVM.deliveryDate.value,
                         typeController.selectdType.value.toString(),
                         methodController.selectdMethodType.value.toString(),
                         methodController.selectdPriceType.value.toString(),
                         timeController.selectdTimeType.value.toString(),
                     );
                   }
                   makeItExtraVM.addCartApi(false,
                           context,
                           productDetailVM.deliveryDate.value,
                           productDetailVM.productDetailResponseData.value.productData!.id.toString(),
                           methodController.selectdMethodType.value.toString(),
                           methodController.selectdPriceType.value.toString(),
                           timeController.selectdTimeType.value.toString(),
                     );
                   },
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    color: AppColor.deepSaffronColor,
                    child: typeController.selectdType.value == "" ?
                         Text("Continue Without Add Ons", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 18, fontFamily: "Kanit", fontWeight: FontWeight.w500))
                        :Text("Continue", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 18, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ) : const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor)))
          : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)) :
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
      )
      )
    );
  }
}
