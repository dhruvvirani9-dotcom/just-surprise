import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../res/colors/app_color.dart';

class Utils {

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static const String imageUrl = "https://thepurehearts.in/";

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message, messageColor: AppColor.whiteColor,
          backgroundColor: AppColor.blackColor,
          flushbarPosition: FlushbarPosition.BOTTOM,
          borderRadius: BorderRadius.circular(5.0),
          margin: const EdgeInsets.all(10.0),
          isDismissible: false,
          messageSize: 17.0,
          duration: const Duration(seconds: 2),
        )..show(context)
    );
  }

  static Future<String?> pickImage({ImageSource imageSource = ImageSource.gallery}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: imageSource, imageQuality: 100, maxWidth: 500, maxHeight: 500);
    if (image != null) {
      return image.path;
    } else {
      return null;
    }
  }

  static showLoaderDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            content: Row(
              children: [
                const CircularProgressIndicator(strokeWidth: 2.0),
                Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    child:const Text("Processing..." )),
              ]
            ),
          ),
        );
      },
    );
  }

  static Future<bool> isConnected() async {
    final List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  static noInternetDialog(BuildContext context) {
    showDialog(
      context:context,
      builder:(BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection', style: TextStyle(fontSize: 20)),
          content: const Text('Please check your internet connection and try again.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              }, child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}