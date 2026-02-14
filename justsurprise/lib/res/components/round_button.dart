import 'package:flutter/material.dart';
import '../colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.loading = false,
    required this.title,
    this.height = 51,
    this.width = 100,
    required this.onPress,
    this.textColor = AppColor.whiteColor,
    this.buttonColor = AppColor.deepSaffronColor
  });

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: loading ?
          const Center(child: CircularProgressIndicator(color: AppColor.whiteColor, strokeWidth: 3.0)) :
          Center(child: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColor.whiteColor, fontSize: 16, fontWeight: FontWeight.w700, fontFamily: "ProductSans")))),
    );
  }
}
