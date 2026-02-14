import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:justsurprise/res/colors/app_color.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/shared_preferences_services.dart';
import 'package:justsurprise/utils/utils.dart';
import 'package:justsurprise/view_models/controller/update_profile_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late final updateProfileVM = Get.put(UpdateProfileViewModel());
  var items = ["male", "female", "other"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPrefData();
  }

  Future<void> getSharedPrefData() async {
    updateProfileVM.userNameController.value.text = (await SharedPref.getUserName())!;
    updateProfileVM.emailController.value.text = (await SharedPref.getUserEmail())!;
    updateProfileVM.mobileNumController.value.text = (await SharedPref.getUserNumber())!;
    updateProfileVM.birthDate.value = (await SharedPref.getUserDob())!;
    updateProfileVM.anniversaryDate.value = (await SharedPref.getUserAnniversaryDate())!;
    updateProfileVM.gender.value = (await SharedPref.getUserGender())!;
    print("gender:-${updateProfileVM.gender.value}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lavenderColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title: const Text("My Profile", style: TextStyle(color: AppColor.whiteColor, fontSize: 16, fontFamily: "Kanit")),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: AppColor.whiteColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    controller: updateProfileVM.userNameController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Username",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.person, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: updateProfileVM.mobileNumController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Mobile No.",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.phone, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: updateProfileVM.emailController.value,
                    style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      hintText: "Email",
                      hintStyle: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.email, color: AppColor.graniteGrayColor, size: 20.0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Obx(() => TextField(
                      controller: TextEditingController(text: updateProfileVM.birthDate.value),
                      style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                        hintText: "Date of Birth",
                        hintStyle: const TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                        prefixIcon: const Icon(Icons.cake, color: AppColor.graniteGrayColor, size: 20.0),
                        suffixIcon: GestureDetector(onTap: () => getBirthDate(), child: const Icon(Icons.calendar_month, color: AppColor.graniteGrayColor, size: 20.0)),
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1)),
                      ),
                    )),
                  const SizedBox(height: 5.0),
                  Obx(() => TextField(
                      controller: TextEditingController(text: updateProfileVM.anniversaryDate.value),
                      style: const TextStyle(color: AppColor.eerieBlackColor, fontFamily: "Inter", fontSize: 15.0),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                        hintText: "Date of Anniversary",
                        hintStyle: const TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter", fontWeight: FontWeight.w300),
                        prefixIcon: const Icon(Icons.accessibility, color: AppColor.graniteGrayColor, size: 20.0),
                        suffixIcon: GestureDetector(onTap: () => getAnniversaryDate(), child: const Icon(Icons.calendar_month, color: AppColor.graniteGrayColor, size: 20.0)),
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.0)),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.0)),
                      ),
                    )),
                  const SizedBox(height: 5.0),
                  Obx(() => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.0)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.greenWhiteColor, width: 1.0)),
                      prefixIcon: Icon(Icons.person, color: AppColor.graniteGrayColor, size: 20.0),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 20.0),
                    hint: const Text("Gender", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13.0, fontFamily: "Inter")),
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      updateProfileVM.gender.value = newValue!;
                    },
                    value: updateProfileVM.gender.value,
                  ),),
                  const SizedBox(height: 10.0),
                  InkWell(
                    onTap: () => Get.toNamed(RoutesName.addressScreen),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.greenWhiteColor, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.perm_contact_cal_rounded, color: AppColor.graniteGrayColor, size: 20.0),
                              SizedBox(width: 10.0),
                              Text("Address", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13, fontFamily: "Inter", fontWeight: FontWeight.w300))
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, color: AppColor.blackColor, size: 15.0)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  InkWell(
                    onTap: () => Get.toNamed(RoutesName.forgotPasswordScreen),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.greenWhiteColor, width: 1.0),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lock_open, color: AppColor.graniteGrayColor, size: 20.0),
                              SizedBox(width: 10.0),
                              Text("Change Password", style: TextStyle(color: AppColor.spanishGrayColor, fontSize: 13, fontFamily: "Inter", fontWeight: FontWeight.w300))
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, color: AppColor.blackColor, size: 15.0)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                           Get.back();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            decoration: BoxDecoration(
                                color: AppColor.smokeyGrayColor,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: const Text("Cancel", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (updateProfileVM.userNameController.value.text.isNotEmpty && updateProfileVM.mobileNumController.value.text.isNotEmpty && updateProfileVM.emailController.value.text.isNotEmpty) {
                              updateProfileVM.updateProfileApi(context);
                            } else {
                              if (updateProfileVM.userNameController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage("Please Enter Your Name", context);
                              } else if (updateProfileVM.mobileNumController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage("Please Enter Your Mobile Number", context);
                              } else if (updateProfileVM.emailController.value.text.isEmpty) {
                                Utils.flushBarErrorMessage("Please Enter Your Email", context);
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            decoration: BoxDecoration(
                                color: AppColor.deepSaffronColor,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Obx(() => updateProfileVM.loading.value ? const Center(child: SizedBox(width: 25.0, height: 25.0, child: CircularProgressIndicator(color: AppColor.whiteColor, strokeWidth: 3.0))) : const Text("Save", textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor, fontSize: 16.0, fontFamily: "Kanit", fontWeight: FontWeight.w500))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getBirthDate() async {
    DateTime? datePicked = await showDatePicker (
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2040));
    if (datePicked != null) {
      updateProfileVM.birthDate.value = "${datePicked.toLocal()}".split(' ')[0];
    }
  }

  getAnniversaryDate() async {
    DateTime? datePicked = await showDatePicker (
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2040));
    if (datePicked != null) {
      updateProfileVM.anniversaryDate.value = "${datePicked.toLocal()}".split(' ')[0];
    }
  }
}
