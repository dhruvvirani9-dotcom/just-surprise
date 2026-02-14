import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justsurprise/res/assets/icon_assets.dart';
import 'package:justsurprise/res/assets/image_assets.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/view/fragments/cart.dart';
import 'package:justsurprise/view/fragments/categories.dart';
import 'package:justsurprise/view/fragments/just_surprise.dart';
import 'package:justsurprise/view/fragments/orders.dart';
import 'package:justsurprise/view_models/controller/home_view_model.dart';

import '../../utils/shared_preferences_services.dart';
import '../../view_models/controller/address_view_model.dart';
import '../../view_models/controller/cart_fragment_view_model.dart';
import '../../view_models/controller/login_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeVM = Get.put(HomeViewModel());
  final loginVM = Get.put(LogInViewModel());
  final List<Widget> pages = <Widget>[
    const JustSurpriseFragment(),
    const CategoriesFragment(),
    const OrdersFragment(),
    const CartFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Obx(() => pages.elementAt(homeVM.selectTab.value)),
        bottomNavigationBar: Container(
            height: 80.0,
            padding: const EdgeInsets.only(left: 10, right: 10.0, top: 10.0),
            decoration:
                const BoxDecoration(color: AppColor.whiteColor, boxShadow: [
              BoxShadow(
                color: AppColor.blackBeanColor,
                blurRadius: 15,
                offset: Offset(5, 0), // changes position of shadow
              ),
            ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      homeVM.selectTab.value = 0;
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: homeVM.selectTab.value == 0
                                    ? AppColor.dullOrangeColor
                                    : AppColor.greenWhiteColor,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.dullLightColor,
                                    blurRadius: 20,
                                  ),
                                ]),
                            child: const Image(
                                image: AssetImage(IconAssets.surprise),
                                width: 25.0,
                                height: 25.0),
                          ),
                          const Text("Just surprise",
                              style: TextStyle(
                                  color: AppColor.charlestonGreenColor,
                                  fontSize: 12.0,
                                  fontFamily: "Kanit"))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      homeVM.selectTab.value = 1;
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: homeVM.selectTab.value == 1
                                    ? AppColor.dullOrangeColor
                                    : AppColor.greenWhiteColor,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.dullLightColor,
                                    blurRadius: 20,
                                  ),
                                ]),
                            child: const Image(
                                image: AssetImage(IconAssets.categories),
                                width: 25.0,
                                height: 25.0),
                          ),
                          const Text("Categories",
                              style: TextStyle(
                                  color: AppColor.charlestonGreenColor,
                                  fontSize: 12.0,
                                  fontFamily: "Kanit"))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      homeVM.selectTab.value = 2;
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: homeVM.selectTab.value == 2
                                    ? AppColor.dullOrangeColor
                                    : AppColor.greenWhiteColor,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.dullLightColor,
                                    blurRadius: 20,
                                  ),
                                ]),
                            child: const Image(
                                image: AssetImage(IconAssets.order),
                                width: 25.0,
                                height: 25.0),
                          ),
                          const Text("Orders",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontFamily: "Kanit"))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      homeVM.selectTab.value = 3;
                      final cartVM = Get.find<CartFragmentViewModel>();
                      final addressVM = Get.find<AddressViewModel>();
                      cartVM.viewCartApi(context);
                      var id = await SharedPref.getUserid();
                      print(id);
                      addressVM.viewAddressApi(context, id!);
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: homeVM.selectTab.value == 3
                                    ? AppColor.dullOrangeColor
                                    : AppColor.greenWhiteColor,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.dullLightColor,
                                    blurRadius: 20,
                                  ),
                                ]),
                            child: const Image(
                                image: AssetImage(IconAssets.cart),
                                width: 25.0,
                                height: 25.0),
                          ),
                          const Text("Cart",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontFamily: "Kanit"))
                        ],
                      ),
                    ),
                  ),
                ])),
        drawer: Drawer(
          backgroundColor: AppColor.whiteColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    DrawerHeader(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            AppColor.mangoTangoColor,
                            AppColor.fandangoColor,
                          ],
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        _showPicker(context);
                                      },
                                      child: Obx(
                                        () => homeVM.imagePath.value != ''
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                child: Image.file(
                                                    File(
                                                        homeVM.imagePath.value),
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.fill))
                                            : const Image(
                                                image: AssetImage(
                                                    ImageAssets.female),
                                                fit: BoxFit.fill,
                                                width: 100.0,
                                                height: 100.0),
                                      )),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: const BoxDecoration(
                                              color: AppColor.fandangoColor,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        AppColor.darkGrayColor,
                                                    blurRadius: 25.0)
                                              ]),
                                          child: const Image(
                                              image:
                                                  AssetImage(IconAssets.camera),
                                              width: 12.0,
                                              height: 12.0)))
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Stack(
                              children: [
                                const Column(
                                  children: [
                                    Center(
                                        child: Text("Areon Fostee",
                                            style: TextStyle(
                                                color: AppColor.whiteColor,
                                                fontSize: 12,
                                                fontFamily: "Kanit",
                                                fontWeight: FontWeight.w400))),
                                    Center(
                                        child: Text("BGILOP0123456",
                                            style: TextStyle(
                                                color: AppColor.whiteColor,
                                                fontSize: 12,
                                                fontFamily: "Kanit",
                                                fontWeight: FontWeight.w400))),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 70.0),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                                RoutesName.profileScreen);
                                          },
                                          child: const Image(
                                              image:
                                                  AssetImage(IconAssets.edit),
                                              color: AppColor.whiteColor,
                                              width: 14.0,
                                              height: 14.0))),
                                ),
                              ],
                            ),
                          ],
                        )),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.user),
                        text: "Profile",
                        onTap: () => {Get.toNamed(RoutesName.profileScreen)}),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.addressBook),
                        text: "Addresses",
                        onTap: () => {Get.toNamed(RoutesName.addressScreen)}),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.faq),
                        text: "FAQ",
                        onTap: () => {Get.toNamed(RoutesName.faqScreen)}),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.comment),
                        text: "Contact Us",
                        onTap: () => {Get.toNamed(RoutesName.contactScreen)}),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.searchCareer),
                        text: "Careers",
                        onTap: () => {
                              Get.toNamed(RoutesName.webViewScreen,
                                  arguments: 'careers')
                            }),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.aboutUs),
                        text: "About us",
                        onTap: () => {
                              Get.toNamed(RoutesName.webViewScreen,
                                  arguments: 'aboutUs')
                            }),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.favoriteFeedback),
                        text: "Testimonials",
                        onTap: () => {
                              Get.toNamed(RoutesName.webViewScreen,
                                  arguments: 'testimonials')
                            }),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.blogger),
                        text: "Blog",
                        onTap: () => {
                              Get.toNamed(RoutesName.webViewScreen,
                                  arguments: 'blog')
                            }),
                    CustomListTile(
                        icon: const AssetImage(IconAssets.conditionDocument),
                        text: "Terms & conditions",
                        onTap: () => {
                              Get.toNamed(RoutesName.webViewScreen,
                                  arguments: 'term')
                            }),
                  ],
                ),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 20.0),
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border:
                        Border.all(color: AppColor.chardonnayColor, width: 1.0),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColor.seashellColor,
                      ),
                      BoxShadow(
                        color: AppColor.dullGrayColor,
                        spreadRadius: 0.0,
                        offset: Offset(-6, 7),
                        blurRadius: 25.0,
                      )
                    ]),
                child: Row(
                  children: [
                    Image(
                        image: AssetImage(IconAssets.logout),
                        width: 18.0,
                        height: 18.0),
                    SizedBox(width: 7.0),
                    InkWell(
                      onTap: () {
                        loginVM.logoutValue();
                        Get.offAndToNamed(RoutesName.onBoardingScreen);
                      },
                      child: Text("Logout",
                          style: TextStyle(
                              color: AppColor.jakartaColor,
                              fontSize: 16,
                              fontFamily: "Kanit",
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future _imgFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedFile != null) {
      homeVM.imagePath.value = pickedFile.path;
    }
  }

  Future _imgFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedFile != null) {
      homeVM.imagePath.value = pickedFile.path;
    }
  }
}

class CustomListTile extends StatelessWidget {
  AssetImage icon;
  String text;
  VoidCallback onTap;

  CustomListTile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: AppColor.platinumColor, width: 0.6))),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(image: icon, width: 18.0, height: 18.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(text,
                        style: const TextStyle(
                            color: AppColor.jakartaColor,
                            fontSize: 16,
                            fontFamily: "Kanit",
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
              const Image(
                  image: AssetImage(IconAssets.rightArrow),
                  color: AppColor.blackColor,
                  width: 16.0,
                  height: 16.0)
            ],
          ),
        ),
      ),
    );
  }
}
