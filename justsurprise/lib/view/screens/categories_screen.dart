import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/categories_view_model.dart';
import '../../data/response/status.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final categoriesVM = Get.put(CategoriesViewModel());

  @override
  void initState() {
    super.initState();
    _checkConnection();
    categoriesVM.categoryApi(context);
  }

  Future<void> _checkConnection() async {
    categoriesVM.isConnected.value = await Utils.isConnected();
  }

  bool getIsLoading() {
    if(categoriesVM.rxRequestStatus.value == Status.LOADING) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("Category", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
        actions: [
          IconButton(icon: const Image(image: AssetImage(IconAssets.search), color: AppColor.whiteColor, width: 25.0, height: 25.0),
            onPressed: () {},
          )
        ],
      ),
      body: Obx(() => categoriesVM.isConnected.value ? getIsLoading() ? categoriesVM.categoryResponseData.value.categoryViewAllData != null ? SafeArea(
        child: Container(
            color: AppColor.whiteColor,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12.0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(RoutesName.productScreen, arguments: ["category", categoriesVM.categoryResponseData.value.categoryViewAllData![index].slugUrl, categoriesVM.categoryResponseData.value.categoryViewAllData![index].id.toString()]);
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage("${Utils.imageUrl}${categoriesVM.categoryResponseData.value.categoryViewAllData![index].image}"),
                        ),
                        const SizedBox(width: 20.0),
                        Text(categoriesVM.categoryResponseData.value.categoryViewAllData![index].name!, style: const TextStyle(color: AppColor.charlestonGreenColor, fontSize: 18, fontFamily: "Kanit"))
                      ],
                    ),
                  ),
                );
                }, itemCount: categoriesVM.categoryResponseData.value.categoryViewAllData!.length,
            )
        ),
      ) : const Center(child: Text("No Data Found", style: TextStyle(color: AppColor.blackColor))) : const Center(child: CircularProgressIndicator(color: AppColor.blackColor, strokeWidth: 3.0)) : Center(
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
      )),
    );
  }
}
