import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../res/routes/routes_name.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.red,
              ),
              child: const Icon(
                Icons.highlight_remove,
                color: Colors.white,
                size: 40,
              )),
          const Text(
            "paymentFailed",
            style: TextStyle(color: Colors.red, fontSize: 24),
          ),
        const SizedBox(height: 20,),
          ElevatedButton(
            style:ElevatedButton.styleFrom(
              
              padding: const EdgeInsets.symmetric(horizontal: 40),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.black,
            ),
              onPressed: () {
                Get.toNamed(RoutesName.cartFragmentScreen);
              },
              child: const Text("goBackToCart",style: TextStyle(color: Colors.white),)),
        ],
      ),
    );
  }
}
