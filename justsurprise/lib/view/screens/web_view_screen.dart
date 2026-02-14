import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../view_models/controller/product_detail_view_model.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController controller = WebViewController();
  final productDetailVM = Get.put(ProductDetailViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebViewWidget(
            controller: controller
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {

                  },
                  onPageStarted: (String url) {

                  },
                  onPageFinished: (String url) {

                  },
                  onWebResourceError: (WebResourceError error) {},
                ),
              )..loadRequest(Uri.parse(requestUrl()))
        )
      ),
    );
  }

  String requestUrl() {
    if (Get.arguments == 'careers') {
      return 'https://thepurehearts.in/careers';
    } else if (Get.arguments == 'aboutUs') {
      return 'https://thepurehearts.in/about_us';
    } else if (Get.arguments == 'testimonials') {
      return 'https://thepurehearts.in/testimonials';
    } else if (Get.arguments == 'blog') {
      return 'https://thepurehearts.in/blogs';
    } else if (Get.arguments == 'term') {
      return 'https://thepurehearts.in/terms_conditions';
    } else if (Get.arguments == 'productInfo') {
      return productDetailVM.productDetailResponseData.value.productData!.shareUrl!;
    }
    return '';
  }
}
